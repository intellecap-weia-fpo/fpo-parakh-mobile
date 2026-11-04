import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';
import '../../utils/scalars.dart';

class CompliancesScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const CompliancesScreen({
    super.key,
    required this.formYear,
    this.currentStep = 6,
  });

  @override
  State<CompliancesScreen> createState() => _CompliancesScreenState();
}

class _CompliancesScreenState extends State<CompliancesScreen> {
  // Controllers for the table - 4 rows x 3 input columns (Date, Place, Reg No.)
  // Row 1: Company Act / Co-operative Societies Act
  String? _fpoIncorporationDate; // Date from FPO Details
  final _companyActPlaceController = TextEditingController();
  final _companyActRegNoController = TextEditingController();

  // Certificate of GST registration
  final _gstDateController = TextEditingController();
  final _gstPlaceController = TextEditingController();
  final _gstRegNoController = TextEditingController();

  // Income Tax registrations
  final _panController = TextEditingController();
  final _tanController = TextEditingController();

  // Act under which registered dropdown
  Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
  _selectedActUnderRegistered;
  final List<Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices>
  _actOptions = [
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.COMPANY_ACT,
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
        .COOPERATIVE_SOCIETIES_ACT,
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER,
  ];

  bool _isSubmitting = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  Future<void> _loadExistingData() async {
    try {

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null) {
        if (submission.complianceDetails != null) {
          final complianceData = submission.complianceDetails!;
          _populateComplianceData(complianceData, submission);
        } else {
          // Still call to extract FPO details even if no compliance data exists
          _populateComplianceData(null, submission);
        }
      }
    } catch (e, stack) {
      debugPrint('Compliance: Error loading existing data: $e');
      debugPrint('Compliance: Stack trace: $stack');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _populateComplianceData(dynamic complianceData, [dynamic submission]) {
    if (!mounted) return;

    setState(() {
      _selectedActUnderRegistered = complianceData?.actUnderRegistered;

      // Extract FPO incorporation date from submission
      if (submission?.fpoDetails?.dateOfIncorporation != null) {
        final dateTime = dateFromJson(submission.fpoDetails!.dateOfIncorporation);
        if (dateTime != null) {
          _fpoIncorporationDate = '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
        }
      }

      // Company Act fields
      _companyActPlaceController.text =
          complianceData?.placeOfRegistration ?? '';
      _companyActRegNoController.text = complianceData?.registrationNo ?? '';

      // GST fields - use try-catch for optional fields
      try {
        if (complianceData?.gstDate != null) {
          final dateTime = dateFromJson(complianceData!.gstDate);
          if (dateTime != null) {
            _gstDateController.text =
                '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
          }
        }
      } catch (e) {
        _gstDateController.text = '';
      }

      try {
        _gstPlaceController.text = complianceData?.gstPlace ?? '';
      } catch (e) {
        _gstPlaceController.text = '';
      }

      try {
        _gstRegNoController.text = complianceData?.gstRegNo ?? '';
      } catch (e) {
        _gstRegNoController.text = '';
      }

      // PAN and TAN
      _panController.text = complianceData?.permanentAccountNumber ?? '';
      _tanController.text = complianceData?.taxAccountNumber ?? '';
    });
  }


  String _getDisplayTextForEnum(
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices enumValue,
  ) {
    switch (enumValue) {
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COMPANY_ACT:
        return 'Company Act';
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COOPERATIVE_SOCIETIES_ACT:
        return 'Co-operative Societies Act';
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER:
        return 'Other';
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .$unknown:
        return 'Unknown';
    }
  }

  Enum$ActRegisteredTypeEnum? _mapToActRegisteredTypeEnum(
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices sourceEnum,
  ) {
    switch (sourceEnum) {
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COMPANY_ACT:
        return Enum$ActRegisteredTypeEnum.COMPANY_ACT;
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .COOPERATIVE_SOCIETIES_ACT:
        return Enum$ActRegisteredTypeEnum.COOPERATIVE_SOCIETIES_ACT;
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER:
        return Enum$ActRegisteredTypeEnum.OTHER;
      case Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
          .$unknown:
        return null;
    }
  }

  Future<bool> _validateForm() async {
    if (_selectedActUnderRegistered == null) {
      _showValidationError('Please select Act under which registered');
      return false;
    }
    if (_fpoIncorporationDate == null || _fpoIncorporationDate!.isEmpty) {
      _showValidationError('Registration date not available from FPO details');
      return false;
    }
    if (_companyActPlaceController.text.trim().isEmpty) {
      _showValidationError('Please enter place of registration');
      return false;
    }
    if (_companyActRegNoController.text.trim().isEmpty) {
      _showValidationError('Please enter registration number');
      return false;
    }
    if (_panController.text.trim().isEmpty) {
      _showValidationError('Please enter PAN number');
      return false;
    }
    if (_tanController.text.trim().isEmpty) {
      _showValidationError('Please enter TAN number');
      return false;
    }
    return true;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Future<void> _handleNext() async {
    if (!await _validateForm()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final complianceInput = Input$ComplianceDetailsSubmissionInput(
        actUnderRegistered: _selectedActUnderRegistered != null
            ? _mapToActRegisteredTypeEnum(_selectedActUnderRegistered!)
            : null,
        dateOfRegistration: _fpoIncorporationDate != null && _fpoIncorporationDate!.isNotEmpty
            ? CalendarDate.parse(_fpoIncorporationDate!).toString()
            : null,
        placeOfRegistration: _companyActPlaceController.text.trim(),
        registrationNo: _companyActRegNoController.text.trim(),
        // GST fields
        gstDate: _gstDateController.text.isNotEmpty
            ? CalendarDate.parse(_gstDateController.text).toString()
            : null,
        gstPlace: _gstPlaceController.text.trim(),
        gstRegNo: _gstRegNoController.text.trim(),
        permanentAccountNumber: _panController.text.trim(),
        taxAccountNumber: _tanController.text.trim().isNotEmpty
            ? _tanController.text.trim()
            : null,
      );


      final result = await FormDataService.instance.submitComplianceDetails(
        financialYear: widget.formYear,
        complianceDetailsInput: complianceInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result?.success != true) {
        throw Exception(
          'Failed to submit compliance details: ${result?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Compliance details submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Only navigate after successful submission
        FormNavigationHelper.navigateToNextStep(
          context,
          widget.formYear,
          widget.currentStep,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting form: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _companyActPlaceController.dispose();
    _companyActRegNoController.dispose();
    _gstDateController.dispose();
    _gstPlaceController.dispose();
    _gstRegNoController.dispose();
    _panController.dispose();
    _tanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: FormNavigationHelper.buildAppBar(
          context,
          widget.currentStep,
          widget.formYear,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return FormNavigationHelper.wrapWithBackHandler(
      context: context,
      currentStep: widget.currentStep,
      formYear: widget.formYear,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: FormNavigationHelper.buildAppBar(
          context,
          widget.currentStep,
          widget.formYear,
        ),
        body: Column(
          children: [
            // Breadcrumb and Progress
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Compliance Management',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Details of Compliances',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '6/9',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Progress Bar
                  Container(
                    width: double.infinity,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.667, // 6/9 = 66.7%
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Act under which registered dropdown
                    _buildDropdownWithLabel(
                      label: 'Act under which registered',
                      value: _selectedActUnderRegistered,
                      items: _actOptions,
                      hintText: 'Select act under which registered',
                      onChanged:
                          (
                            Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
                            newValue,
                          ) {
                            setState(() {
                              _selectedActUnderRegistered = newValue;
                            });
                          },
                    ),

                    const SizedBox(height: 16),

                    // Company Act / Co-operative Societies Act Section
                    Text(
                      'COMPANY ACT / CO-OPERATIVE SOCIETIES ACT',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDisplayFieldWithLabel(
                      label: 'Date of Registration',
                      value: _fpoIncorporationDate ?? '',
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Place of Registration',
                      controller: _companyActPlaceController,
                      hintText: 'Enter place of registration',
                      isRequired: true,
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Registration Number',
                      controller: _companyActRegNoController,
                      hintText: 'Enter registration number',
                      isRequired: true,
                    ),

                    const SizedBox(height: 24),

                    // Certificate of GST registration Section
                    Text(
                      'CERTIFICATE OF GST REGISTRATION',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDateFieldWithLabel(
                      label: 'Date of Registration',
                      controller: _gstDateController,
                      hintText: 'Select date',
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Place of Registration',
                      controller: _gstPlaceController,
                      hintText: 'Enter place of registration',
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Registration Number',
                      controller: _gstRegNoController,
                      hintText: 'Enter GST registration number',
                    ),

                    const SizedBox(height: 32),

                    // Income Tax registrations Section
                    Text(
                      'REGISTRATIONS WITH RESPECT TO INCOME TAX',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Permanent Account Number (PAN)',
                      controller: _panController,
                      hintText: 'AAAPZ1234C',
                      isRequired: true,
                    ),

                    const SizedBox(height: 16),

                    _buildTextFieldWithLabel(
                      label: 'Tax Deduction Account Number (TAN)',
                      controller: _tanController,
                      hintText: 'ABCD12345E',
                      isRequired: true,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Footer Actions
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  if (widget.currentStep > 1)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            FormNavigationHelper.navigateToPreviousStep(
                              context,
                              widget.formYear,
                              widget.currentStep,
                            ),
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Previous'),
                      ),
                    ),
                  if (widget.currentStep > 1) const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _isSubmitting ? null : _handleNext,
                      icon: Icon(
                        widget.currentStep == 9
                            ? Icons.check
                            : Icons.arrow_forward,
                      ),
                      label: Text(
                        _isSubmitting
                            ? 'Submitting...'
                            : (widget.currentStep == 9 ? 'Complete' : 'Next'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: VoiceInputWidget(
            controller: controller,
            hintText: hintText,
            maxLines: maxLines,
            keyboardType: keyboardType,
            onTextChanged: (text) {
              controller.text = text;
              if (onChanged != null) onChanged(text);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDisplayFieldWithLabel({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          ),
          child: Text(
            value.isNotEmpty ? value : 'Not available',
            style: TextStyle(
              fontSize: 15,
              color: value.isNotEmpty
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownWithLabel({
    required String label,
    required Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
    value,
    required List<Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices>
    items,
    required String hintText,
    required ValueChanged<
      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
    >
    onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: DropdownButtonHideUnderline(
            child:
                DropdownButton<
                  Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
                >(
                  value: items.contains(value) ? value : null,
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      hintText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(8),
                  items: items.map((
                    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
                    item,
                  ) {
                    return DropdownMenuItem<
                      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
                    >(
                      value: item,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade200,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Text(
                          _getDisplayTextForEnum(item),
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.onSurface,
                            height: 1.3,
                          ),
                          softWrap: true,
                          maxLines: 3,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  selectedItemBuilder: (BuildContext context) {
                    return items.map((
                      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
                      item,
                    ) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Text(
                          _getDisplayTextForEnum(item),
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          maxLines: 2,
                        ),
                      );
                    }).toList();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 24,
                    ),
                  ),
                  menuMaxHeight: 300,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(colorScheme: Theme.of(context).colorScheme),
                    child: child!,
                  );
                },
              );
              if (picked != null) {
                controller.text =
                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 15,
              ),
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

}

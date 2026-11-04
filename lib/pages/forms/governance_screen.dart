import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';

class GovernanceScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const GovernanceScreen({
    super.key,
    required this.formYear,
    this.currentStep = 2,
  });

  @override
  State<GovernanceScreen> createState() => _GovernanceScreenState();
}

class _GovernanceScreenState extends State<GovernanceScreen> {
  final _agmFrequencyController = TextEditingController();
  final _bodMeetingsController = TextEditingController();
  final _numberOfBodsController = TextEditingController();
  final _numberOfWomenBodsController = TextEditingController();

  String? _selectedMinutesQuality;
  String? _selectedSecondLineManagement;

  bool _isLoading = true;
  bool _isSubmitting = false;

  final List<String> _minutesQualityOptions = [
    'Minutes of the meeting are detailed with the decisions taken being recorded with proper compliance',
    'Minutes of the meeting are detailed with decision taken being recorded but not recorded on MCA',
    'Minutes of the meeting are sketchy in quality',
    'Minutes of the meeting are not maintained',
  ];

  final List<String> _secondLineManagementOptions = [
    'CEO accompanied by accounts team & atleast 2 divisional manager (eg: marketing, sales, procurement)',
    'CEO accompanied by accounts team & one divisional manager (eg: marketing, sales, procurement)',
    'No second line, CEO accompanied by accounts team',
    'No second line, only CEO',
    'Currently no CEO',
  ];

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  @override
  void dispose() {
    _agmFrequencyController.dispose();
    _bodMeetingsController.dispose();
    _numberOfBodsController.dispose();
    _numberOfWomenBodsController.dispose();
    super.dispose();
  }

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'Governance: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('Governance: Full submission data: $submission');

      if (submission != null) {
        debugPrint(
          'Governance: Submission exists, checking governanceManagementDetails...',
        );

        if (submission.governance != null) {
          final governanceDetails = submission.governance!.toJson();
          debugPrint('Governance: Details found: $governanceDetails');
          await _populateFormFields(governanceDetails);
        } else {
          debugPrint('Governance: No governance found in submission');
        }
      } else {
        debugPrint('Governance: No submission found for this financial year');
      }
    } catch (e, stack) {
      debugPrint('Governance: Error loading existing data: $e');
      debugPrint(
        'Governance: Stack trace: ${StackTrace.current}, ${stack.toString()}',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _populateFormFields(
    Map<String, dynamic> governanceDetails,
  ) async {
    if (!mounted) return;

    debugPrint('Governance: Populating fields with data...');

    setState(() {
      // AGM frequency
      final agmFrequency =
          governanceDetails['annualGeneralBodyMeetings']?.toString() ?? '';
      debugPrint('Governance: AGM Frequency: "$agmFrequency"');
      _agmFrequencyController.text = agmFrequency;

      // BOD meetings
      final bodMeetings =
          governanceDetails['bodMeetingsLastFinancialYear']?.toString() ?? '';
      debugPrint('Governance: BOD Meetings: "$bodMeetings"');
      _bodMeetingsController.text = bodMeetings;

      // Number of BODs
      final numBods = governanceDetails['numBods']?.toString() ?? '';
      debugPrint('Governance: Number of BODs: "$numBods"');
      _numberOfBodsController.text = numBods;

      // Number of Women BODs
      final numWomenBods = governanceDetails['numWomenBods']?.toString() ?? '';
      debugPrint('Governance: Number of Women BODs: "$numWomenBods"');
      _numberOfWomenBodsController.text = numWomenBods;

      // Minutes maintenance
      final minutesMaintenance = _mapMinutesMaintenanceFromEnum(
        governanceDetails['minutesMaintenance'],
      );
      debugPrint('Governance: Minutes Maintenance: "$minutesMaintenance"');
      _selectedMinutesQuality = minutesMaintenance;

      // Second line of management
      final secondLineManagement = _mapSecondLineManagementFromEnum(
        governanceDetails['secondLineManagement'],
      );
      debugPrint('Governance: Second Line Management: "$secondLineManagement"');
      _selectedSecondLineManagement = secondLineManagement;
    });
  }

  String? _mapMinutesMaintenanceFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'DETAILED_COMPLIANT':
        return 'Minutes of the meeting are detailed with the decisions taken being recorded with proper compliance';
      case 'DETAILED_NOT_UPDATED':
        return 'Minutes of the meeting are detailed with decision taken being recorded but not recorded on MCA';
      case 'SKETCHY_QUALITY':
        return 'Minutes of the meeting are sketchy in quality';
      case 'NOT_MAINTAINED':
        return 'Minutes of the meeting are not maintained';
      default:
        return null;
    }
  }

  Enum$MinutesMaintenanceTypeEnum? _mapMinutesMaintenanceToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;

    switch (displayValue) {
      case 'Minutes of the meeting are detailed with the decisions taken being recorded with proper compliance':
        return Enum$MinutesMaintenanceTypeEnum.DETAILED_COMPLIANT;
      case 'Minutes of the meeting are detailed with decision taken being recorded but not recorded on MCA':
        return Enum$MinutesMaintenanceTypeEnum.DETAILED_NOT_UPDATED;
      case 'Minutes of the meeting are sketchy in quality':
        return Enum$MinutesMaintenanceTypeEnum.SKETCHY_QUALITY;
      case 'Minutes of the meeting are not maintained':
        return Enum$MinutesMaintenanceTypeEnum.NOT_MAINTAINED;
      default:
        return null;
    }
  }

  String? _mapSecondLineManagementFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'CEO_ACCOUNTS_TWO_MANAGERS':
        return 'CEO accompanied by accounts team & atleast 2 divisional manager (eg: marketing, sales, procurement)';
      case 'CEO_ACCOUNTS_ONE_MANAGER':
        return 'CEO accompanied by accounts team & one divisional manager (eg: marketing, sales, procurement)';
      case 'CEO_WITH_ACCOUNTS':
        return 'No second line, CEO accompanied by accounts team';
      case 'ONLY_CEO':
        return 'No second line, only CEO';
      case 'NO_CEO':
        return 'Currently no CEO';
      default:
        return null;
    }
  }

  Enum$SecondLineManagementTypeEnum? _mapSecondLineManagementToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;

    switch (displayValue) {
      case 'CEO accompanied by accounts team & atleast 2 divisional manager (eg: marketing, sales, procurement)':
        return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_TWO_MANAGERS;
      case 'CEO accompanied by accounts team & one divisional manager (eg: marketing, sales, procurement)':
        return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_ONE_MANAGER;
      case 'No second line, CEO accompanied by accounts team':
        return Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS;
      case 'No second line, only CEO':
        return Enum$SecondLineManagementTypeEnum.ONLY_CEO;
      case 'Currently no CEO':
        return Enum$SecondLineManagementTypeEnum.NO_CEO;
      default:
        return null;
    }
  }

  Input$GovernanceSubmissionInput _extractFormData() {
    return Input$GovernanceSubmissionInput(
      annualGeneralBodyMeetings: int.tryParse(_agmFrequencyController.text.trim()),
      bodMeetingsLastFinancialYear: int.tryParse(_bodMeetingsController.text.trim()),
      minutesMaintenance: _mapMinutesMaintenanceToEnum(_selectedMinutesQuality),
      numBods: int.tryParse(_numberOfBodsController.text.trim()),
      numWomenBods: int.tryParse(_numberOfWomenBodsController.text.trim()),
      secondLineManagement: _mapSecondLineManagementToEnum(_selectedSecondLineManagement),
    );
  }

  Future<bool> _validateForm() {
    // Check for required fields
    if (_agmFrequencyController.text.trim().isEmpty) {
      _showValidationError(
        'Please enter how often Annual general body meeting is conducted',
      );
      return Future.value(false);
    }

    if (_bodMeetingsController.text.trim().isEmpty) {
      _showValidationError(
        'Please enter how often BOD meetings were conducted',
      );
      return Future.value(false);
    }

    if (_selectedMinutesQuality == null) {
      _showValidationError(
        'Please select maintenance of minutes of the meetings',
      );
      return Future.value(false);
    }

    if (_numberOfBodsController.text.trim().isEmpty) {
      _showValidationError('Please enter number of BODs');
      return Future.value(false);
    }

    if (_numberOfWomenBodsController.text.trim().isEmpty) {
      _showValidationError('Please enter number of Women BODs');
      return Future.value(false);
    }

    // Validate that number of women BODs is not greater than total BODs
    final numBods = int.tryParse(_numberOfBodsController.text.trim());
    final numWomenBods = int.tryParse(_numberOfWomenBodsController.text.trim());

    if (numBods != null && numWomenBods != null) {
      if (numWomenBods > numBods) {
        _showValidationError(
          'Number of Women BODs cannot be greater than the total number of BODs',
        );
        return Future.value(false);
      }
    }

    return Future.value(true);
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  int? _getMaxWomenBodsValue() {
    final numBods = int.tryParse(_numberOfBodsController.text.trim());
    return numBods;
  }

  Future<bool> _submitForm() async {
    if (await _validateForm() == false) {
      return false;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final governanceInput = _extractFormData();
      debugPrint('Governance: Submitting form data: $governanceInput');

      final result = await FormDataService.instance.submitGovernance(
        financialYear: widget.formYear,
        governanceInput: governanceInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('Governance: Submit result: $result');

      if (result?.success == true) {
        debugPrint('Governance: Form submitted successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Governance details submitted successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
        return true;
      } else {
        final errors = result?.errors;
        final errorMessage = errors?.isNotEmpty == true
            ? errors!.first.toString()
            : 'Failed to submit form';

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
        return false;
      }
    } catch (e) {
      debugPrint('Governance form submission error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting form: ${e.toString()}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
      return false;
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _handleNext() async {
    final success = await _submitForm();
    if (success && mounted) {
      FormNavigationHelper.navigateToNextStep(
        context,
        widget.formYear,
        widget.currentStep,
        secondLineManagement: _selectedSecondLineManagement,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormNavigationHelper.wrapWithBackHandler(
      context: context,
      currentStep: widget.currentStep,
      formYear: widget.formYear,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: FormNavigationHelper.buildAppBar(
          context,
          widget.currentStep,
          widget.formYear,
        ),
        body: _isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      'Loading form data...',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  // Breadcrumb and Progress
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
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
                                    'Organization Management',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    'Governance Details',
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
                              '2/9',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
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
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.222, // 2/9 = 22.2%
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
                          // Governance Section Header
                          Text(
                            'GOVERNANCE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Annual General Body Meeting Frequency
                          _buildTextFieldWithLabel(
                            label:
                                'How often Annual general body meeting is conducted (Annually)',
                            controller: _agmFrequencyController,
                            hintText: 'Enter number',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),

                          const SizedBox(height: 16),

                          // BOD Meetings Frequency
                          _buildTextFieldWithLabel(
                            label:
                                'How often were BOD meetings conducted in last financial year? (E)',
                            controller: _bodMeetingsController,
                            hintText: 'Enter number',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),

                          const SizedBox(height: 16),

                          // Maintenance of Minutes
                          _buildDropdownWithLabel(
                            label: 'Maintenance of minutes of the meetings',
                            value: _selectedMinutesQuality,
                            items: _minutesQualityOptions,
                            hintText: 'Select minutes quality',
                            isRequired: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedMinutesQuality = newValue;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Number of BODs
                          _buildTextFieldWithLabel(
                            label: 'Number of BODs',
                            controller: _numberOfBodsController,
                            hintText: 'Enter number of Board of Directors',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            onChanged: (value) {
                              // When BODs count changes, update the validation for Women BODs
                              setState(() {});
                            },
                          ),

                          const SizedBox(height: 16),

                          // Number of Women BODs
                          _buildTextFieldWithLabel(
                            label: 'Number of Women BODs',
                            controller: _numberOfWomenBodsController,
                            hintText:
                                'Enter number of women Board of Directors',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            maxValue: _getMaxWomenBodsValue(),
                          ),

                          const SizedBox(height: 16),

                          // Second Line of Management
                          _buildDropdownWithLabel(
                            label: 'Second Line of Management',
                            value: _selectedSecondLineManagement,
                            items: _secondLineManagementOptions,
                            hintText: 'Select management structure',
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedSecondLineManagement = newValue;
                              });
                            },
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
                              onPressed: _isSubmitting
                                  ? null
                                  : () =>
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
                            icon: _isSubmitting
                                ? SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(Icons.arrow_forward),
                            label: Text(
                              _isSubmitting ? 'Submitting...' : 'Next',
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
    int? maxValue,
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
            onTextChanged: (value) {
              // Validate max value if specified
              if (maxValue != null && value.isNotEmpty) {
                final parsedValue = int.tryParse(value);
                if (parsedValue != null && parsedValue > maxValue) {
                  controller.text = maxValue.toString();
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length),
                  );
                }
              }
              onChanged?.call(value);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
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
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: items.contains(value) ? value : null,
              hint: Container(
                constraints: const BoxConstraints(minHeight: 48),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  hintText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 14,
                  ),
                ),
              ),
              isExpanded: true,
              dropdownColor: Theme.of(context).colorScheme.surface,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              itemHeight: null,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      minHeight: 60,
                      maxWidth: double.infinity,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withOpacity(0.3),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              selectedItemBuilder: (BuildContext context) {
                return items.map((String item) {
                  return Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
              menuMaxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
        ),
      ],
    );
  }
}

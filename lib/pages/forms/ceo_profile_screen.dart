import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';

class CEOProfileScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const CEOProfileScreen({
    super.key,
    required this.formYear,
    this.currentStep = 3,
  });

  @override
  State<CEOProfileScreen> createState() => _CEOProfileScreenState();
}

class _CEOProfileScreenState extends State<CEOProfileScreen> {
  final _ceoNameController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _experienceYearsController = TextEditingController();
  final _yearsAssociatedController = TextEditingController();
  final _otherExperienceTypeController = TextEditingController();

  String? _selectedExperienceType;

  bool _isLoading = true;
  bool _isSubmitting = false;

  final List<String> _experienceTypeOptions = [
    'Agricultural Cooperatives/Farmer producer organizations',
    'Farmer-owned enterprises',
    'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry',
    'Farm Management',
    'Village councils',
    'Self-help groups',
    'Governmental departments of agricultural sector / fisheries / animal husbandry',
    'Knowledge of key business functions ( Marketing, Finance, business development etc.)',
    'Any other',
  ];

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  @override
  void dispose() {
    _ceoNameController.dispose();
    _qualificationController.dispose();
    _experienceYearsController.dispose();
    _yearsAssociatedController.dispose();
    _otherExperienceTypeController.dispose();
    super.dispose();
  }

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'CEO Profile: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('CEO Profile: Full submission data: $submission');

      if (submission != null) {
        debugPrint('CEO Profile: Submission exists, checking ceoProfile...');

        if (submission.ceoProfile != null) {
          final ceoProfileData = submission.ceoProfile!.toJson();
          debugPrint('CEO Profile: Details found: $ceoProfileData');
          await _populateFormFields(ceoProfileData);
        } else {
          debugPrint('CEO Profile: No ceoProfile found in submission');
        }
      } else {
        debugPrint('CEO Profile: No submission found for this financial year');
      }
    } catch (e, stack) {
      debugPrint('CEO Profile: Error loading existing data: $e');
      debugPrint(
        'CEO Profile: Stack trace: ${StackTrace.current}, ${stack.toString()}',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _populateFormFields(Map<String, dynamic> ceoProfileData) async {
    if (!mounted) return;

    debugPrint('CEO Profile: Populating fields with data...');

    setState(() {
      // CEO Name
      final ceoName = ceoProfileData['name'] ?? '';
      debugPrint('CEO Profile: Name: "$ceoName"');
      _ceoNameController.text = ceoName;

      // Qualification
      final qualification = ceoProfileData['qualification'] ?? '';
      debugPrint('CEO Profile: Qualification: "$qualification"');
      _qualificationController.text = qualification;

      // Experience Years
      final experienceYears =
          ceoProfileData['totalYearsOfExperience']?.toString() ?? '';
      debugPrint('CEO Profile: Experience Years: "$experienceYears"');
      _experienceYearsController.text = experienceYears;

      // Years Associated with FPO
      final yearsAssociated =
          ceoProfileData['numberOfYearsAssociated']?.toString() ?? '';
      debugPrint('CEO Profile: Years Associated: "$yearsAssociated"');
      _yearsAssociatedController.text = yearsAssociated;

      // Experience Type
      final experienceTypeEnum = ceoProfileData['typeOfExperience'];
      final experienceType = _mapExperienceTypeFromEnum(experienceTypeEnum);
      debugPrint(
        'CEO Profile: Experience Type: "$experienceType" (from "$experienceTypeEnum")',
      );
      _selectedExperienceType = experienceType;

      // If "Any other" is selected, need to handle the other type
      if (experienceType == 'Any other') {
        // We don't have a separate field for 'other type' in the API,
        // so this would need to be handled in your implementation
        // This is just a placeholder, you might need to store it elsewhere or parse it from a note field
        _otherExperienceTypeController.text = '';
      }
    });
  }

  String? _mapExperienceTypeFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    try {
      // Use the generated enum conversion function from schema
      final enumType =
          fromJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
            enumValue,
          );
      return _getDisplayValueForEnum(enumType);
    } catch (e) {
      debugPrint(
        'CEO Profile: Error mapping enum value: $enumValue, error: $e',
      );
      return null;
    }
  }

  String? _getDisplayValueForEnum(
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices enumType,
  ) {
    switch (enumType) {
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES:
        return 'Agricultural Cooperatives/Farmer producer organizations';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES:
        return 'Farmer-owned enterprises';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.NGO_AGRICULTURE:
        return 'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.FARM_MANAGEMENT:
        return 'Farm Management';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.VILLAGE_COUNCILS:
        return 'Village councils';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.SELF_HELP_GROUPS:
        return 'Self-help groups';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE:
        return 'Governmental departments of agricultural sector / fisheries / animal husbandry';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
          .BUSINESS_FUNCTIONS:
        return 'Knowledge of key business functions ( Marketing, Finance, business development etc.)';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.ANY_OTHER:
        return 'Any other';
      case Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.$unknown:
        return null;
    }
  }

  Enum$ExperienceTypeEnum? _mapExperienceTypeToEnum(String? displayValue) {
    if (displayValue == null) return null;

    return switch (displayValue) {
      'Agricultural Cooperatives/Farmer producer organizations' =>
        Enum$ExperienceTypeEnum.AGRICULTURAL_COOPERATIVES,
      'Farmer-owned enterprises' =>
        Enum$ExperienceTypeEnum.FARMER_OWNED_ENTERPRISES,
      'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry' =>
        Enum$ExperienceTypeEnum.NGO_AGRICULTURE,
      'Farm Management' => Enum$ExperienceTypeEnum.FARM_MANAGEMENT,
      'Village councils' => Enum$ExperienceTypeEnum.VILLAGE_COUNCILS,
      'Self-help groups' => Enum$ExperienceTypeEnum.SELF_HELP_GROUPS,
      'Governmental departments of agricultural sector / fisheries / animal husbandry' =>
        Enum$ExperienceTypeEnum.GOVERNMENT_AGRICULTURE,
      'Knowledge of key business functions ( Marketing, Finance, business development etc.)' =>
        Enum$ExperienceTypeEnum.BUSINESS_FUNCTIONS,
      'Any other' => Enum$ExperienceTypeEnum.ANY_OTHER,
      _ => null,
    };
  }

  Input$CEOProfileSubmissionInput _extractFormData() {
    return Input$CEOProfileSubmissionInput(
      name: _ceoNameController.text.trim(),
      qualification: _qualificationController.text.trim(),
      totalYearsOfExperience: int.tryParse(
        _experienceYearsController.text.trim(),
      ),
      numberOfYearsAssociated: int.tryParse(
        _yearsAssociatedController.text.trim(),
      ),
      typeOfExperience: _mapExperienceTypeToEnum(_selectedExperienceType),
    );
  }

  Future<bool> _validateForm() {
    // Check for required fields
    if (_ceoNameController.text.trim().isEmpty) {
      _showValidationError('Please enter CEO name');
      return Future.value(false);
    }

    if (_qualificationController.text.trim().isEmpty) {
      _showValidationError('Please enter qualification');
      return Future.value(false);
    }

    if (_selectedExperienceType == null) {
      _showValidationError('Please select type of experience');
      return Future.value(false);
    }

    if (_selectedExperienceType == 'Any other' &&
        _otherExperienceTypeController.text.trim().isEmpty) {
      _showValidationError('Please specify other experience type');
      return Future.value(false);
    }

    if (_experienceYearsController.text.trim().isEmpty) {
      _showValidationError('Please enter total years of experience');
      return Future.value(false);
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

  Future<bool> _submitForm() async {
    if (await _validateForm() == false) {
      return false;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final ceoProfileInput = _extractFormData();
      debugPrint('CEO Profile: Submitting form data: $ceoProfileInput');

      final result = await FormDataService.instance.submitCEOProfile(
        financialYear: widget.formYear,
        ceoProfileInput: ceoProfileInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('CEO Profile: Submit result: $result');

      if (result?.success == true) {
        debugPrint('CEO Profile: Form submitted successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('CEO profile submitted successfully!'),
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
      debugPrint('CEO profile form submission error: $e');
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
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                                    'Profile of Chief Executive Officer',
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
                              '3/9',
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
                            ).colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.333, // 3/9 = 33.3%
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
                          // CEO Profile Section Header
                          Text(
                            'PROFILE OF CHIEF EXECUTIVE OFFICER',
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

                          // Name
                          _buildTextFieldWithLabel(
                            label: 'Name',
                            controller: _ceoNameController,
                            hintText: 'Enter CEO name',
                            isRequired: true,
                          ),

                          const SizedBox(height: 20),

                          // Qualification
                          _buildTextFieldWithLabel(
                            label: 'Qualification (I)',
                            controller: _qualificationController,
                            hintText: 'Enter qualification',
                            isRequired: true,
                          ),

                          const SizedBox(height: 20),

                          // Type of Experience
                          _buildExperienceDropdownWithLabel(
                            label: 'Type of experience (E)',
                            value: _selectedExperienceType,
                            items: _experienceTypeOptions,
                            hintText: 'Select type of experience',
                            isRequired: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedExperienceType = newValue;
                                if (newValue == null ||
                                    newValue.trim() != 'Any other') {
                                  // Clear other experience type if not "Any other"
                                  _otherExperienceTypeController.clear();
                                }
                              });
                            },
                          ),

                          const SizedBox(height: 20),

                          // Conditional field for other experience type
                          if (_selectedExperienceType != null &&
                              _selectedExperienceType!.trim() ==
                                  'Any other') ...[
                            _buildTextFieldWithLabel(
                              label: 'Please specify other experience type',
                              controller: _otherExperienceTypeController,
                              hintText: 'Enter other experience type',
                              isRequired: true,
                            ),
                            const SizedBox(height: 20),
                          ],

                          // Total Years of Experience
                          _buildTextFieldWithLabel(
                            label: 'Total years of experience (E)',
                            controller: _experienceYearsController,
                            hintText: 'Enter total years of experience',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                          ),

                          const SizedBox(height: 20),

                          // Number of years associated with FPO
                          _buildTextFieldWithLabel(
                            label: 'Number of years the CEO has been associated with the current FPO',
                            controller: _yearsAssociatedController,
                            hintText: 'Enter years associated with FPO',
                            keyboardType: TextInputType.number,
                            isRequired: false,
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

  Widget _buildExperienceDropdownWithLabel({
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
              hint: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  hintText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),
              ),
              isExpanded: true,
              dropdownColor: Theme.of(context).colorScheme.surface,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withValues(alpha: 0.3),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.4,
                      ),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              selectedItemBuilder: (BuildContext context) {
                return items.map((String item) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      softWrap: true,
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
              menuMaxHeight: 350,
              itemHeight: null,
            ),
          ),
        ),
      ],
    );
  }
}

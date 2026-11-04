import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../graphql/queries/form_queries.graphql.dart'
    show
        Query$GetSubmission$getSubmission,
        Query$GetSubmission$getSubmission$boardDirectors;
import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';

class BoardDirectorsScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const BoardDirectorsScreen({
    super.key,
    required this.formYear,
    this.currentStep = 4,
  });

  @override
  State<BoardDirectorsScreen> createState() => _BoardDirectorsScreenState();
}

class _BoardDirectorsScreenState extends State<BoardDirectorsScreen> {
  // Dynamic Profile of Board of Directors controllers
  List<Map<String, dynamic>> _directorProfiles = [];

  int _directorsValue = 0;
  bool _isAutoSaving = false;

  final List<String> _experienceTypeOptions = [
    'Agricultural Cooperatives/Farmer producer organizations',
    'Farmer-owned enterprises',
    'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry',
    'Farm Management',
    'Village councils',
    'Self-help groups',
    'Governmental departments of agricultural sector / fisheries / animal husbandry',
    'Any other',
  ];

  bool _isLoading = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  @override
  void dispose() {
    // Dispose dynamic controllers
    for (var profile in _directorProfiles) {
      profile['name']?.dispose();
      profile['education']?.dispose();
      profile['experience_years']?.dispose();
      profile['other_experience']?.dispose();
    }
    super.dispose();
  }

  void _triggerAutoSave() {
    setState(() {
      _isAutoSaving = true;
    });

    // Simulate auto-save delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isAutoSaving = false;
        });
      }
    });
  }

  int? bodMeetingsLastFinancialYear;
  int? numWomenBods;
  int? numBods;
  int? annualGeneralBodyMeetings;  // Store AGM value to preserve it when resubmitting
  Enum$MinutesMaintenanceTypeEnum? maintenanceTypeEnum;
  Enum$SecondLineManagementTypeEnum? secondLineManagementChoices;

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'Board Directors: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      bodMeetingsLastFinancialYear =
          submission?.governance?.bodMeetingsLastFinancialYear;
      numWomenBods = submission?.governance?.numWomenBods;
      numBods = submission?.governance?.numBods;
      annualGeneralBodyMeetings = submission?.governance?.annualGeneralBodyMeetings;

      switch (submission?.governance?.secondLineManagement) {
        case null:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.ONLY_CEO;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.CEO_ACCOUNTS_ONE_MANAGER:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_ONE_MANAGER;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.CEO_ACCOUNTS_TWO_MANAGERS:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS_TWO_MANAGERS;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.CEO_WITH_ACCOUNTS:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.CEO_WITH_ACCOUNTS;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.NO_CEO:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.NO_CEO;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.ONLY_CEO:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.ONLY_CEO;
        case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.$unknown:
          secondLineManagementChoices = Enum$SecondLineManagementTypeEnum.NO_CEO;
      }

      switch (submission?.governance?.minutesMaintenance) {
        case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .DETAILED_COMPLIANT:
          maintenanceTypeEnum =
              Enum$MinutesMaintenanceTypeEnum.DETAILED_COMPLIANT;
          break;
        case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .DETAILED_NOT_UPDATED:
          maintenanceTypeEnum =
              Enum$MinutesMaintenanceTypeEnum.DETAILED_NOT_UPDATED;
          break;
        case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .NOT_MAINTAINED:
          maintenanceTypeEnum = Enum$MinutesMaintenanceTypeEnum.NOT_MAINTAINED;
          break;
        case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .SKETCHY_QUALITY:
          maintenanceTypeEnum = Enum$MinutesMaintenanceTypeEnum.SKETCHY_QUALITY;
          break;
        default:
      }

      debugPrint('Board Directors: Full submission data: $submission');

      if (submission != null) {
        debugPrint(
          'Board Directors: Submission exists, checking board directors profiles...',
        );

        final boardProfiles = submission.boardDirectors;
        debugPrint(
          'Board Directors: ${boardProfiles.edges.length} profiles found',
        );

        // Get governance details - this value ALWAYS takes precedence
        if (submission.governance != null) {
          final governanceData = submission.governance!.toJson();
          debugPrint(
            'Board Directors: Governance details found: $governanceData',
          );

          // Set the number of directors from governance
          if (governanceData['numBods'] != null) {
            final numBods = governanceData['numBods'];
            setState(() {
              _directorsValue = numBods;
            });
            _updateDirectorProfiles();
          }
        }

        // Populate director profiles (without overriding _directorsValue)
        await _populateDirectorProfiles(boardProfiles);
      } else {
        debugPrint(
          'Board Directors: No submission found for this financial year',
        );
      }
    } catch (e, stack) {
      debugPrint('Board Directors: Error loading existing data: $e');
      debugPrint(
        'Board Directors: Stack trace: ${StackTrace.current}, ${stack.toString()}',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
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
                                    'General Information',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    'Board of Directors',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '4/9',
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Progress Bar
                        Container(
                          width: double.infinity,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.444, // 4/9 = 44.4%
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
                          // Section Title
                          Text(
                            'DIRECTORS DETAILS',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.outline,
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Number of Board of Directors (Read-only)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Number of Board of Directors',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Value from Governance form',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // border: Border.all(
                                  //   color: Theme.of(context).colorScheme.outline,
                                  // ),
                                  color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                                ),
                                child: Text(
                                  _directorsValue.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).colorScheme.onSurface,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),


                          // Dynamic Profile of Board of Directors Section
                          if (_directorsValue > 0) ...[
                            const SizedBox(height: 32),
                            Text(
                              'PROFILE OF BOARD OF DIRECTORS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.outline,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Generate profile forms for each director
                            ...List.generate(
                              _directorsValue,
                              (index) => _buildDirectorProfileForm(index + 1),
                            ),
                          ],

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

  Future<bool> _submitForm() async {
    if (await _validateForm() == false) {
      return false;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Extract form data and prepare inputs
      final boardProfiles = _extractFormData();
      final governanceData = _extractGovernanceData();

      debugPrint(
        'Board Directors: Submitting board profiles: ${jsonEncode(boardProfiles)}',
      );

      // First, submit governance data
      final governanceResult = await FormDataService.instance.submitGovernance(
        financialYear: widget.formYear,
        governanceInput: governanceData,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint(
        'Board Directors: Governance submit result: $governanceResult',
      );

      if (governanceResult?.success != true) {
        final errors = governanceResult?.errors;
        final errorMessage = errors?.isNotEmpty == true
            ? errors!.first.toString()
            : 'Failed to submit governance details';

        throw Exception(errorMessage);
      }

      // Next, submit board profiles
      final profilesResult = await FormDataService.instance.submitBoardProfiles(
        financialYear: widget.formYear,
        boardProfilesInput: boardProfiles,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint(
        'Board Directors: Board profiles submit result: $profilesResult',
      );

      if (profilesResult?.success == true) {
        debugPrint('Board Directors: Form submitted successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Board directors profiles submitted successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
        return true;
      } else {
        final errors = profilesResult?.errors;
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
      debugPrint('Board Directors form submission error: $e');
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

  Future<void> _populateDirectorProfiles(
    Query$GetSubmission$getSubmission$boardDirectors boardProfiles,
  ) async {
    if (!mounted) {
      return;
    }

    final edges = boardProfiles.edges;

    // Only populate existing saved profiles into the forms
    // The forms themselves are already created by _updateDirectorProfiles() based on _directorsValue
    // We just need to fill in the data for profiles that exist

    for (int i = 0; i < edges.length && i < _directorProfiles.length; i++) {
      if (edges[i]?.node == null) continue;

      final node = edges[i]?.node;

      // Update the existing profile controllers with the saved data
      _directorProfiles[i]['name']!.text = node?.name ?? '';
      _directorProfiles[i]['education']!.text = node?.educationalQualification ?? '';
      _directorProfiles[i]['experience_type'] = _mapExperienceTypeFromEnum(node?.typeOfExperience);
      _directorProfiles[i]['experience_years']!.text = node?.totalYearsOfExperience.toString() ?? '';

      // If experience type is "Any other", set the other experience field
      if (_directorProfiles[i]['experience_type'] == 'Any other') {
        _directorProfiles[i]['other_experience']!.text = '';
      }
    }

    // Do not update _directorsValue here - it should always reflect the governance value
    // The profile count is controlled by _directorsValue from governance, not by saved profile count
  }

  String? _mapExperienceTypeFromEnum(
    Enum$FpoBoardDirectorProfileTypeOfExperienceChoices? enumValue,
  ) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .AGRICULTURAL_COOPERATIVES:
        return 'Agricultural Cooperatives/Farmer producer organizations';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .FARMER_OWNED_ENTERPRISES:
        return 'Farmer-owned enterprises';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.NGO_AGRICULTURE:
        return 'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.FARM_MANAGEMENT:
        return 'Farm Management';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.VILLAGE_COUNCILS:
        return 'Village councils';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.SELF_HELP_GROUPS:
        return 'Self-help groups';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
          .GOVERNMENT_AGRICULTURE:
        return 'Governmental departments of agricultural sector / fisheries / animal husbandry';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.ANY_OTHER:
        return 'Any other';
      case Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.$unknown:
        return null;
    }
  }

  Enum$BoardExperienceTypeEnum? _mapExperienceTypeToEnum(String? displayValue) {
    if (displayValue == null) return null;

    switch (displayValue) {
      case 'Agricultural Cooperatives/Farmer producer organizations':
        return Enum$BoardExperienceTypeEnum.AGRICULTURAL_COOPERATIVES;
      case 'Farmer-owned enterprises':
        return Enum$BoardExperienceTypeEnum.FARMER_OWNED_ENTERPRISES;
      case 'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry':
        return Enum$BoardExperienceTypeEnum.NGO_AGRICULTURE;
      case 'Farm Management':
        return Enum$BoardExperienceTypeEnum.FARM_MANAGEMENT;
      case 'Village councils':
        return Enum$BoardExperienceTypeEnum.VILLAGE_COUNCILS;
      case 'Self-help groups':
        return Enum$BoardExperienceTypeEnum.SELF_HELP_GROUPS;
      case 'Governmental departments of agricultural sector / fisheries / animal husbandry':
        return Enum$BoardExperienceTypeEnum.GOVERNMENT_AGRICULTURE;
      case 'Any other':
        return Enum$BoardExperienceTypeEnum.ANY_OTHER;
      default:
        return null;
    }
  }

  void _updateDirectorProfiles() {
    // Dispose old controllers if reducing count
    while (_directorProfiles.length > _directorsValue) {
      var profile = _directorProfiles.removeLast();
      profile['name']?.dispose();
      profile['education']?.dispose();
      profile['experience_years']?.dispose();
      profile['other_experience']?.dispose();
    }

    // Add new controllers if increasing count
    while (_directorProfiles.length < _directorsValue) {
      _directorProfiles.add({
        'name': TextEditingController(),
        'education': TextEditingController(),
        'experience_type':
            null, // This will be a String? for dropdown selection
        'experience_years': TextEditingController(),
        'other_experience': TextEditingController(),
      });
    }
  }

  Widget _buildDirectorProfileForm(int directorNumber) {
    if (directorNumber > _directorProfiles.length) {
      return const SizedBox.shrink();
    }

    final profile = _directorProfiles[directorNumber - 1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Director number header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Director $directorNumber',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Name
        _buildTextFieldWithLabel(
          label: 'Name',
          controller: profile['name']!,
          hintText: 'Enter director name',
        ),

        const SizedBox(height: 12),

        // Educational Qualification
        _buildTextFieldWithLabel(
          label: 'Educational Qualification',
          controller: profile['education']!,
          hintText: 'Enter educational qualification',
        ),

        const SizedBox(height: 12),

        // Type of experience (E)
        _buildExperienceTypeDropdownWithLabel(
          label: 'Type of experience (E)',
          value: profile['experience_type'],
          onChanged: (String? newValue) {
            setState(() {
              profile['experience_type'] = newValue;
              if (newValue != 'Any other') {
                // Clear other experience field if not "Any other"
                profile['other_experience']?.clear();
              }
            });
            _triggerAutoSave();
          },
        ),

        const SizedBox(height: 12),

        // Conditional field for other experience type
        if (profile['experience_type'] == 'Any other') ...[
          _buildTextFieldWithLabel(
            label: 'Please specify other experience type',
            controller: profile['other_experience']!,
            hintText: 'Enter other experience type',
          ),
          const SizedBox(height: 12),
        ],

        // Total years of experience (E) - Number
        _buildTextFieldWithLabel(
          label: 'Total years of experience (E)',
          controller: profile['experience_years']!,
          hintText: 'Enter number of years',
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  List<Input$BoardDirectorProfileInput> _extractFormData() {
    List<Input$BoardDirectorProfileInput> directorInputs = [];

    for (var profile in _directorProfiles) {
      // Get values from controllers
      final name = profile['name']!.text.trim();
      final education = profile['education']!.text.trim();
      final experienceType = _mapExperienceTypeToEnum(
        profile['experience_type'],
      );
      final experienceYears =
          int.tryParse(profile['experience_years']!.text.trim()) ?? 0;

      // Skip empty profiles
      if (name.isEmpty && education.isEmpty && experienceYears == 0) {
        continue;
      }

      // Create input object
      final directorInput = Input$BoardDirectorProfileInput(
        name: name,
        educationalQualification: education,
        typeOfExperience: experienceType,
        totalYearsOfExperience: experienceYears,
      );

      directorInputs.add(directorInput);
    }

    return directorInputs;
  }

  Input$GovernanceSubmissionInput _extractGovernanceData() {
    return Input$GovernanceSubmissionInput(
      annualGeneralBodyMeetings: annualGeneralBodyMeetings,  // Preserve AGM value
      numBods: _directorsValue, // Always use the value from governance
      bodMeetingsLastFinancialYear: bodMeetingsLastFinancialYear,
      minutesMaintenance:
          maintenanceTypeEnum ??
          Enum$MinutesMaintenanceTypeEnum
              .DETAILED_COMPLIANT,
      secondLineManagement: secondLineManagementChoices,
      numWomenBods: numWomenBods,
    );
  }

  Future<bool> _validateForm() {
    // Validate director profiles
    for (int i = 0; i < _directorProfiles.length; i++) {
      final profile = _directorProfiles[i];

      if (profile['name']!.text.trim().isEmpty) {
        _showValidationError('Please enter name for Director ${i + 1}');
        return Future.value(false);
      }

      if (profile['education']!.text.trim().isEmpty) {
        _showValidationError(
          'Please enter educational qualification for Director ${i + 1}',
        );
        return Future.value(false);
      }

      if (profile['experience_type'] == null) {
        _showValidationError(
          'Please select type of experience for Director ${i + 1}',
        );
        return Future.value(false);
      }

      if (profile['experience_type'] == 'Any other' &&
          profile['other_experience']!.text.trim().isEmpty) {
        _showValidationError(
          'Please specify other experience type for Director ${i + 1}',
        );
        return Future.value(false);
      }

      if (profile['experience_years']!.text.trim().isEmpty) {
        _showValidationError(
          'Please enter years of experience for Director ${i + 1}',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType: keyboardType,
              readOnly: readOnly,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 15,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                _triggerAutoSave();
              },
            ),
          ),
          if (!readOnly)
            VoiceInputWidget(
              controller: controller,
              showTextField: false,
              onTextChanged: (text) {
                _triggerAutoSave();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        _buildTextField(
          controller: controller,
          hintText: hintText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          maxLines: maxLines,
        ),
      ],
    );
  }

  Widget _buildExperienceTypeDropdownWithLabel({
    required String label,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 56),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _experienceTypeOptions.contains(value) ? value : null,
              hint: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  'Select type of experience',
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
              items: _experienceTypeOptions.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 60),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurface,
                          height: 1.3,
                        ),
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              selectedItemBuilder: (BuildContext context) {
                return _experienceTypeOptions.map((String item) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(minHeight: 56),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
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
                  size: 20,
                ),
              ),
              menuMaxHeight: 250,
              itemHeight: null,
            ),
          ),
        ),
      ],
    );
  }
}

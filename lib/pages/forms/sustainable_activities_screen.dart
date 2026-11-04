import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';

class SustainableActivitiesScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const SustainableActivitiesScreen({
    super.key,
    required this.formYear,
    this.currentStep = 9,
  });

  @override
  State<SustainableActivitiesScreen> createState() =>
      _SustainableActivitiesScreenState();
}

class _SustainableActivitiesScreenState
    extends State<SustainableActivitiesScreen> {
  // Dropdown selections for all sustainable activities
  String? _selectedClimateResilientSeeds;
  String? _selectedOrganicFertilizers;
  String? _selectedDripSprinklerIrrigation;
  String? _selectedWeatherAdvisories;
  String? _selectedPestDiseaseAlerts;
  String? _selectedAgriculturalResidue;
  String? _selectedOrganicFarmingTraining;
  String? _selectedSolarPanels;
  String? _selectedRainwaterHarvesting;
  String? _selectedElectricVehicles;
  String? _selectedCompostingUnits;

  final List<String> _yesNoOptions = ['Yes', 'No'];

  bool _isSubmitting = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'Sustainable Activities: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null && submission.sustainableActivities != null) {
        final sustainableData = submission.sustainableActivities!;
        debugPrint(
          'Sustainable Activities: Data found: ${sustainableData.toJson()}',
        );
        _populateSustainableActivitiesData(sustainableData);
      }
    } catch (e, stack) {
      debugPrint('Sustainable Activities: Error loading existing data: $e');
      debugPrint('Sustainable Activities: Stack trace: $stack');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _populateSustainableActivitiesData(dynamic sustainableData) {
    if (!mounted) return;

    setState(() {
      _selectedClimateResilientSeeds = _mapBoolToYesNo(
        sustainableData.climateResilientSeedsToFarmers,
      );
      _selectedOrganicFertilizers = _mapBoolToYesNo(
        sustainableData.organicBioManureFertilizersToFarmers,
      );
      _selectedDripSprinklerIrrigation = _mapBoolToYesNo(
        sustainableData.dripSprinklerIrrigationToFarmers,
      );
      _selectedWeatherAdvisories = _mapBoolToYesNo(
        sustainableData.weatherAdvisoriesToFarmers,
      );
      _selectedPestDiseaseAlerts = _mapBoolToYesNo(
        sustainableData.pestDiseaseAlertsToFarmers,
      );
      _selectedAgriculturalResidue = _mapBoolToYesNo(
        sustainableData.supplyingAgriculturalResidueToBioCngGasPlants,
      );
      _selectedOrganicFarmingTraining = _mapBoolToYesNo(
        sustainableData.trainingOnOrganicFarmingToFarmers,
      );
      _selectedSolarPanels = _mapBoolToYesNo(
        sustainableData.solarPanelsAtFpoLevel,
      );
      _selectedRainwaterHarvesting = _mapBoolToYesNo(
        sustainableData.establishmentOfRainwaterHarvestingAtFpoLevel,
      );
      _selectedCompostingUnits = _mapBoolToYesNo(
        sustainableData.compostingUnitsAtFpoLevel,
      );
      // Note: Electric vehicles is not in the schema, so we'll remove it from the form
    });
  }

  String? _mapBoolToYesNo(bool? value) {
    if (value == null) return null;
    return value ? 'Yes' : 'No';
  }

  bool? _mapYesNoToBool(String? value) {
    if (value == null) return null;
    return value == 'Yes';
  }

  Future<bool> _validateForm() async {
    if (_selectedClimateResilientSeeds == null) {
      _showValidationError('Please select Climate-Resilient Seeds option');
      return false;
    }
    if (_selectedOrganicFertilizers == null) {
      _showValidationError(
        'Please select Organic/bio manure/Fertilizers option',
      );
      return false;
    }
    if (_selectedDripSprinklerIrrigation == null) {
      _showValidationError('Please select Drip/Sprinkler Irrigation option');
      return false;
    }
    if (_selectedWeatherAdvisories == null) {
      _showValidationError('Please select Weather advisories option');
      return false;
    }
    if (_selectedPestDiseaseAlerts == null) {
      _showValidationError('Please select Pest/disease alerts option');
      return false;
    }
    if (_selectedAgriculturalResidue == null) {
      _showValidationError('Please select Agricultural residue supply option');
      return false;
    }
    if (_selectedOrganicFarmingTraining == null) {
      _showValidationError('Please select Organic farming training option');
      return false;
    }
    if (_selectedSolarPanels == null) {
      _showValidationError('Please select Solar Panels option');
      return false;
    }
    if (_selectedRainwaterHarvesting == null) {
      _showValidationError('Please select Rainwater Harvesting option');
      return false;
    }
    if (_selectedCompostingUnits == null) {
      _showValidationError('Please select Composting units option');
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

  Future<void> _submitForm() async {
    if (!await _validateForm()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final sustainableActivitiesInput =
          Input$SustainableActivitiesSubmissionInput(
            climateResilientSeedsToFarmers: _mapYesNoToBool(
              _selectedClimateResilientSeeds,
            ),
            organicBioManureFertilizersToFarmers: _mapYesNoToBool(
              _selectedOrganicFertilizers,
            ),
            dripSprinklerIrrigationToFarmers: _mapYesNoToBool(
              _selectedDripSprinklerIrrigation,
            ),
            weatherAdvisoriesToFarmers: _mapYesNoToBool(
              _selectedWeatherAdvisories,
            ),
            pestDiseaseAlertsToFarmers: _mapYesNoToBool(
              _selectedPestDiseaseAlerts,
            ),
            supplyingAgriculturalResidueToBioCngGasPlants: _mapYesNoToBool(
              _selectedAgriculturalResidue,
            ),
            trainingOnOrganicFarmingToFarmers: _mapYesNoToBool(
              _selectedOrganicFarmingTraining,
            ),
            solarPanelsAtFpoLevel: _mapYesNoToBool(_selectedSolarPanels),
            establishmentOfRainwaterHarvestingAtFpoLevel: _mapYesNoToBool(
              _selectedRainwaterHarvesting,
            ),
            compostingUnitsAtFpoLevel: _mapYesNoToBool(
              _selectedCompostingUnits,
            ),
          );

      debugPrint(
        'Sustainable Activities: Submitting data: $sustainableActivitiesInput',
      );

      final result = await FormDataService.instance.submitSustainableActivities(
        financialYear: widget.formYear,
        sustainableActivitiesInput: sustainableActivitiesInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result?.success != true) {
        throw Exception(
          'Failed to submit sustainable activities: ${result?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Sustainable activities data submitted successfully!',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('Sustainable activities form submission error: $e');
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

  Future<void> _handleNext() async {
    if (!await _validateForm()) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final sustainableActivitiesInput =
          Input$SustainableActivitiesSubmissionInput(
            climateResilientSeedsToFarmers: _mapYesNoToBool(
              _selectedClimateResilientSeeds,
            ),
            organicBioManureFertilizersToFarmers: _mapYesNoToBool(
              _selectedOrganicFertilizers,
            ),
            dripSprinklerIrrigationToFarmers: _mapYesNoToBool(
              _selectedDripSprinklerIrrigation,
            ),
            weatherAdvisoriesToFarmers: _mapYesNoToBool(
              _selectedWeatherAdvisories,
            ),
            pestDiseaseAlertsToFarmers: _mapYesNoToBool(
              _selectedPestDiseaseAlerts,
            ),
            supplyingAgriculturalResidueToBioCngGasPlants: _mapYesNoToBool(
              _selectedAgriculturalResidue,
            ),
            trainingOnOrganicFarmingToFarmers: _mapYesNoToBool(
              _selectedOrganicFarmingTraining,
            ),
            solarPanelsAtFpoLevel: _mapYesNoToBool(_selectedSolarPanels),
            establishmentOfRainwaterHarvestingAtFpoLevel: _mapYesNoToBool(
              _selectedRainwaterHarvesting,
            ),
            compostingUnitsAtFpoLevel: _mapYesNoToBool(
              _selectedCompostingUnits,
            ),
          );

      debugPrint(
        'Sustainable Activities: Submitting data: $sustainableActivitiesInput',
      );

      final result = await FormDataService.instance.submitSustainableActivities(
        financialYear: widget.formYear,
        sustainableActivitiesInput: sustainableActivitiesInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result?.success != true) {
        throw Exception(
          'Failed to submit sustainable activities: ${result?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Sustainable activities data submitted successfully!',
            ),
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
      debugPrint('Sustainable activities form submission error: $e');
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
                              'Sustainability Management',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Sustainable Activities',
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
                        '9/9',
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
                      widthFactor: 1.0, // 9/9 = 100%
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
                    // Section Header with note
                    Text(
                      'SUSTAINABLE ACTIVITIES BEING UNDERTAKEN BY THE FPO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const SizedBox(height: 24),

                    // Sustainable Activities Dropdowns

                    // 1. Climate-Resilient Seeds
                    _buildDropdownWithLabel(
                      label: 'Climate-Resilient Seeds to farmers',
                      value: _selectedClimateResilientSeeds,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedClimateResilientSeeds = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 2. Organic/Bio Manure/Fertilizers
                    _buildDropdownWithLabel(
                      label: 'Organic/bio manure/Fertilizers to farmers',
                      value: _selectedOrganicFertilizers,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOrganicFertilizers = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 3. Drip/Sprinkler Irrigation
                    _buildDropdownWithLabel(
                      label: 'Drip/Sprinkler Irrigation to farmers',
                      value: _selectedDripSprinklerIrrigation,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDripSprinklerIrrigation = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 4. Weather Advisories
                    _buildDropdownWithLabel(
                      label: 'Weather advisories (SMS/WhatsApp) to farmers',
                      value: _selectedWeatherAdvisories,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedWeatherAdvisories = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 5. Pest/Disease Alerts
                    _buildDropdownWithLabel(
                      label: 'Pest/disease alerts to farmers',
                      value: _selectedPestDiseaseAlerts,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPestDiseaseAlerts = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 6. Agricultural Residue Supply
                    _buildDropdownWithLabel(
                      label:
                          'Supplying agricultural residue, dung, or other organic matter to bio CNG/Gas plants',
                      value: _selectedAgriculturalResidue,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAgriculturalResidue = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 7. Organic Farming Training
                    _buildDropdownWithLabel(
                      label:
                          'Training on Organic Farming/Natural Farming to farmers',
                      value: _selectedOrganicFarmingTraining,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOrganicFarmingTraining = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 8. Solar Panels
                    _buildDropdownWithLabel(
                      label: 'Solar Panels at FPO level',
                      value: _selectedSolarPanels,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSolarPanels = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 9. Rainwater Harvesting
                    _buildDropdownWithLabel(
                      label:
                          'Establishment of Rainwater Harvesting at FPO level',
                      value: _selectedRainwaterHarvesting,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRainwaterHarvesting = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // 10. Composting Units
                    _buildDropdownWithLabel(
                      label: 'Composting units at FPO level',
                      value: _selectedCompostingUnits,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      isRequired: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCompostingUnits = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 32),

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
                            : () => FormNavigationHelper.navigateToPreviousStep(
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
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(
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

  Widget _buildDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
    bool isRequired = true,
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
              height: 1.3,
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
              items: items.map((String item) {
                return DropdownMenuItem<String>(
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
                          color: Theme.of(context).colorScheme.outlineVariant,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      item,
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
                return items.map((String item) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      item,
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
              menuMaxHeight: 120,
            ),
          ),
        ),
      ],
    );
  }
}

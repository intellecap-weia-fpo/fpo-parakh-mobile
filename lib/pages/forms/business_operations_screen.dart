import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';

class BusinessOperationsScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const BusinessOperationsScreen({
    super.key,
    required this.formYear,
    this.currentStep = 5,
  });

  @override
  State<BusinessOperationsScreen> createState() =>
      _BusinessOperationsScreenState();
}

class _BusinessOperationsScreenState extends State<BusinessOperationsScreen> {
  // Price volatility
  String? _selectedPriceVolatility;

  // Facilities to farmers - Accessibility
  final _accessibilityPercentageController = TextEditingController();

  // Facilities to farmers - Timeliness
  String? _selectedTimeliness;

  // Facilities to farmers - Price/Affordability
  String? _selectedPriceAffordability;

  // Facilities to farmers - Place
  String? _selectedPlace;

  // Distance of output collection centres
  String? _selectedOutputCollectionDistance;

  // Value chain services - Yes/No options
  String? _electronicWeighingMachines;
  String? _transportationFacility;
  String? _storage;
  String? _cleaning;
  String? _gradingAndSorting;
  String? _chilling;
  String? _packaging;
  String? _labelling;
  String? _processing;
  String? _qualityCheck;
  String? _soilTestingFacility;
  String? _customHiringCenters;
  String? _contractFarming;
  String? _advisoryServices;
  String? _creditFacilities;

  bool _isSubmitting = false;
  bool _isLoading = true;
  String? _fpoType;

  final List<String> _priceVolatilityOptions = [
    'FPO dealing in highly price sensitive/volatile commodities(oil seed ,gram etc) and price risk borne by the FPO',
    'Commodities with MSP,but price risk on FPO',
    'Part of the commodities hedged against price risk/or non volatile commodities',
    'Price risk covered through well defined hedging through NCDEX or other mediums or Not applicable- FPO only in lending/supplying inputs',
  ];

  final List<String> _timelinessOptions = [
    '30 days prior to the sowing season',
    '20 days prior to the sowing season',
    '15 days prior to the sowing season',
    '7 days prior to the sowing season',
    'Not applicable',
  ];

  final List<String> _priceAffordabilityOptions = [
    'Available to member farmers at 10% - 15% less than market price',
    'Available to member farmers at 5% - 10% less than market price',
    'Available to member farmers at 3% - 5% less than market price',
    'Available to member farmers at 1% - 3% less than market price',
    'Not applicable',
  ];

  final List<String> _placeOptions = [
    'Available within 3 KM of distance for majority of farmers',
    'Available within 6 KM of distance for majority of farmers',
    'Available within 10 KM of distance for majority of farmers',
    'Not available within 10 KM of distance for majority of farmers',
    'Not applicable',
  ];

  final List<String> _yesNoOptions = ['Yes', 'No'];

  @override
  void initState() {
    super.initState();
    _loadExistingData();
  }

  @override
  void dispose() {
    _accessibilityPercentageController.dispose();
    super.dispose();
  }

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'Business Operations: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null) {
        // Get FPO type from basic details to determine if "Not applicable" should be removed
        if (submission.fpoDetails != null) {
          final basicDetails = submission.fpoDetails!.toJson();
          _fpoType = _mapFpoTypeEnumToDisplay(basicDetails['typeOfFpo']);
          debugPrint('Business Operations: FPO Type: $_fpoType');
        }

        // Load business operations data
        if (submission.businessOperations != null) {
          final businessData = submission.businessOperations!.toJson();
          debugPrint('Business Operations: Data found: $businessData');
          _populateBusinessOperationsData(businessData);
        }
      }
    } catch (e, stack) {
      debugPrint('Business Operations: Error loading existing data: $e');
      debugPrint('Business Operations: Stack trace: $stack');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _populateBusinessOperationsData(Map<String, dynamic> data) {
    if (!mounted) return;

    setState(() {
      final priceVolatility = _mapPriceVolatilityFromEnum(
        data['priceVolatilityOfProducts'],
      );
      debugPrint('Business Operations: Price Volatility: "$priceVolatility"');
      _selectedPriceVolatility = priceVolatility;

      // Call the facilities data population method
      _populateFacilitiesData(data);
    });
  }

  void _populateFacilitiesData(Map<String, dynamic> data) {
    if (!mounted) return;

    setState(() {
      // Accessibility percentage
      if (data['accessibilityPercentage'] != null) {
        _accessibilityPercentageController.text =
            data['accessibilityPercentage'].toString();
      }

      // Dropdowns
      _selectedTimeliness = _mapTimelinessFromEnum(
        data['availabilityOfInputsTimeliness'],
      );
      _selectedPriceAffordability = _mapPriceAffordabilityFromEnum(
        data['availabilityOfInputsPriceAffordability'],
      );
      _selectedPlace = _mapPlaceFromEnum(data['availabilityOfInputsPlace']);
      _selectedOutputCollectionDistance = _mapPlaceFromEnum(
        data['distanceOfOutputCollectionCentres'],
      );

      // Yes/No fields - add debug logging
      debugPrint('Loading boolean fields from data: $data');

      _electronicWeighingMachines = _mapBoolToYesNo(
        data['electronicWeighingMachines'],
      );
      debugPrint(
        'electronicWeighingMachines: ${data['electronicWeighingMachines']} -> $_electronicWeighingMachines',
      );

      _transportationFacility = _mapBoolToYesNo(data['transportationFacility']);
      debugPrint(
        'transportationFacility: ${data['transportationFacility']} -> $_transportationFacility',
      );

      _storage = _mapBoolToYesNo(data['storage']);
      debugPrint('storage: ${data['storage']} -> $_storage');

      _cleaning = _mapBoolToYesNo(data['cleaning']);
      debugPrint('cleaning: ${data['cleaning']} -> $_cleaning');

      _gradingAndSorting = _mapBoolToYesNo(data['gradingAndSorting']);
      debugPrint(
        'gradingAndSorting: ${data['gradingAndSorting']} -> $_gradingAndSorting',
      );

      _chilling = _mapBoolToYesNo(data['chilling']);
      debugPrint('chilling: ${data['chilling']} -> $_chilling');

      _packaging = _mapBoolToYesNo(data['packaging']);
      debugPrint('packaging: ${data['packaging']} -> $_packaging');

      _labelling = _mapBoolToYesNo(data['labelling']);
      debugPrint('labelling: ${data['labelling']} -> $_labelling');

      _processing = _mapBoolToYesNo(data['processing']);
      debugPrint('processing: ${data['processing']} -> $_processing');

      _qualityCheck = _mapBoolToYesNo(data['qualityCheck']);
      debugPrint('qualityCheck: ${data['qualityCheck']} -> $_qualityCheck');

      _soilTestingFacility = _mapBoolToYesNo(data['soilTestingFacility']);
      debugPrint(
        'soilTestingFacility: ${data['soilTestingFacility']} -> $_soilTestingFacility',
      );

      _customHiringCenters = _mapBoolToYesNo(data['customHiringCenters']);
      debugPrint(
        'customHiringCenters: ${data['customHiringCenters']} -> $_customHiringCenters',
      );

      _contractFarming = _mapBoolToYesNo(data['contractFarming']);
      debugPrint(
        'contractFarming: ${data['contractFarming']} -> $_contractFarming',
      );

      _advisoryServices = _mapBoolToYesNo(data['advisoryServices']);
      debugPrint(
        'advisoryServices: ${data['advisoryServices']} -> $_advisoryServices',
      );

      _creditFacilities = _mapBoolToYesNo(data['creditFacilities']);
      debugPrint(
        'creditFacilities: ${data['creditFacilities']} -> $_creditFacilities',
      );
    });
  }

  String? _mapPriceVolatilityFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'HIGHLY_VOLATILE_FPO_RISK':
        return 'FPO dealing in highly price sensitive/volatile commodities(oil seed ,gram etc) and price risk borne by the FPO';
      case 'MSP_FPO_RISK':
        return 'Commodities with MSP,but price risk on FPO';
      case 'PARTIAL_HEDGE':
        return 'Part of the commodities hedged against price risk/or non volatile commodities';
      case 'WELL_HEDGED':
        return 'Price risk covered through well defined hedging through NCDEX or other mediums or Not applicable- FPO only in lending/supplying inputs';
      case 'NOT_APPLICABLE':
        return 'Price risk covered through well defined hedging through NCDEX or other mediums or Not applicable- FPO only in lending/supplying inputs';
      default:
        return null;
    }
  }

  String? _mapTimelinessFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'A_30_DAYS_PRIOR':
        return '30 days prior to the sowing season';
      case 'A_20_DAYS_PRIOR':
        return '20 days prior to the sowing season';
      case 'A_15_DAYS_PRIOR':
        return '15 days prior to the sowing season';
      case 'A_7_DAYS_PRIOR':
        return '7 days prior to the sowing season';
      case 'NOT_APPLICABLE':
        return 'Not applicable';
      default:
        return null;
    }
  }

  String? _mapPriceAffordabilityFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'A_10_15_PERCENT_LESS':
        return 'Available to member farmers at 10% - 15% less than market price';
      case 'A_5_10_PERCENT_LESS':
        return 'Available to member farmers at 5% - 10% less than market price';
      case 'A_3_5_PERCENT_LESS':
        return 'Available to member farmers at 3% - 5% less than market price';
      case 'A_1_3_PERCENT_LESS':
        return 'Available to member farmers at 1% - 3% less than market price';
      case 'NOT_APPLICABLE':
        return 'Not applicable';
      default:
        return null;
    }
  }

  String? _mapPlaceFromEnum(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'A_3_KM_AVAILABLE':
        return 'Available within 3 KM of distance for majority of farmers';
      case 'A_6_KM_AVAILABLE':
        return 'Available within 6 KM of distance for majority of farmers';
      case 'A_10_KM_AVAILABLE':
        return 'Available within 10 KM of distance for majority of farmers';
      case 'NOT_WITHIN_10_KM':
        return 'Not available within 10 KM of distance for majority of farmers';
      case 'NOT_APPLICABLE':
        return 'Not applicable';
      default:
        return null;
    }
  }

  String? _mapBoolToYesNo(bool? value) {
    if (value == null) return null;
    return value ? 'Yes' : 'No';
  }

  String? _mapFpoTypeEnumToDisplay(String? enumValue) {
    if (enumValue == null) return null;

    switch (enumValue) {
      case 'INPUTS_OR_OUTPUT':
        return 'Dealing in inputs or output';
      case 'INPUTS_AND_OUTPUT':
        return 'Dealing in input and output';
      case 'LOW_CAPACITY':
        return 'Dealing in inputs,output and processing with less than 50% capacity utilization';
      case 'HIGH_CAPACITY':
        return 'Dealing in inputs,output and processing with more than 50% capacity utilization';
      default:
        return enumValue;
    }
  }

  List<String> _getFilteredTimelinessOptions() {
    if (_fpoType == 'Dealing in input and output') {
      return _timelinessOptions
          .where((option) => option != 'Not applicable')
          .toList();
    }
    return _timelinessOptions;
  }

  List<String> _getFilteredPriceAffordabilityOptions() {
    if (_fpoType == 'Dealing in input and output') {
      return _priceAffordabilityOptions
          .where((option) => option != 'Not applicable')
          .toList();
    }
    return _priceAffordabilityOptions;
  }

  List<String> _getFilteredPlaceOptions() {
    if (_fpoType == 'Dealing in input and output') {
      return _placeOptions
          .where((option) => option != 'Not applicable')
          .toList();
    }
    return _placeOptions;
  }

  Enum$PriceVolatilityTypeEnum? _mapPriceVolatilityToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;

    if (displayValue.contains('highly price sensitive/volatile') &&
        displayValue.contains('FPO')) {
      return Enum$PriceVolatilityTypeEnum.HIGHLY_VOLATILE_FPO_RISK;
    } else if (displayValue.contains('MSP') &&
        displayValue.contains('price risk on FPO')) {
      return Enum$PriceVolatilityTypeEnum.MSP_FPO_RISK;
    } else if (displayValue.contains('Part of the commodities hedged')) {
      return Enum$PriceVolatilityTypeEnum.PARTIAL_HEDGE;
    } else if (displayValue.contains('NCDEX')) {
      return Enum$PriceVolatilityTypeEnum.WELL_HEDGED;
    } else if (displayValue.contains('Not applicable')) {
      return Enum$PriceVolatilityTypeEnum.NOT_APPLICABLE;
    }
    return null;
  }

  Enum$InputTimelinessTypeEnum? _mapTimelinessToEnum(String? displayValue) {
    if (displayValue == null) return null;

    if (displayValue == '30 days prior to the sowing season') {
      return Enum$InputTimelinessTypeEnum.THIRTY_DAYS;
    } else if (displayValue == '20 days prior to the sowing season') {
      return Enum$InputTimelinessTypeEnum.TWENTY_DAYS;
    } else if (displayValue == '15 days prior to the sowing season') {
      return Enum$InputTimelinessTypeEnum.FIFTEEN_DAYS;
    } else if (displayValue == '7 days prior to the sowing season') {
      return Enum$InputTimelinessTypeEnum.SEVEN_DAYS;
    } else if (displayValue == 'Not applicable') {
      return Enum$InputTimelinessTypeEnum.NOT_APPLICABLE;
    }
    return null;
  }

  Enum$PriceAffordabilityTypeEnum? _mapPriceAffordabilityToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;

    if (displayValue.contains('10% - 15%')) {
      return Enum$PriceAffordabilityTypeEnum.TEN_TO_FIFTEEN_PERCENT;
    } else if (displayValue.contains('5% - 10%')) {
      return Enum$PriceAffordabilityTypeEnum.FIVE_TO_TEN_PERCENT;
    } else if (displayValue.contains('3% - 5%')) {
      return Enum$PriceAffordabilityTypeEnum.THREE_TO_FIVE_PERCENT;
    } else if (displayValue.contains('1% - 3%')) {
      return Enum$PriceAffordabilityTypeEnum.ONE_TO_THREE_PERCENT;
    } else if (displayValue == 'Not applicable') {
      return Enum$PriceAffordabilityTypeEnum.NOT_APPLICABLE;
    }
    return null;
  }

  Enum$DistanceAvailabilityTypeEnum? _mapPlaceToEnum(String? displayValue) {
    if (displayValue == null) return null;

    if (displayValue.contains('3 KM')) {
      return Enum$DistanceAvailabilityTypeEnum.THREE_KM;
    } else if (displayValue.contains('6 KM')) {
      return Enum$DistanceAvailabilityTypeEnum.SIX_KM;
    } else if (displayValue.contains('10 KM') &&
        !displayValue.contains('Not available')) {
      return Enum$DistanceAvailabilityTypeEnum.TEN_KM;
    } else if (displayValue.contains('Not available')) {
      return Enum$DistanceAvailabilityTypeEnum.NOT_WITHIN_TEN_KM;
    } else if (displayValue == 'Not applicable') {
      return Enum$DistanceAvailabilityTypeEnum.NOT_APPLICABLE;
    }
    return null;
  }

  String? _mapPlaceToStringEnum(String? displayValue) {
    if (displayValue == null) return null;

    if (displayValue.contains('3 KM')) {
      return 'A_3_KM_AVAILABLE';
    } else if (displayValue.contains('6 KM')) {
      return 'A_6_KM_AVAILABLE';
    } else if (displayValue.contains('10 KM') &&
        !displayValue.contains('Not available')) {
      return 'A_10_KM_AVAILABLE';
    } else if (displayValue.contains('Not available')) {
      return 'NOT_WITHIN_10_KM';
    } else if (displayValue == 'Not applicable') {
      return 'NOT_APPLICABLE';
    }
    return null;
  }

  bool? _mapYesNoToBool(String? value) {
    if (value == null) return null;
    return value == 'Yes';
  }

  Input$BusinessOperationsSubmissionInput _extractBusinessOperationsData() {
    final accessibilityPercentage = double.tryParse(
      _accessibilityPercentageController.text.trim(),
    );

    return Input$BusinessOperationsSubmissionInput(
      priceVolatilityOfProducts: _mapPriceVolatilityToEnum(
        _selectedPriceVolatility,
      ),
      accessibilityPercentage: accessibilityPercentage.toString(),
      availabilityOfInputsTimeliness: _mapTimelinessToEnum(_selectedTimeliness),
      availabilityOfInputsPriceAffordability: _mapPriceAffordabilityToEnum(
        _selectedPriceAffordability,
      ),
      availabilityOfInputsPlace: _mapPlaceToEnum(_selectedPlace),
      distanceOfOutputCollectionCentres: _mapPlaceToStringEnum(
        _selectedOutputCollectionDistance,
      ),
      // Value chain services
      electronicWeighingMachines: _mapYesNoToBool(_electronicWeighingMachines),
      transportationFacility: _mapYesNoToBool(_transportationFacility),
      storage: _mapYesNoToBool(_storage),
      cleaning: _mapYesNoToBool(_cleaning),
      gradingAndSorting: _mapYesNoToBool(_gradingAndSorting),
      chilling: _mapYesNoToBool(_chilling),
      packaging: _mapYesNoToBool(_packaging),
      labelling: _mapYesNoToBool(_labelling),
      processing: _mapYesNoToBool(_processing),
      qualityCheck: _mapYesNoToBool(_qualityCheck),
      soilTestingFacility: _mapYesNoToBool(_soilTestingFacility),
      customHiringCenters: _mapYesNoToBool(_customHiringCenters),
      contractFarming: _mapYesNoToBool(_contractFarming),
      advisoryServices: _mapYesNoToBool(_advisoryServices),
      creditFacilities: _mapYesNoToBool(_creditFacilities),
    );
  }

  Future<bool> _validateForm() {
    // Validate required fields
    if (_selectedPriceVolatility == null) {
      _showValidationError('Please select price volatility of the products');
      return Future.value(false);
    }

    // Validate accessibility percentage
    if (_accessibilityPercentageController.text.trim().isEmpty) {
      _showValidationError('Please enter accessibility percentage');
      return Future.value(false);
    }

    // Validate other required fields
    if (_selectedTimeliness == null) {
      _showValidationError('Please select timeliness option');
      return Future.value(false);
    }

    if (_selectedPriceAffordability == null) {
      _showValidationError('Please select price/affordability option');
      return Future.value(false);
    }

    if (_selectedPlace == null) {
      _showValidationError('Please select place option');
      return Future.value(false);
    }

    if (_selectedOutputCollectionDistance == null) {
      _showValidationError(
        'Please select distance of output collection centres',
      );
      return Future.value(false);
    }

    // Validate all value chain services
    if (_electronicWeighingMachines == null) {
      _showValidationError('Please select electronic weighing machines option');
      return Future.value(false);
    }

    if (_transportationFacility == null) {
      _showValidationError('Please select transportation facility option');
      return Future.value(false);
    }

    if (_storage == null) {
      _showValidationError('Please select storage facility option');
      return Future.value(false);
    }

    if (_cleaning == null) {
      _showValidationError('Please select cleaning facility option');
      return Future.value(false);
    }

    if (_gradingAndSorting == null) {
      _showValidationError('Please select grading and sorting option');
      return Future.value(false);
    }

    if (_chilling == null) {
      _showValidationError('Please select chilling facility option');
      return Future.value(false);
    }

    if (_packaging == null) {
      _showValidationError('Please select packaging facility option');
      return Future.value(false);
    }

    if (_labelling == null) {
      _showValidationError('Please select labelling facility option');
      return Future.value(false);
    }

    if (_processing == null) {
      _showValidationError('Please select processing facility option');
      return Future.value(false);
    }

    if (_qualityCheck == null) {
      _showValidationError('Please select quality check facility option');
      return Future.value(false);
    }

    if (_soilTestingFacility == null) {
      _showValidationError('Please select soil testing facility option');
      return Future.value(false);
    }

    if (_customHiringCenters == null) {
      _showValidationError('Please select custom hiring centers option');
      return Future.value(false);
    }

    if (_contractFarming == null) {
      _showValidationError('Please select contract farming option');
      return Future.value(false);
    }

    if (_advisoryServices == null) {
      _showValidationError('Please select advisory services option');
      return Future.value(false);
    }

    if (_creditFacilities == null) {
      _showValidationError('Please select credit facilities option');
      return Future.value(false);
    }

    // All validation passed
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
      // Submit business operations data
      final businessOperationsInput = _extractBusinessOperationsData();
      debugPrint(
        'Business Operations: Submitting business operations data: $businessOperationsInput',
      );

      final result1 = await FormDataService.instance.submitBusinessOperations(
        financialYear: widget.formYear,
        businessOperationsInput: businessOperationsInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result1?.success != true) {
        throw Exception(
          'Failed to submit business operations: ${result1?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Business operations data submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
      return true;
    } catch (e) {
      debugPrint('Business operations form submission error: $e');
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

  Future<bool> _handleNext() async {
    final success = await _submitForm();
    if (success && mounted) {
      return true;
    }
    return false;
  }

  get isVisibleTimelinessSection {
    return _selectedTimeliness != 'Not applicable';
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
                              'Business Management',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Business & Operations',
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
                        '5/9',
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
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.556, // 5/9 = 55.6%
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
                    // Price Volatility Section
                    Text(
                      'PRICE VOLATILITY OF THE PRODUCTS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildOptimizedDropdownWithLabel(
                      label: 'Price volatility of the products',
                      value: _selectedPriceVolatility,
                      items: _priceVolatilityOptions,
                      hintText: 'Select price volatility option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPriceVolatility = newValue;
                        });
                      },
                      required: true,
                    ),

                    const SizedBox(height: 32),

                    // Facilities to Farmers Section
                    Text(
                      'FACILITIES TO FARMERS (E)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Accessibility
                    _buildTextFieldWithLabel(
                      label:
                          'Availability of inputs to members – Accessibility (%)',
                      controller: _accessibilityPercentageController,
                      hintText: 'Enter percentage',
                      keyboardType: TextInputType.number,
                      required: true,
                    ),

                    const SizedBox(height: 20),

                    // Timeliness
                    _buildOptimizedDropdownWithLabel(
                      label: 'Availability of inputs to members – timeliness',
                      value: _selectedTimeliness,
                      items: _getFilteredTimelinessOptions(),
                      hintText: 'Select timeliness option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTimeliness = newValue;
                        });
                      },
                      required: true,
                    ),

                    const SizedBox(height: 20),

                    // Price/Affordability
                    _buildOptimizedDropdownWithLabel(
                      label:
                          'Availability of inputs to members- Price/Affordability',
                      value: _selectedPriceAffordability,
                      items: _getFilteredPriceAffordabilityOptions(),
                      hintText: 'Select price/affordability option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPriceAffordability = newValue;
                        });
                      },
                      required: true,
                    ),

                    const SizedBox(height: 20),

                    // Place
                    _buildOptimizedDropdownWithLabel(
                      label: 'Availability of inputs to members- Place',
                      value: _selectedPlace,
                      items: _getFilteredPlaceOptions(),
                      hintText: 'Select place option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPlace = newValue;
                        });
                      },
                      required: true,
                    ),

                    const SizedBox(height: 20),

                    // Distance of output collection centres
                    _buildOptimizedDropdownWithLabel(
                      label: 'Distance of output collection centres',
                      value: _selectedOutputCollectionDistance,
                      items: _getFilteredPlaceOptions(),
                      hintText: 'Select distance option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOutputCollectionDistance = newValue;
                        });
                      },
                      required: true,
                    ),

                    const SizedBox(height: 32),

                    // Value Chain Services Section
                    Text(
                      'VALUE CHAIN SERVICES TO THE MEMBERS (E)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Value chain services dropdowns
                    _buildDropdownWithLabel(
                      label: 'Electronic Weighing Machines',
                      value: _electronicWeighingMachines,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _electronicWeighingMachines = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Transportation facility',
                      value: _transportationFacility,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _transportationFacility = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Storage',
                      value: _storage,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _storage = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Cleaning',
                      value: _cleaning,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _cleaning = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Grading & Sorting',
                      value: _gradingAndSorting,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _gradingAndSorting = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Chilling',
                      value: _chilling,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _chilling = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Packaging',
                      value: _packaging,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _packaging = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Labelling',
                      value: _labelling,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _labelling = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Processing',
                      value: _processing,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _processing = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Quality check',
                      value: _qualityCheck,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _qualityCheck = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Soil testing facility',
                      value: _soilTestingFacility,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _soilTestingFacility = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Custom Hiring Centers',
                      value: _customHiringCenters,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _customHiringCenters = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Contract Farming',
                      value: _contractFarming,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _contractFarming = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildOptimizedDropdownWithLabel(
                      label:
                          'Advisory services (Price, Weather and Market Information)',
                      value: _advisoryServices,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _advisoryServices = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Credit Facilities',
                      value: _creditFacilities,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      required: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          _creditFacilities = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Footer Actions
            FormNavigationHelper.buildNavigationButtons(
              context,
              widget.formYear,
              widget.currentStep,
              onNext: _handleNext,
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
    bool required = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (required)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
            ],
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

  Widget _buildDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
    bool required = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (required)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
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
              menuMaxHeight: 300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptimizedDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
    bool required = false,
  }) {
    // Determine if we have long text items that need smaller font
    bool hasLongText = items.any((item) => item.length > 50);
    double fontSize = hasLongText ? 11.0 : 14.0;
    double hintFontSize = hasLongText ? 13.0 : 15.0;
    int maxLines = hasLongText ? 3 : 2;
    int selectedMaxLines = hasLongText ? 2 : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (required)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
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
                    fontSize: hintFontSize,
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
                          color: Colors.grey.shade200,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Theme.of(context).colorScheme.onSurface,
                        height: 1.4,
                      ),
                      softWrap: true,
                      maxLines: maxLines,
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
                        fontSize: fontSize,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      softWrap: true,
                      maxLines: selectedMaxLines,
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
              menuMaxHeight: hasLongText ? 400 : 300,
              itemHeight: null,
            ),
          ),
        ),
      ],
    );
  }
}

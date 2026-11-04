import 'package:flutter/material.dart';
import 'package:fpo/utils/scalars.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/voice_input_widget.dart';

class FPOProfileScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const FPOProfileScreen({
    super.key,
    required this.formYear,
    this.currentStep = 1,
  });

  @override
  State<FPOProfileScreen> createState() => _FPOProfileScreenState();
}

class _FPOProfileScreenState extends State<FPOProfileScreen> {
  final _fpoNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtController = TextEditingController();
  final _incorporationDateController = TextEditingController();
  final _commencementDateController = TextEditingController();
  final _ageController = TextEditingController();
  final _sizeFY2324Controller = TextEditingController();
  final _sizeFY2223Controller = TextEditingController();
  final _sizeFY2122Controller = TextEditingController();
  final _farmersTransactedController = TextEditingController();
  final _womenMembersController = TextEditingController();
  final _targetSizeController = TextEditingController();
  final _pgsFigsCountController = TextEditingController();
  final _grantOrganizationController = TextEditingController();
  final _otherPromotingAgencyController = TextEditingController();
  final _otherPromotingAgencyNameController = TextEditingController();

  String? _selectedState;
  String? _selectedLegalStructure;
  String? _selectedFpoType;
  bool? _dealsThroughPgsFigs;
  String? _selectedPromotingAgency;
  String? _selectedPromotingAgencyType;
  bool? _hasSupportingAgency;
  bool? _receivedGrants;
  bool _isSubmitting = false;
  bool _isLoading = true;

  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _fieldKeys = {
    'fpoName': GlobalKey(),
    'address': GlobalKey(),
    'district': GlobalKey(),
    'state': GlobalKey(),
    'legalStructure': GlobalKey(),
    'incorporationDate': GlobalKey(),
    'commencementDate': GlobalKey(),
    'age': GlobalKey(),
    'fpoType': GlobalKey(),
    'farmersTransacted': GlobalKey(),
    'womenMembers': GlobalKey(),
    'targetSize': GlobalKey(),
  };

  final List<String> _states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Andaman and Nicobar Islands',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Chandigarh',
    'Delhi',
    'Goa',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Jammu and Kashmir',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Puducherry',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  final List<String> _legalStructures = [
    'Co-operative',
    'Producer Company',
    'Non Profit Company',
    'Trust',
    'Section -8 Company',
  ];

  final List<String> _fpoTypes = [
    'Dealing in inputs or output',
    'Dealing in input and output',
    'Dealing in inputs,output and processing with less than 50% capacity utilization',
    'Dealing in inputs,output and processing with more than 50% capacity utilization',
  ];

  final List<String> _promotingAgencies = [
    'Foundation for Development of Rural Value Chains (FDRVC)',
    'National Bank for Agriculture and Rural Development (NABARD)',
    'Small Farmers Agri-Business Consortium (SFAC)',
    'National Agricultural Cooperative Marketing Federation of India (NAFED)',
    'North Eastern Regional Agricultural Marketing Corporation Limited (NERAMAC)',
    'Tamil Nadu-Small Farmers Agri-Business Consortium (TN-SFAC)',
    'Small Farmers Agri-Business Consortium Haryana (SFACH)',
    'Watershed Development Department (WDD)- Karnataka',
    'Any Other',
  ];

  final List<String> _promotingAgencyTypes = [
    'Government Organization',
    'NGO',
    'Trusts',
    'Cooperative',
    'Wings/Development Foundation of Corporates',
    'State Govt. Departments',
    'KVKs',
    'Farmer Federations',
    'Commodity Boards',
    'Big Farmer Companies',
    'Others',
  ];

  @override
  void initState() {
    super.initState();
    _incorporationDateController.addListener(_calculateAge);
    _loadExistingData();
  }

  @override
  void dispose() {
    _fpoNameController.dispose();
    _addressController.dispose();
    _districtController.dispose();
    _incorporationDateController.dispose();
    _commencementDateController.dispose();
    _ageController.dispose();
    _sizeFY2324Controller.dispose();
    _sizeFY2223Controller.dispose();
    _sizeFY2122Controller.dispose();
    _farmersTransactedController.dispose();
    _womenMembersController.dispose();
    _targetSizeController.dispose();
    _pgsFigsCountController.dispose();
    _grantOrganizationController.dispose();
    _otherPromotingAgencyController.dispose();
    _otherPromotingAgencyNameController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // Helper methods to get dynamic financial years
  int get _currentYearInt {
    try {
      // Handle different formats like "2024", "2024-25", "FY 2024", etc.
      String yearStr = widget.formYear.replaceAll(RegExp(r'[^0-9]'), '');
      if (yearStr.length >= 4) {
        return int.parse(yearStr.substring(0, 4));
      }
      return int.parse(yearStr);
    } catch (e) {
      // Default to current year if parsing fails
      return DateTime.now().year;
    }
  }

  String get _currentYear => _currentYearInt.toString();
  String get _previousYear => (_currentYearInt - 1).toString();
  String get _secondPreviousYear => (_currentYearInt - 2).toString();
  String get _nextYear => (_currentYearInt + 1).toString();

  String get _firstFY =>
      'FY ${_secondPreviousYear.substring(2)}-${_previousYear.substring(2)}';
  String get _secondFY =>
      'FY ${_previousYear.substring(2)}-${_currentYear.substring(2)}';
  String get _thirdFY =>
      'FY ${_currentYear.substring(2)}-${_nextYear.substring(2)}';

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'FPO Profile: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('FPO Profile: Full submission data: $submission');

      if (submission != null) {
        debugPrint('FPO Profile: Submission exists, checking basicDetails...');

        if (submission.fpoDetails != null) {
          final basicDetails = submission.fpoDetails!.toJson();
          debugPrint('FPO Profile: BasicDetails found: $basicDetails');
          await _populateFormFields(basicDetails);
        } else {
          debugPrint('FPO Profile: No fpoDetails found in submission');
        }
      } else {
        debugPrint('FPO Profile: No submission found for this financial year');
      }
    } catch (e, stack) {
      debugPrint('FPO Profile: Error loading existing data: $e');
      debugPrint(
        'FPO Profile: Stack trace: ${StackTrace.current}, ${stack.toString()}',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _populateFormFields(Map<String, dynamic> basicDetails) async {
    if (!mounted) return;

    debugPrint('FPO Profile: Populating fields with data...');

    setState(() {
      // Basic text fields
      final fpoName = basicDetails['nameOfProducerOrganization'] ?? '';
      final address = basicDetails['registeredAddress'] ?? '';
      final district = basicDetails['district'] ?? '';
      final age = basicDetails['ageOfFpoYears']?.toString() ?? '';

      debugPrint(
        'FPO Profile: Text fields - Name: "$fpoName", Address: "$address", District: "$district", Age: "$age"',
      );

      _fpoNameController.text = fpoName;
      _addressController.text = address;
      _districtController.text = district;
      _ageController.text = age;

      // Size fields
      final size2324 = basicDetails['sizeOfFpoFy2324']?.toString() ?? '';
      final size2223 = basicDetails['sizeOfFpoFy2223']?.toString() ?? '';
      final size2122 = basicDetails['sizeOfFpoFy2122']?.toString() ?? '';

      debugPrint(
        'FPO Profile: Size fields - 2324: "$size2324", 2223: "$size2223", 2122: "$size2122"',
      );

      _sizeFY2324Controller.text = size2324;
      _sizeFY2223Controller.text = size2223;
      _sizeFY2122Controller.text = size2122;
      _farmersTransactedController.text =
          basicDetails['farmersTransacted']?.toString() ?? '';
      _womenMembersController.text =
          basicDetails['womenMembers']?.toString() ?? '';
      _targetSizeController.text =
          basicDetails['targetSizeOfFpo']?.toString() ?? '';
      _pgsFigsCountController.text =
          basicDetails['numPgsFigs']?.toString() ?? '';
      _grantOrganizationController.text =
          basicDetails['grantMakingOrganization'] ?? '';
      _otherPromotingAgencyController.text =
          basicDetails['otherPromotingAgencyType'] ?? '';
      _otherPromotingAgencyNameController.text = _getPromotingAgencyName(
        basicDetails,
      );

      // Date fields
      final incDate = _formatDateForDisplay(
        basicDetails['dateOfIncorporation'],
      );
      final commDate = _formatDateForDisplay(
        basicDetails['dateOfCommencement'],
      );

      debugPrint(
        'FPO Profile: Date fields - Incorporation: "$incDate", Commencement: "$commDate"',
      );

      _incorporationDateController.text = incDate;
      _commencementDateController.text = commDate;

      // Calculate age after setting incorporation date
      _calculateAge();

      // Dropdown selections
      final state = basicDetails['state'];
      final legalStructure = _mapLegalStructureFromEnum(
        basicDetails['typeOfProducerOrganization'],
      );
      final fpoType = _mapFpoTypeFromEnum(basicDetails['typeOfFpo']);
      final agencyType = _mapPromotingAgencyTypeFromEnum(
        basicDetails['typeOfPromotingAgency'],
      );
      final agency = _getDisplayPromotingAgency(basicDetails);

      debugPrint(
        'FPO Profile: Dropdown fields - State: "$state", Legal: "$legalStructure", FpoType: "$fpoType", AgencyType: "$agencyType", Agency: "$agency"',
      );

      _selectedState = state;
      _selectedLegalStructure = legalStructure;
      _selectedFpoType = fpoType;
      _selectedPromotingAgencyType = agencyType;
      // TODO: fix this
      _selectedPromotingAgency = agency;

      // Boolean fields
      final dealsPgsFigs = basicDetails['dealsThroughPgsFigs'];
      final hasSupportingAgency = basicDetails['supportedByPromotingAgency'];
      final receivedGrants = basicDetails['receivedGrants'];

      debugPrint(
        'FPO Profile: Boolean fields - PgsFigs: $dealsPgsFigs, SupportingAgency: $hasSupportingAgency, Grants: $receivedGrants',
      );

      _dealsThroughPgsFigs = dealsPgsFigs;
      _hasSupportingAgency = hasSupportingAgency;
      _receivedGrants = receivedGrants;
    });

    debugPrint('FPO Profile: Field population completed');
  }

  String _formatDateForDisplay(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '';
    try {
      final date = DateTime.parse(isoDate);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return '';
    }
  }

  String? _mapLegalStructureFromEnum(dynamic enumValue) {
    debugPrint('FPO Profile: Mapping legal structure from enum: "$enumValue" (${enumValue.runtimeType})');
    
    // Handle if we get an enum object directly
    if (enumValue is Enum$ProducerOrgTypeEnum) {
      switch (enumValue) {
        case Enum$ProducerOrgTypeEnum.CO_OPERATIVE_SOCIETY:
          return 'Co-operative';
        case Enum$ProducerOrgTypeEnum.PRODUCER_COMPANY:
          return 'Producer Company';
        case Enum$ProducerOrgTypeEnum.NON_PROFIT_SOCIETY:
          return 'Non Profit Company';
        case Enum$ProducerOrgTypeEnum.TRUST:
          return 'Trust';
        case Enum$ProducerOrgTypeEnum.SECTION_8_COMPANY:
          return 'Section -8 Company';
        default:
          return enumValue.name;
      }
    }
    
    // Handle if we get a string representation
    if (enumValue is String) {
      String? result;
      switch (enumValue) {
        case 'CO_OPERATIVE_SOCIETY':
          result = 'Co-operative';
          break;
        case 'PRODUCER_COMPANY':
          result = 'Producer Company';
          break;
        case 'NON_PROFIT_SOCIETY':
          result = 'Non Profit Company';
          break;
        case 'TRUST':
          result = 'Trust';
          break;
        case 'SECTION_8_COMPANY':
          result = 'Section -8 Company';
          break;
        default:
          result = enumValue;
      }

      debugPrint('FPO Profile: Legal structure mapped to: "$result"');
      return result;
    }
    
    return null;
  }

  String? _mapFpoTypeFromEnum(String? enumValue) {
    debugPrint('FPO Profile: Mapping FPO type from enum: "$enumValue"');
    if (enumValue == null) return null;

    String? result;
    switch (enumValue) {
      case 'INPUTS_OR_OUTPUT':
        result = 'Dealing in inputs or output';
        break;
      case 'INPUTS_AND_OUTPUT':
        result = 'Dealing in input and output';
        break;
      case 'LOW_CAPACITY':
        result =
            'Dealing in inputs,output and processing with less than 50% capacity utilization';
        break;
      case 'HIGH_CAPACITY':
        result =
            'Dealing in inputs,output and processing with more than 50% capacity utilization';
        break;
      default:
        result = enumValue;
    }

    debugPrint('FPO Profile: FPO type mapped to: "$result"');
    return result;
  }

  String? _mapPromotingAgencyTypeFromEnum(String? enumValue) {
    if (enumValue == null) return null;
    switch (enumValue) {
      case 'STATE_GOVT':
        return 'Government Organization';
      case 'NGO':
        return 'NGO';
      case 'TRUSTS':
        return 'Trusts';
      case 'COOPERATIVES':
        return 'Cooperative';
      case 'CORPORATE_WINGS':
        return 'Wings/Development Foundation of Corporates';
      case 'KVKS':
        return 'KVKs';
      case 'FARMER_FEDERATIONS':
        return 'Farmer Federations';
      case 'COMMODITY_BOARDS':
        return 'Commodity Boards';
      case 'BIG_FARMER_COMPANIES':
        return 'Big Farmer Companies';
      case 'OTHERS':
        return 'Others';
      default:
        return enumValue;
    }
  }

  String _getDisplayPromotingAgency(Map<String, dynamic> basicDetails) {
    final promotingAgencyName = basicDetails['promotingAgencyName'];

    if (promotingAgencyName == null || promotingAgencyName.isEmpty) {
      return '';
    }

    // Check if it's a custom name (when "Any Other" was selected)
    final standardAgencies = [
      'Foundation for Development of Rural Value Chains (FDRVC)',
      'National Bank for Agriculture and Rural Development (NABARD)',
      'Small Farmers Agri-Business Consortium (SFAC)',
      'National Agricultural Cooperative Marketing Federation of India (NAFED)',
      'North Eastern Regional Agricultural Marketing Corporation Limited (NERAMAC)',
      'Tamil Nadu-Small Farmers Agri-Business Consortium (TN-SFAC)',
      'Small Farmers Agri-Business Consortium Haryana (SFACH)',
      'Watershed Development Department (WDD)- Karnataka',
    ];

    if (standardAgencies.contains(promotingAgencyName)) {
      return promotingAgencyName;
    } else {
      // This is a custom name, so set it as "Any Other" and populate the custom field
      return 'Any Other';
    }
  }

  String _getPromotingAgencyName(Map<String, dynamic> basicDetails) {
    final promotingAgencyName = basicDetails['promotingAgencyName'];
    final standardAgencies = [
      'Foundation for Development of Rural Value Chains (FDRVC)',
      'National Bank for Agriculture and Rural Development (NABARD)',
      'Small Farmers Agri-Business Consortium (SFAC)',
      'National Agricultural Cooperative Marketing Federation of India (NAFED)',
      'North Eastern Regional Agricultural Marketing Corporation Limited (NERAMAC)',
      'Tamil Nadu-Small Farmers Agri-Business Consortium (TN-SFAC)',
      'Small Farmers Agri-Business Consortium Haryana (SFACH)',
      'Watershed Development Department (WDD)- Karnataka',
    ];

    if (promotingAgencyName != null &&
        !standardAgencies.contains(promotingAgencyName)) {
      return promotingAgencyName;
    }
    return '';
  }

  Input$FPODetailsSubmissionInput _extractFormData() {
    return Input$FPODetailsSubmissionInput(
      nameOfProducerOrganization: _fpoNameController.text.trim(),
      registeredAddress: _addressController.text.trim(),
      district: _districtController.text.trim(),
      state: _selectedState,
      typeOfProducerOrganization: _mapLegalStructure(_selectedLegalStructure),
      dateOfIncorporation: CalendarDate.parse(
        _incorporationDateController.text,
      ).toString(),
      dateOfCommencement: CalendarDate.parse(
        _commencementDateController.text,
      ).toString(),
      ageOfFpoYears: double.tryParse(_ageController.text.trim()),
      typeOfFpo: _mapFpoType(_selectedFpoType),
      sizeOfFpoFy2324: int.tryParse(_sizeFY2324Controller.text.trim()),
      sizeOfFpoFy2223: int.tryParse(_sizeFY2223Controller.text.trim()),
      sizeOfFpoFy2122: int.tryParse(_sizeFY2122Controller.text.trim()),
      farmersTransacted: int.tryParse(_farmersTransactedController.text.trim()),
      womenMembers: int.tryParse(_womenMembersController.text.trim()),
      targetSizeOfFpo: int.tryParse(_targetSizeController.text.trim()),
      dealsThroughPgsFigs: _dealsThroughPgsFigs ?? false,
      numPgsFigs: int.tryParse(_pgsFigsCountController.text.trim()),
      supportedByPromotingAgency: _hasSupportingAgency ?? false,
      promotingAgencyName: _selectedPromotingAgency == 'Any Other'
          ? _otherPromotingAgencyNameController.text.trim()
          : _selectedPromotingAgency,
      typeOfPromotingAgency: _mapPromotingAgencyType(
        _selectedPromotingAgencyType,
      ),
      otherPromotingAgencyType: _selectedPromotingAgencyType == 'Others'
          ? _otherPromotingAgencyController.text.trim()
          : null,
      receivedGrants: _receivedGrants ?? false,
      grantMakingOrganization: _grantOrganizationController.text.trim().isEmpty
          ? null
          : _grantOrganizationController.text.trim(),
    );
  }

  DateTime? _parseDateTime(String dateStr) {
    if (dateStr.isEmpty) return null;
    try {
      final parts = dateStr.split('/');
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
    } catch (e) {
      debugPrint('Error parsing date: $dateStr, error: $e');
    }
    return null;
  }

  void _calculateAge() {
    if (_incorporationDateController.text.trim().isNotEmpty) {
      final incorporationDate = _parseDateTime(
        _incorporationDateController.text,
      );
      if (incorporationDate != null) {
        final now = DateTime.now();
        final age = now.difference(incorporationDate);
        final ageInYears = (age.inDays / 365.25).toStringAsFixed(1);
        _ageController.text = ageInYears;
      }
    } else {
      _ageController.text = '';
    }
  }

  Enum$ProducerOrgTypeEnum? _mapLegalStructure(String? legalStructure) {
    if (legalStructure == null) return null;
    switch (legalStructure) {
      case 'Co-operative':
        return Enum$ProducerOrgTypeEnum.CO_OPERATIVE_SOCIETY;
      case 'Producer Company':
        return Enum$ProducerOrgTypeEnum.PRODUCER_COMPANY;
      case 'Non Profit Company':
        return Enum$ProducerOrgTypeEnum.NON_PROFIT_SOCIETY;
      case 'Trust':
        return Enum$ProducerOrgTypeEnum.TRUST;
      case 'Section -8 Company':
        return Enum$ProducerOrgTypeEnum.SECTION_8_COMPANY;
      default:
        return null;
    }
  }

  Enum$FPOTypeEnum? _mapFpoType(String? fpoType) {
    if (fpoType == null) return null;
    switch (fpoType) {
      case 'Dealing in inputs or output':
        return Enum$FPOTypeEnum.INPUTS_OR_OUTPUT;
      case 'Dealing in input and output':
        return Enum$FPOTypeEnum.INPUTS_AND_OUTPUT;
      case 'Dealing in inputs,output and processing with less than 50% capacity utilization':
        return Enum$FPOTypeEnum.LOW_CAPACITY;
      case 'Dealing in inputs,output and processing with more than 50% capacity utilization':
        return Enum$FPOTypeEnum.HIGH_CAPACITY;
      default:
        return null;
    }
  }

  Enum$PromotingAgencyTypeEnum? _mapPromotingAgencyType(String? agencyType) {
    if (agencyType == null) return null;
    switch (agencyType) {
      case 'Government Organization':
        return Enum$PromotingAgencyTypeEnum.STATE_GOVT;
      case 'NGO':
        return Enum$PromotingAgencyTypeEnum.NGO;
      case 'Trusts':
        return Enum$PromotingAgencyTypeEnum.TRUSTS;
      case 'Cooperative':
        return Enum$PromotingAgencyTypeEnum.COOPERATIVES;
      case 'Wings/Development Foundation of Corporates':
        return Enum$PromotingAgencyTypeEnum.CORPORATE_WINGS;
      case 'State Govt. Departments':
        return Enum$PromotingAgencyTypeEnum.STATE_GOVT;
      case 'KVKs':
        return Enum$PromotingAgencyTypeEnum.KVKS;
      case 'Farmer Federations':
        return Enum$PromotingAgencyTypeEnum.FARMER_FEDERATIONS;
      case 'Commodity Boards':
        return Enum$PromotingAgencyTypeEnum.COMMODITY_BOARDS;
      case 'Big Farmer Companies':
        return Enum$PromotingAgencyTypeEnum.BIG_FARMER_COMPANIES;
      case 'Others':
        return Enum$PromotingAgencyTypeEnum.OTHERS;
      default:
        return null;
    }
  }

  Future<void> _scrollToField(String fieldKey) async {
    final key = _fieldKeys[fieldKey];
    if (key?.currentContext != null) {
      await Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      );
    }
  }

  Future<bool> _submitForm() async {
    if (_isSubmitting) return false;

    // Detailed validation with navigation to first unfilled field
    String? firstMissingField;
    String fieldName = '';

    if (_fpoNameController.text.trim().isEmpty) {
      firstMissingField = 'fpoName';
      fieldName = 'Organization Name';
    } else if (_addressController.text.trim().isEmpty) {
      firstMissingField = 'address';
      fieldName = 'Registered Address';
    } else if (_districtController.text.trim().isEmpty) {
      firstMissingField = 'district';
      fieldName = 'District';
    } else if (_selectedState == null) {
      firstMissingField = 'state';
      fieldName = 'State';
    } else if (_selectedLegalStructure == null) {
      firstMissingField = 'legalStructure';
      fieldName = 'Legal Structure';
    } else if (_incorporationDateController.text.trim().isEmpty) {
      firstMissingField = 'incorporationDate';
      fieldName = 'Date of Incorporation';
    } else if (_commencementDateController.text.trim().isEmpty) {
      firstMissingField = 'commencementDate';
      fieldName = 'Date of Commencement';
    } else if (_selectedFpoType == null) {
      firstMissingField = 'fpoType';
      fieldName = 'Type of FPO';
    } else if (_targetSizeController.text.trim().isEmpty) {
      firstMissingField = 'targetSize';
      fieldName = 'Target for shareholders of the FPO';
    }

    if (firstMissingField != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in the required field: $fieldName'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      await _scrollToField(firstMissingField);
      return false;
    }

    // Date validation: Commencement date cannot be before incorporation date
    if (_incorporationDateController.text.trim().isNotEmpty &&
        _commencementDateController.text.trim().isNotEmpty) {
      final incorporationDate = _parseDateTime(
        _incorporationDateController.text,
      );
      final commencementDate = _parseDateTime(_commencementDateController.text);

      if (incorporationDate != null &&
          commencementDate != null &&
          commencementDate.isBefore(incorporationDate)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Date of commencement of operations cannot be before the date of incorporation',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        await _scrollToField('commencementDate');
        return false;
      }
    }

    // Farmers transacted validation: Cannot exceed FPO size
    if (_farmersTransactedController.text.trim().isNotEmpty &&
        _sizeFY2324Controller.text.trim().isNotEmpty) {
      final farmersTransacted = int.tryParse(_farmersTransactedController.text);
      final fpoSize = int.tryParse(_sizeFY2324Controller.text);

      if (farmersTransacted != null &&
          fpoSize != null &&
          farmersTransacted > fpoSize) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Number of shareholders who have transacted cannot be more than the size of the FPO ($fpoSize)',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        await _scrollToField('farmersTransacted');
        return false;
      }
    }

    // Women shareholders validation: Cannot exceed FPO size
    if (_womenMembersController.text.trim().isNotEmpty &&
        _sizeFY2324Controller.text.trim().isNotEmpty) {
      final womenMembers = int.tryParse(_womenMembersController.text);
      final fpoSize = int.tryParse(_sizeFY2324Controller.text);

      if (womenMembers != null && fpoSize != null && womenMembers > fpoSize) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Number of women shareholders cannot be more than the size of the FPO ($fpoSize)',
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        await _scrollToField('womenMembers');
        return false;
      }
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final basicDetailsInput = _extractFormData();
      debugPrint('FPO Profile: Submitting form data: $basicDetailsInput');

      final result = await FormDataService.instance.submitBasicDetails(
        financialYear: widget.formYear,
        basicDetailsInput: basicDetailsInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('FPO Profile: Submit result: $result');

      if (result?.success == true) {
        debugPrint('FPO Profile: Form submitted successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('FPO profile submitted successfully!'),
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
    } catch (e, stack) {
      debugPrint('Form submission error: $e');
      debugPrintStack(stackTrace: stack);
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
                                    'Profile Details Input',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '1/9',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.outline,
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
                            widthFactor: 0.111, // 1/9 = 11.1%
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
                      controller: _scrollController,
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile Details Input Section
                          Text(
                            'PROFILE DETAILS INPUT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Name of the Producer Organization
                          _buildTextFieldWithLabel(
                            label: 'Name of the Producer Organization',
                            controller: _fpoNameController,
                            hintText: 'Enter organization name',
                            isRequired: true,
                            fieldKey: 'fpoName',
                          ),

                          const SizedBox(height: 16),

                          // Registered Address of the FPO
                          _buildTextFieldWithLabel(
                            label: 'Registered Address of the FPO',
                            controller: _addressController,
                            hintText: 'Enter registered address',
                            maxLines: 3,
                            isRequired: true,
                            fieldKey: 'address',
                          ),

                          const SizedBox(height: 16),

                          // District
                          _buildTextFieldWithLabel(
                            label: 'District',
                            controller: _districtController,
                            hintText: 'Enter district',
                            isRequired: true,
                            fieldKey: 'district',
                          ),

                          const SizedBox(height: 16),

                          // State Dropdown
                          _buildDropdownWithLabel(
                            label: 'State',
                            value: _selectedState,
                            items: _states,
                            hintText: 'Select State',
                            isRequired: true,
                            fieldKey: 'state',
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedState = newValue;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Type of the producer organization (Legal structure)
                          _buildDropdownWithLabel(
                            label:
                                'Type of the producer organization (Legal structure)',
                            value: _selectedLegalStructure,
                            items: _legalStructures,
                            hintText: 'Select Legal Structure',
                            isRequired: true,
                            fieldKey: 'legalStructure',
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedLegalStructure = newValue;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Date of incorporation
                          _buildDateFieldWithLabel(
                            label: 'Date of incorporation (DD/MM/YYYY)',
                            controller: _incorporationDateController,
                            hintText: 'DD/MM/YYYY',
                            isRequired: true,
                            fieldKey: 'incorporationDate',
                          ),

                          const SizedBox(height: 16),

                          // Date of commencement of operations
                          _buildDateFieldWithLabel(
                            label:
                                'Date of commencement of operations (first transaction) (DD/MM/YYYY)',
                            controller: _commencementDateController,
                            hintText: 'DD/MM/YYYY',
                            isRequired: true,
                            fieldKey: 'commencementDate',
                          ),

                          const SizedBox(height: 16),

                          // Age of the FPO
                          _buildAgeDisplayLabel(),

                          const SizedBox(height: 16),

                          // Type of FPO
                          _buildOptimizedDropdownWithLabel(
                            label: 'Type of FPO',
                            value: _selectedFpoType,
                            items: _fpoTypes,
                            hintText: 'Select FPO Type',
                            isRequired: true,
                            fieldKey: 'fpoType',
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedFpoType = newValue;
                              });
                            },
                          ),

                          const SizedBox(height: 24),

                          // Size of the FPO Section
                          Text(
                            'SIZE OF THE FPO (Shareholder )',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Third FY (most recent)
                          _buildTextFieldWithLabel(
                            label: _thirdFY,
                            controller: _sizeFY2324Controller,
                            hintText: 'e.g., 4759',
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 16),

                          // Second FY
                          _buildTextFieldWithLabel(
                            label: _secondFY,
                            controller: _sizeFY2223Controller,
                            hintText: 'e.g., 3195',
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 16),

                          // First FY (oldest)
                          _buildTextFieldWithLabel(
                            label: _firstFY,
                            controller: _sizeFY2122Controller,
                            hintText: 'e.g., 1497',
                            keyboardType: TextInputType.number,
                          ),

                          const SizedBox(height: 16),

                          // Number of shareholders who have transacted
                          _buildTextFieldWithLabel(
                            label:
                                'Number of shareholders who have transacted through the FPO atleast once in previous financial year',
                            controller: _farmersTransactedController,
                            hintText: 'Enter number of shareholders',
                            keyboardType: TextInputType.number,
                            fieldKey: 'farmersTransacted',
                          ),

                          const SizedBox(height: 16),

                          // Number of Women Shareholder
                          _buildTextFieldWithLabel(
                            label: 'Number of Women Shareholders',
                            controller: _womenMembersController,
                            hintText: 'Enter number of women shareholders',
                            keyboardType: TextInputType.number,
                            fieldKey: 'womenMembers',
                          ),

                          const SizedBox(height: 16),

                          // Target for the size of the FPO
                          _buildTextFieldWithLabel(
                            label: 'Target for shareholders of the FPO',
                            controller: _targetSizeController,
                            hintText: 'Enter target size',
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            fieldKey: 'targetSize',
                          ),

                          const SizedBox(height: 16),

                          // Whether FPO deals with farmers through Producer Groups/Farmer Interest Groups
                          _buildYesNoWithLabel(
                            label:
                                'Whether FPO deals with farmers through Producer Groups/Farmer Interest Groups?',
                            value: _dealsThroughPgsFigs,
                            onChanged: (bool? value) {
                              setState(() {
                                _dealsThroughPgsFigs = value;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Conditional field for PGs/FIGs count
                          if (_dealsThroughPgsFigs == true) ...[
                            _buildTextFieldWithLabel(
                              label:
                                  'How many PGs/FIGs does the FPO deal with?',
                              controller: _pgsFigsCountController,
                              hintText: 'Enter number of PGs/FIGs',
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 16),
                          ],

                          // Is the FPO being supported by a promoting agency?
                          _buildYesNoWithLabel(
                            label:
                                'Is the FPO being supported by a promoting agency?',
                            value: _hasSupportingAgency,
                            onChanged: (bool? value) {
                              setState(() {
                                _hasSupportingAgency = value;
                                if (value == false) {
                                  // Clear promoting agency fields if user selects No
                                  _selectedPromotingAgency = null;
                                  _selectedPromotingAgencyType = null;
                                  _otherPromotingAgencyController.clear();
                                  _otherPromotingAgencyNameController.clear();
                                }
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Conditional fields for promoting agency (only show if user selected Yes)
                          if (_hasSupportingAgency == true) ...[
                            // Name of the promoting agency
                            _buildPromotingAgencyDropdownWithLabel(
                              label: 'Name of the promoting agency',
                              value: _selectedPromotingAgency,
                              items: _promotingAgencies,
                              hintText: 'Select promoting agency',
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedPromotingAgency = newValue;
                                  if (newValue != 'Any Other') {
                                    // Clear other promoting agency name if not "Any Other"
                                    _otherPromotingAgencyNameController.clear();
                                  }
                                });
                              },
                            ),

                            const SizedBox(height: 16),

                            // Conditional field for other promoting agency name
                            if (_selectedPromotingAgency == 'Any Other') ...[
                              _buildTextFieldWithLabel(
                                label:
                                    'Please specify other promoting agency name',
                                controller: _otherPromotingAgencyNameController,
                                hintText: 'Enter other promoting agency name',
                              ),
                              const SizedBox(height: 16),
                            ],

                            // Type of the Promoting Agency
                            _buildDropdownWithLabel(
                              label: 'Type of the Promoting Agency',
                              value: _selectedPromotingAgencyType,
                              items: _promotingAgencyTypes,
                              hintText: 'Select agency type',
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedPromotingAgencyType = newValue;
                                });
                              },
                            ),

                            const SizedBox(height: 16),

                            // Conditional field for other promoting agency
                            if (_selectedPromotingAgencyType == 'Others') ...[
                              _buildTextFieldWithLabel(
                                label:
                                    'Please specify other promoting agency type',
                                controller: _otherPromotingAgencyController,
                                hintText: 'Enter other agency type',
                              ),
                              const SizedBox(height: 16),
                            ],
                          ],

                          // Has the FPO received any grants
                          _buildYesNoWithLabel(
                            label: 'Has the FPO received any grants?',
                            value: _receivedGrants,
                            onChanged: (bool? value) {
                              setState(() {
                                _receivedGrants = value;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // Conditional field for grant organization name
                          if (_receivedGrants == true) ...[
                            _buildTextFieldWithLabel(
                              label: 'Name of the grant-making organization',
                              controller: _grantOrganizationController,
                              hintText: 'Enter grant-making organization name',
                            ),
                            const SizedBox(height: 16),
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
                                : Icon(
                                    widget.currentStep == 9
                                        ? Icons.check
                                        : Icons.arrow_forward,
                                  ),
                            label: Text(
                              _isSubmitting
                                  ? 'Submitting...'
                                  : (widget.currentStep == 9
                                        ? 'Complete'
                                        : 'Next'),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    bool showVoiceInput = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        // Add gray background when field is read-only/disabled
        color: readOnly 
            ? Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
            : Theme.of(context).colorScheme.surface,
      ),
      child: showVoiceInput && !readOnly
          ? VoiceInputWidget(
              controller: controller,
              hintText: hintText,
              maxLines: maxLines,
              keyboardType: keyboardType,
              readOnly: readOnly,
              onTextChanged: (text) {
                // Update the controller text when voice input changes
                controller.text = text;
              },
            )
          : TextField(
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
                // Make the text color slightly muted when read-only
                fillColor: Colors.transparent,
              ),
              style: TextStyle(
                color: readOnly 
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : Theme.of(context).colorScheme.onSurface,
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
    bool isRequired = false,
    String? fieldKey,
    bool readOnly = false,
    bool showVoiceInput = true,
  }) {
    return Column(
      key: fieldKey != null ? _fieldKeys[fieldKey] : null,
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
        _buildTextField(
          controller: controller,
          hintText: hintText,
          maxLines: maxLines,
          keyboardType: keyboardType,
          readOnly: readOnly,
          showVoiceInput: showVoiceInput,
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
    String? fieldKey,
  }) {
    return Column(
      key: fieldKey != null ? _fieldKeys[fieldKey] : null,
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
                          color: Colors.grey.shade200,
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

  Widget _buildDateFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
    String? fieldKey,
  }) {
    return Column(
      key: fieldKey != null ? _fieldKeys[fieldKey] : null,
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
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ),
            onTap: () async {
              FocusScope.of(context).unfocus();

              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(
                        context,
                      ).colorScheme.copyWith(primary: const Color(0xFF2196F3)),
                    ),
                    child: child!,
                  );
                },
              );

              if (picked != null) {
                final formattedDate =
                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
                controller.text = formattedDate;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildYesNoWithLabel({
    required String label,
    required bool? value,
    required ValueChanged<bool?> onChanged,
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
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: value == true
                        ? const Color(0xFF2196F3)
                        : Colors.grey.shade300,
                  ),
                  color: value == true
                      ? const Color(0xFF2196F3).withOpacity(0.1)
                      : Colors.white,
                ),
                child: RadioListTile<bool>(
                  value: true,
                  groupValue: value,
                  onChanged: onChanged,
                  title: const Text('Yes'),
                  activeColor: const Color(0xFF2196F3),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: value == false
                        ? const Color(0xFF2196F3)
                        : Colors.grey.shade300,
                  ),
                  color: value == false
                      ? const Color(0xFF2196F3).withOpacity(0.1)
                      : Colors.white,
                ),
                child: RadioListTile<bool>(
                  value: false,
                  groupValue: value,
                  onChanged: onChanged,
                  title: const Text('No'),
                  activeColor: const Color(0xFF2196F3),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPromotingAgencyDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
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
                          color: Colors.grey.shade200,
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

  Widget _buildOptimizedDropdownWithLabel({
    required String label,
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
    bool isRequired = false,
    String? fieldKey,
  }) {
    // Determine if we have long text items that need smaller font
    bool hasLongText = items.any((item) => item.length > 50);
    double fontSize = hasLongText ? 11.0 : 14.0;
    double hintFontSize = hasLongText ? 13.0 : 15.0;
    int maxLines = hasLongText ? 3 : 2;
    int selectedMaxLines = hasLongText ? 2 : 1;

    return Column(
      key: fieldKey != null ? _fieldKeys[fieldKey] : null,
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
              value: value,
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

  Widget _buildAgeDisplayLabel() {
    return Column(
      key: _fieldKeys['age'],
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Age of the FPO (in Years)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            _ageController.text.isEmpty 
                ? 'Auto-calculated from incorporation date' 
                : '${_ageController.text} years',
            style: TextStyle(
              fontSize: 15,
              color: _ageController.text.isEmpty 
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: _ageController.text.isEmpty 
                  ? FontWeight.normal 
                  : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

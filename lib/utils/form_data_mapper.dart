import '../schema.graphql.dart';

class FormDataMapper {
  // Map form data to GraphQL input for Basic Details (Step 1)
  static Map<String, dynamic> mapBasicDetailsToInput({
    required String? fpoName,
    required String? address,
    required String? district,
    required String? state,
    required String? legalStructure,
    required String? incorporationDate,
    required String? commencementDate,
    required String? age,
    required String? fpoType,
    required String? sizeFY2324,
    required String? sizeFY2223,
    required String? sizeFY2122,
    required String? farmersTransacted,
    required String? womenMembers,
    required String? targetSize,
    required bool? dealsThroughPgsFigs,
    required String? pgsFigsCount,
    required String? promotingAgency,
    required String? promotingAgencyType,
    required String? otherPromotingAgency,
    required bool? receivedGrants,
    required String? grantOrganization,
  }) {
    return {
      'nameOfProducerOrganization': fpoName,
      'registeredAddress': address,
      'district': district,
      'state': state,
      'typeOfProducerOrganization':
          _mapLegalStructureToEnum(legalStructure) != null
          ? toJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
              _mapLegalStructureToEnum(legalStructure)!,
            )
          : null,
      'dateOfIncorporation': _parseDate(incorporationDate),
      'dateOfCommencement': _parseDate(commencementDate),
      'ageOfFpoYears': _parseDouble(age),
      'typeOfFpo': _mapFpoTypeToEnum(fpoType) != null
          ? toJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(
              _mapFpoTypeToEnum(fpoType)!,
            )
          : null,
      'sizeOfFpoFy2324': _parseInt(sizeFY2324),
      'sizeOfFpoFy2223': _parseInt(sizeFY2223),
      'sizeOfFpoFy2122': _parseInt(sizeFY2122),
      'farmersTransacted': _parseInt(farmersTransacted),
      'womenMembers': _parseInt(womenMembers),
      'targetSizeOfFpo': _parseInt(targetSize),
      'dealsThroughPgsFigs': dealsThroughPgsFigs,
      'numPgsFigs': _parseInt(pgsFigsCount),
      'promotingAgencyName': promotingAgency,
      'typeOfPromotingAgency':
          _mapPromotingAgencyTypeToEnum(promotingAgencyType) != null
          ? toJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(
              _mapPromotingAgencyTypeToEnum(promotingAgencyType)!,
            )
          : null,
      'otherPromotingAgencyType': otherPromotingAgency,
      'receivedGrants': receivedGrants,
      'grantMakingOrganization': grantOrganization,
      'supportedByPromotingAgency': promotingAgency != null,
    };
  }

  // Map form data to GraphQL input for Governance Details (Step 2)
  static Map<String, dynamic> mapGovernanceToInput({
    required String? agmFrequency,
    required String? bodMeetings,
    required String? numberOfBods,
    required String? numberOfWomenBods,
    required String? minutesQuality,
  }) {
    return {
      'annualGeneralBodyMeetings': _parseInt(agmFrequency),
      'bodMeetingsLastFinancialYear': _parseInt(bodMeetings),
      'numBods': _parseInt(numberOfBods),
      'numWomenBods': _parseInt(numberOfWomenBods),
      'minutesMaintenance': _mapMinutesMaintenanceToEnum(minutesQuality) != null
          ? toJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
              _mapMinutesMaintenanceToEnum(minutesQuality)!,
            )
          : null,
    };
  }

  // Map form data to GraphQL input for CEO Profile (Step 3)
  static Map<String, dynamic> mapCEOProfileToInput({
    required String? name,
    required String? qualification,
    required String? totalExperience,
    required String? typeOfExperience,
  }) {
    return {
      'name': name,
      'qualification': qualification,
      'totalYearsOfExperience': _parseInt(totalExperience),
      'typeOfExperience': _mapCEOExperienceTypeToEnum(typeOfExperience) != null
          ? toJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
              _mapCEOExperienceTypeToEnum(typeOfExperience)!,
            )
          : null,
    };
  }

  // Map form data to GraphQL input for Board Directors (Step 4)
  static List<Map<String, dynamic>> mapBoardDirectorsToInput(
    List<Map<String, dynamic>> boardDirectors,
  ) {
    return boardDirectors
        .map(
          (director) => {
            'name': director['name'],
            'educationalQualification': director['educationalQualification'],
            'totalYearsOfExperience': _parseInt(
              director['totalYearsOfExperience'],
            ),
            'typeOfExperience':
                _mapBoardExperienceTypeToEnum(director['typeOfExperience']) !=
                    null
                ? toJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(
                    _mapBoardExperienceTypeToEnum(
                      director['typeOfExperience'],
                    )!,
                  )
                : null,
          },
        )
        .toList();
  }

  // Map form data to GraphQL input for Business Operations (Step 5)
  static Map<String, dynamic> mapBusinessOperationsToInput({
    required String? priceVolatility,
  }) {
    return {
      'priceVolatilityOfProducts':
          _mapPriceVolatilityToEnum(priceVolatility) != null
          ? toJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
              _mapPriceVolatilityToEnum(priceVolatility)!,
            )
          : null,
    };
  }

  // Map form data to GraphQL input for Facilities to Farmers (part of Business Operations Step 5)
  static Map<String, dynamic> mapFacilitiesToFarmersToInput({
    required String? accessibilityPercentage,
    required String? timeliness,
    required String? priceAffordability,
    required String? place,
    required bool electronicWeighingMachines,
    required bool transportationFacility,
    required bool storage,
    required bool cleaning,
    required bool gradingAndSorting,
    required bool chilling,
    required bool packaging,
    required bool labelling,
    required bool processing,
    required bool qualityCheck,
    required bool soilTestingFacility,
    required bool customHiringCenters,
    required bool contractFarming,
    required bool advisoryServices,
    required bool creditFacilities,
  }) {
    return {
      'availabilityOfInputsAccessibilityPercent': _parseDouble(
        accessibilityPercentage,
      ),
      'availabilityOfInputsTimeliness': _mapTimelinessToEnum(timeliness) != null
          ? toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
              _mapTimelinessToEnum(timeliness)!,
            )
          : null,
      'availabilityOfInputsPriceAffordability':
          _mapPriceAffordabilityToEnum(priceAffordability) != null
          ? toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
              _mapPriceAffordabilityToEnum(priceAffordability)!,
            )
          : null,
      'availabilityOfInputsPlace': _mapPlaceToEnum(place) != null
          ? toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
              _mapPlaceToEnum(place)!,
            )
          : null,
      'electronicWeighingMachines': electronicWeighingMachines,
      'transportationFacility': transportationFacility,
      'storage': storage,
      'cleaning': cleaning,
      'gradingAndSorting': gradingAndSorting,
      'chilling': chilling,
      'packaging': packaging,
      'labelling': labelling,
      'processing': processing,
      'qualityCheck': qualityCheck,
      'soilTestingFacility': soilTestingFacility,
      'customHiringCenters': customHiringCenters,
      'contractFarming': contractFarming,
      'advisoryServices': advisoryServices,
      'creditFacilities': creditFacilities,
    };
  }

  // Map form data to GraphQL input for Compliance Details (Step 6)
  static Map<String, dynamic> mapComplianceDetailsToInput({
    required String? actUnderRegistered,
    required String? dateOfRegistration,
    required String? permanentAccountNumber,
    required String? placeOfRegistration,
    required String? registrationNo,
    required String? taxDeductionAccountNumber,
  }) {
    return {
      'actUnderRegistered':
          _mapActUnderRegisteredToEnum(actUnderRegistered) != null
          ? toJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
              _mapActUnderRegisteredToEnum(actUnderRegistered)!,
            )
          : null,
      'dateOfRegistration': _parseDate(dateOfRegistration),
      'permanentAccountNumber': permanentAccountNumber,
      'placeOfRegistration': placeOfRegistration,
      'registrationNo': registrationNo,
      'taxDeductionAccountNumber': taxDeductionAccountNumber,
    };
  }

  // Map form data to GraphQL input for Processes Systems (Step 7)
  static Map<String, dynamic> mapProcessesSystemsToInput({
    required String? accountsAndMis,
    required String? booksAndRecords,
    required String? creditRecord,
    required String? insuranceOfStock,
    required bool? penaltiesLevied,
    required String? reconciliationOfStocks,
    required String? statutoryFillings,
  }) {
    return {
      'accountsAndMis': _mapAccountsMISToEnum(accountsAndMis) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(
              _mapAccountsMISToEnum(accountsAndMis)!,
            )
          : null,
      'booksAndRecordsUpToDate': _mapBooksRecordsToEnum(booksAndRecords) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
              _mapBooksRecordsToEnum(booksAndRecords)!,
            )
          : null,
      'creditRecordOfFpo': _mapCreditRecordToEnum(creditRecord) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
              _mapCreditRecordToEnum(creditRecord)!,
            )
          : null,
      'insuranceOfStock': _mapInsuranceStockToEnum(insuranceOfStock) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(
              _mapInsuranceStockToEnum(insuranceOfStock)!,
            )
          : null,
      'penaltiesLeviedBoardMeeting': penaltiesLevied,
      'reconciliationOfStocks':
          _mapReconciliationStocksToEnum(reconciliationOfStocks) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
              _mapReconciliationStocksToEnum(reconciliationOfStocks)!,
            )
          : null,
      'statutoryFillings':
          _mapStatutoryFillingsToEnum(statutoryFillings) != null
          ? toJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
              _mapStatutoryFillingsToEnum(statutoryFillings)!,
            )
          : null,
    };
  }

  // Map form data to GraphQL input for Financial Details (Step 8)
  static Map<String, dynamic> mapFinancialDetailsToInput({
    // Revenue data
    required String? revenue2122,
    required String? revenue2223,
    required String? revenue2324,
    required String? revenueProduct2122,
    required String? revenueProduct2223,
    required String? revenueProduct2324,
    // Quantity procured data
    required String? quantity2122,
    required String? quantity2223,
    required String? quantity2324,
    required String? quantityProduct2122,
    required String? quantityProduct2223,
    required String? quantityProduct2324,
    // Retail buying data
    required String? retail2122,
    required String? retail2223,
    required String? retail2324,
    // Wholesale buying data
    required String? wholesale2122,
    required String? wholesale2223,
    required String? wholesale2324,
    // Institutional buying data
    required String? institutional2122,
    required String? institutional2223,
    required String? institutional2324,
    // Cost of goods sold data
    required String? cogs2122,
    required String? cogs2223,
    required String? cogs2324,
    // Profit data
    required String? grossProfit2122,
    required String? grossProfit2223,
    required String? grossProfit2324,
    required String? netProfit2122,
    required String? netProfit2223,
    required String? netProfit2324,
    // Operating margins
    required String? operatingMargin,
    required String? profitMarginDifference,
    // Share capital data
    required String? shareCapital2122,
    required String? shareCapital2223,
    required String? shareCapital2324,
    required String? shareholders2122,
    required String? shareholders2223,
    required String? shareholders2324,
  }) {
    return {
      // Revenue fields
      'revenue2122': _parseDouble(revenue2122),
      'revenue2223': _parseDouble(revenue2223),
      'revenue2324': _parseDouble(revenue2324),
      'revenueProduct2122': revenueProduct2122,
      'revenueProduct2223': revenueProduct2223,
      'revenueProduct2324': revenueProduct2324,
      // Quantity procured fields
      'quantity2122': _parseDouble(quantity2122),
      'quantity2223': _parseDouble(quantity2223),
      'quantity2324': _parseDouble(quantity2324),
      'quantityProduct2122': quantityProduct2122,
      'quantityProduct2223': quantityProduct2223,
      'quantityProduct2324': quantityProduct2324,
      // Retail buying fields
      'retail2122': _parseDouble(retail2122),
      'retail2223': _parseDouble(retail2223),
      'retail2324': _parseDouble(retail2324),
      // Wholesale buying fields
      'wholesale2122': _parseDouble(wholesale2122),
      'wholesale2223': _parseDouble(wholesale2223),
      'wholesale2324': _parseDouble(wholesale2324),
      // Institutional buying fields
      'institutional2122': _parseDouble(institutional2122),
      'institutional2223': _parseDouble(institutional2223),
      'institutional2324': _parseDouble(institutional2324),
      // Cost of goods sold fields
      'cogs2122': _parseDouble(cogs2122),
      'cogs2223': _parseDouble(cogs2223),
      'cogs2324': _parseDouble(cogs2324),
      // Profit fields
      'grossProfit2122': _parseDouble(grossProfit2122),
      'grossProfit2223': _parseDouble(grossProfit2223),
      'grossProfit2324': _parseDouble(grossProfit2324),
      'netProfit2122': _parseDouble(netProfit2122),
      'netProfit2223': _parseDouble(netProfit2223),
      'netProfit2324': _parseDouble(netProfit2324),
      // Operating margin fields
      'operatingMargin': _parseDouble(operatingMargin),
      'profitMarginDifference': _parseDouble(profitMarginDifference),
      // Share capital fields
      'shareCapital2122': _parseDouble(shareCapital2122),
      'shareCapital2223': _parseDouble(shareCapital2223),
      'shareCapital2324': _parseDouble(shareCapital2324),
      'shareholders2122': _parseInt(shareholders2122),
      'shareholders2223': _parseInt(shareholders2223),
      'shareholders2324': _parseInt(shareholders2324),
    };
  }

  // Map form data to GraphQL input for Sustainable Activities (Step 9)
  static Map<String, dynamic> mapSustainableActivitiesToInput({
    required bool? climateResilientSeeds,
    required bool? compostingUnits,
    required bool? dripSprinklerIrrigation,
    required bool? rainwaterHarvesting,
    required bool? organicBioManure,
    required bool? pestDiseaseAlerts,
    required bool? solarPanels,
    required bool? agriculturalResidue,
    required bool? organicFarmingTraining,
    required bool? weatherAdvisories,
  }) {
    return {
      'climateResilientSeedsToFarmers': climateResilientSeeds ?? false,
      'compostingUnitsAtFpoLevel': compostingUnits ?? false,
      'dripSprinklerIrrigationToFarmers': dripSprinklerIrrigation ?? false,
      'establishmentOfRainwaterHarvestingAtFpoLevel':
          rainwaterHarvesting ?? false,
      'organicBioManureFertilizersToFarmers': organicBioManure ?? false,
      'pestDiseaseAlertsToFarmers': pestDiseaseAlerts ?? false,
      'solarPanelsAtFpoLevel': solarPanels ?? false,
      'supplyingAgriculturalResidueToBioCngGasPlants':
          agriculturalResidue ?? false,
      'trainingOnOrganicFarmingToFarmers': organicFarmingTraining ?? false,
      'weatherAdvisoriesToFarmers': weatherAdvisories ?? false,
    };
  }

  // Helper methods for parsing and mapping
  static int? _parseInt(String? value) {
    if (value == null || value.isEmpty) return null;
    return int.tryParse(value);
  }

  static double? _parseDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    return double.tryParse(value);
  }

  static String? _parseDate(String? value) {
    if (value == null || value.isEmpty) return null;
    // Convert DD/MM/YYYY to YYYY-MM-DD
    final parts = value.split('/');
    if (parts.length == 3) {
      return '${parts[2]}-${parts[1]}-${parts[0]}';
    }
    return value;
  }

  static Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices?
  _mapLegalStructureToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Co-operative':
        return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
            .CO_OPERATIVE_SOCIETY;
      case 'Producer Company':
        return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
            .PRODUCER_COMPANY;
      case 'Non Profit Company':
        return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
            .NON_PROFIT_SOCIETY;
      case 'Trust':
        return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
            .TRUST;
      case 'Section -8 Company':
        return Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
            .SECTION_8_COMPANY;
      default:
        return null;
    }
  }

  static Enum$FpoFPODetailsSubmissionTypeOfFpoChoices? _mapFpoTypeToEnum(
    String? value,
  ) {
    if (value == null) return null;

    switch (value) {
      case 'Dealing in inputs or output':
        return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_OR_OUTPUT;
      case 'Dealing in input and output':
        return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.INPUTS_AND_OUTPUT;
      case 'Dealing in inputs,output and processing with less than 50% capacity utilization':
        return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.LOW_CAPACITY;
      case 'Dealing in inputs,output and processing with more than 50% capacity utilization':
        return Enum$FpoFPODetailsSubmissionTypeOfFpoChoices.HIGH_CAPACITY;
      default:
        return null;
    }
  }

  static Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices?
  _mapPromotingAgencyTypeToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Government Organization':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .STATE_GOVT;
      case 'NGO':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.NGO;
      case 'Trusts':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.TRUSTS;
      case 'Cooperative':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .COOPERATIVES;
      case 'Wings/Development Foundation of Corporates':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .CORPORATE_WINGS;
      case 'State Govt. Departments':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .STATE_GOVT;
      case 'KVKs':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.KVKS;
      case 'Farmer Federations':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .FARMER_FEDERATIONS;
      case 'Commodity Boards':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices
            .COMMODITY_BOARDS;
      case 'Others':
        return Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices.OTHERS;
      default:
        return null;
    }
  }

  static Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices?
  _mapMinutesMaintenanceToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Minutes of the meeting are detailed with the decisions taken being recorded with proper compliance':
        return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .DETAILED_COMPLIANT;
      case 'Minutes of the meeting are detailed with decision taken being recorded but not recorded on MCA':
        return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .DETAILED_NOT_UPDATED;
      case 'Minutes of the meeting are sketchy in quality':
        return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .SKETCHY_QUALITY;
      case 'Minutes of the meeting are not maintained':
        return Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
            .NOT_MAINTAINED;
      default:
        return null;
    }
  }

  static Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices?
  _mapCEOExperienceTypeToEnum(String? value) {
    final mapping = {
      'Agricultural Cooperatives / Farmer Producer Organizations':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
              .AGRICULTURAL_COOPERATIVES,
      'Any other':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.ANY_OTHER,
      'Knowledge of key business functions (Marketing, Finance, Business Development, etc.)':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
              .BUSINESS_FUNCTIONS,
      'Farmer-owned enterprises':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
              .FARMER_OWNED_ENTERPRISES,
      'Farm management':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.FARM_MANAGEMENT,
      'Government departments related to agriculture, fisheries, or animal husbandry':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices
              .GOVERNMENT_AGRICULTURE,
      'Non-governmental organization / Non-profit organization focused on agriculture, fisheries, or animal husbandry':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.NGO_AGRICULTURE,
      'Self-help groups':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.SELF_HELP_GROUPS,
      'Village councils':
          Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices.VILLAGE_COUNCILS,
    };
    return mapping[value];
  }

  static Enum$FpoBoardDirectorProfileTypeOfExperienceChoices?
  _mapBoardExperienceTypeToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Agricultural Cooperatives/Farmer producer organizations':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .AGRICULTURAL_COOPERATIVES;
      case 'Any other':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices.ANY_OTHER;
      case 'Farmer-owned enterprises':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .FARMER_OWNED_ENTERPRISES;
      case 'Farm Management':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .FARM_MANAGEMENT;
      case 'Governmental departments of agricultural sector / fisheries / animal husbandry':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .GOVERNMENT_AGRICULTURE;
      case 'Non-governmental organization / Non-profit organization focused on agricultural sector / fisheries / animal husbandry':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .NGO_AGRICULTURE;
      case 'Self-help groups':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .SELF_HELP_GROUPS;
      case 'Village councils':
        return Enum$FpoBoardDirectorProfileTypeOfExperienceChoices
            .VILLAGE_COUNCILS;
      default:
        return null;
    }
  }

  static Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices?
  _mapPriceVolatilityToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'FPO dealing in highly price sensitive/volatile commodities (oil seed, gram etc) and price risk borne by the FPO':
        return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            .HIGHLY_VOLATILE_FPO_RISK;
      case 'Commodities with MSP, but price risk on FPO':
        return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            .MSP_FPO_RISK;
      case 'Not applicable - FPO only in lending/supplying inputs':
        return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            .NOT_APPLICABLE;
      case 'Part of the commodities hedged against price risk/or non volatile commodities':
        return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            .PARTIAL_HEDGE;
      case 'Price risk covered through well defined hedging through NCDEX or other mediums':
        return Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
            .WELL_HEDGED;
      default:
        return null;
    }
  }

  static Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?
  _mapTimelinessToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case '30 days prior to the sowing season':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            .A_30_DAYS_PRIOR;
      case '20 days prior to the sowing season':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            .A_20_DAYS_PRIOR;
      case '15 days prior to the sowing season':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            .A_15_DAYS_PRIOR;
      case '7 days prior to the sowing season':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            .A_7_DAYS_PRIOR;
      case 'Not applicable':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
            .NOT_APPLICABLE;
      default:
        return null;
    }
  }

  static Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices?
  _mapPriceAffordabilityToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Available to member farmers at 10% - 15% less than market price':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
            .A_10_15_PERCENT_LESS;
      case 'Available to member farmers at 5% - 10% less than market price':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
            .A_5_10_PERCENT_LESS;
      case 'Available to member farmers at 3% - 5% less than market price':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
            .A_3_5_PERCENT_LESS;
      case 'Available to member farmers at 1% - 3% less than market price':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
            .A_1_3_PERCENT_LESS;
      case 'Not applicable':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices
            .NOT_APPLICABLE;
      default:
        return null;
    }
  }

  static Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?
  _mapPlaceToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Available within 3 KM of distance for majority of farmers':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            .A_3_KM_AVAILABLE;
      case 'Available within 6 KM of distance for majority of farmers':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            .A_6_KM_AVAILABLE;
      case 'Available within 10 KM of distance for majority of farmers':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            .A_10_KM_AVAILABLE;
      case 'Not available within 10 KM of distance for majority of farmers':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            .NOT_WITHIN_10_KM;
      case 'Not applicable':
        return Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
            .NOT_APPLICABLE;
      default:
        return null;
    }
  }

  static Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices?
  _mapAccountsMISToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'No MIS is present ,Accounting is done manually':
        return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.NO_MIS;
      case 'Accounting managed by using basic MS Office tools but not software packages':
        return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
            .MS_OFFICE_TOOLS;
      case 'Accounting managed by tally, but no digitalization of the other operational records':
        return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
            .TALLY_NO_DIGITAL;
      case 'Software for managing accounts & digitalization of MIS':
        return Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
            .SOFTWARE_DIGITAL;
      default:
        return null;
    }
  }

  // Reverse mapping for Accounts and MIS enum
  static String? mapAccountsMISFromEnum(
    Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.NO_MIS:
          'No MIS is present ,Accounting is done manually',
      Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.MS_OFFICE_TOOLS:
          'Accounting managed by using basic MS Office tools but not software packages',
      Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.TALLY_NO_DIGITAL:
          'Accounting managed by tally, but no digitalization of the other operational records',
      Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.SOFTWARE_DIGITAL:
          'Software for managing accounts & digitalization of MIS',
    };
    return reverseMapping[value];
  }

  // Reverse mapping for Credit Record enum
  static String? mapCreditRecordFromEnum(
    Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
              .NO_CREDIT_HISTORY:
          'No Credit History',
      Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
              .MULTIPLE_DELAYS:
          'More than one Record of delays/defaults in the last 3 financial years',
      Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.ONE_DELAY:
          'One record of delays/defaults in last 3 financial years',
      Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices.NO_DELAYS:
          'No records of delays or default',
    };
    return reverseMapping[value];
  }

  // Reverse mapping for Books and Records enum
  static String? mapBooksRecordsFromEnum(
    Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.CURRENT:
          'Current',
      Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
              .LAG_2_3_DAYS:
          'Updated with a lag of 2-3 days',
      Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
              .WEEKLY_UPDATED:
          'Updated on weekly basis',
      Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
              .PROCESSES_SYSTEMS:
          'Updated on monthly or more basis',
    };
    return reverseMapping[value];
  }

  // Reverse mapping for Insurance Stock enum
  static String? mapInsuranceStockFromEnum(
    Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.NO_INSURANCE:
          'No insurance cover',
      Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
              .LESS_THAN_50_FIRE:
          'Less than 50% of the stock is insured against fire',
      Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices.A_50_FIRE_THEFT:
          '50% of the stock is insured against fire & theft',
      Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
              .A_100_FIRE_THEFT:
          '100% stock is insured against fire & theft',
    };
    return reverseMapping[value];
  }

  // Reverse mapping for Statutory Fillings enum
  static String? mapStatutoryFillingsFromEnum(
    Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
              .DELAYS_NOT_FILLED:
          'Any delays in the past 12 months that are not yet filled',
      Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
              .MULTIPLE_DELAYS_FILLED:
          'Multiple delays (>5) over the past 12 months but filled as on date',
      Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
              .FEW_DELAYS_FILLED:
          'Few delays (<3) over the past 12 months but filled as on date',
      Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices.NO_DELAYS:
          'No delays',
    };
    return reverseMapping[value];
  }

  // Reverse mapping for Reconciliation Stocks enum
  static String? mapReconciliationStocksFromEnum(
    Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .ABSENT_ANNUAL:
          'Absent or Annual',
      Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .A_2_4_TIMES_YEAR:
          '2-4 times in a year',
      Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices.MONTHLY:
          'Monthly',
      Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .EVERY_15_DAYS:
          'At least every 15 days',
    };
    return reverseMapping[value];
  }

  static Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices?
  _mapInsuranceStockToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'No insurance cover':
        return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
            .NO_INSURANCE;
      case 'Less than 50% of the stock is insured against fire':
        return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
            .LESS_THAN_50_FIRE;
      case '50% of the stock is insured against fire & theft':
        return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
            .A_50_FIRE_THEFT;
      case '100% stock is insured against fire & theft':
        return Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
            .A_100_FIRE_THEFT;
      default:
        return null;
    }
  }

  static Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices?
  _mapCreditRecordToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'No Credit History':
        return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
            .NO_CREDIT_HISTORY;
      case 'More than one Record of delays/defaults in the last 3 financial years':
        return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
            .MULTIPLE_DELAYS;
      case 'One record of delays/defaults in last 3 financial years':
        return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
            .ONE_DELAY;
      case 'No records of delays or default':
        return Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
            .NO_DELAYS;
      default:
        return null;
    }
  }

  static Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices?
  _mapStatutoryFillingsToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Any delays in the past 12 months that are not yet filled':
        return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
            .DELAYS_NOT_FILLED;
      case 'Multiple delays (>5) over the past 12 months but filled as on date':
        return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
            .MULTIPLE_DELAYS_FILLED;
      case 'Few delays (<3) over the past 12 months but filled as on date':
        return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
            .FEW_DELAYS_FILLED;
      case 'No delays':
        return Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
            .NO_DELAYS;
      default:
        return null;
    }
  }

  static Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices?
  _mapBooksRecordsToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Updated on monthly or more basis':
        return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
            .PROCESSES_SYSTEMS;
      case 'Updated on weekly basis':
        return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
            .WEEKLY_UPDATED;
      case 'Updated with a lag of 2-3 days':
        return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
            .LAG_2_3_DAYS;
      case 'Current':
        return Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
            .CURRENT;
      default:
        return null;
    }
  }

  static Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices?
  _mapReconciliationStocksToEnum(String? value) {
    final mapping = {
      'Absent or Annual':
          Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .ABSENT_ANNUAL,
      '2-4 times in a year':
          Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .A_2_4_TIMES_YEAR,
      'Monthly': Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .MONTHLY,
      'At least every 15 days':
          Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
              .EVERY_15_DAYS,
    };
    return mapping[value];
  }

  static Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
  _mapActUnderRegisteredToEnum(String? value) {
    if (value == null) return null;

    switch (value) {
      case 'Company Act':
        return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
            .COMPANY_ACT;
      case 'Co-operative Societies Act':
        return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
            .COOPERATIVE_SOCIETIES_ACT;
      case 'Other':
        return Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
            .OTHER;
      default:
        return null;
    }
  }

  static String? mapActUnderRegisteredFromEnum(
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices? value,
  ) {
    if (value == null) return null;
    final reverseMapping = {
      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.COMPANY_ACT:
          'Company Act',
      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
              .COOPERATIVE_SOCIETIES_ACT:
          'Co-operative Societies Act',
      Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices.OTHER:
          'Other',
    };
    return reverseMapping[value];
  }
}

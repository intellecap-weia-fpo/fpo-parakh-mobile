import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/mutations/form_mutations.graphql.dart';
import '../graphql/queries/form_queries.graphql.dart';
import '../schema.graphql.dart';

class FormDataService {
  final GraphQLClient _client;

  FormDataService(this._client);

  static FormDataService? _instance;

  static FormDataService get instance {
    if (_instance == null) {
      throw Exception(
        'FormDataService not initialized. Call FormDataService.initialize() first.',
      );
    }
    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  static void initialize(GraphQLClient client) {
    _instance = FormDataService(client);
  }

  // Create FPO
  Future<Mutation$CreateFPO$createFpo?> createFPO({
    required String name,
    required String email,
    required String phone,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String district,
    required String state,
    required String pincode,
    String? alternatePhone,
    String? logo,
  }) async {
    final result = await _client.mutate$CreateFPO(
      Options$Mutation$CreateFPO(
        variables: Variables$Mutation$CreateFPO(
          name: name,
          email: email,
          phone: phone,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          city: city,
          district: district,
          state: state,
          pincode: pincode,
          alternatePhone: alternatePhone,
          logo: logo,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception('Failed to create FPO: ${result.exception}');
    }

    return result.parsedData?.createFpo;
  }

  // Get user's FPO
  Future<Query$GetMyFpo$myFpo?> getMyFpo() async {
    final result = await _client.query$GetMyFpo(
      Options$Query$GetMyFpo(fetchPolicy: FetchPolicy.networkOnly),
    );

    if (result.hasException) {
      throw Exception('Failed to get user FPO: ${result.exception}');
    }

    return result.parsedData?.myFpo;
  }

  // Basic Details (Step 1)
  Future<Mutation$SubmitBasicDetails$createFpoDetailsSubmission?>
  submitBasicDetails({
    required String financialYear,
    required Input$FPODetailsSubmissionInput basicDetailsInput,
    required String fpoId,
  }) async {
    print('=== GraphQL submitBasicDetails DEBUG ===');
    print(
      'Variables: financialYear=$financialYear, basicDetails=$basicDetailsInput, fpoId=$fpoId',
    );
    print('========================================');

    final result = await _client.mutate$SubmitBasicDetails(
      Options$Mutation$SubmitBasicDetails(
        variables: Variables$Mutation$SubmitBasicDetails(
          input: basicDetailsInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception('Failed to submit basic details: ${result.exception}');
    }

    return result.parsedData?.createFpoDetailsSubmission;
  }

  // Governance Details (Step 2)
  Future<Mutation$SubmitGovernance$createGovernanceSubmission?>
  submitGovernance({
    required String financialYear,
    required Input$GovernanceSubmissionInput governanceInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitGovernance(
      Options$Mutation$SubmitGovernance(
        variables: Variables$Mutation$SubmitGovernance(
          input: governanceInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        'Failed to submit governance details: ${result.exception}',
      );
    }

    return result.parsedData?.createGovernanceSubmission;
  }

  // CEO Profile (Step 3)
  Future<Mutation$SubmitCEOProfile$createCeoProfileSubmission?>
  submitCEOProfile({
    required String financialYear,
    required Input$CEOProfileSubmissionInput ceoProfileInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitCEOProfile(
      Options$Mutation$SubmitCEOProfile(
        variables: Variables$Mutation$SubmitCEOProfile(
          input: ceoProfileInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception('Failed to submit CEO profile: ${result.exception}');
    }

    return result.parsedData?.createCeoProfileSubmission;
  }

  // Board Directors (Step 4)
  Future<Mutation$SubmitBoardProfiles$createBoardDirectorProfiles?>
  submitBoardProfiles({
    required String financialYear,
    required List<Input$BoardDirectorProfileInput> boardProfilesInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitBoardProfiles(
      Options$Mutation$SubmitBoardProfiles(
        variables: Variables$Mutation$SubmitBoardProfiles(
          directors: boardProfilesInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception('Failed to submit board profiles: ${result.exception}');
    }

    return result.parsedData?.createBoardDirectorProfiles;
  }

  // Business Operations (Step 5)
  Future<Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission?>
  submitBusinessOperations({
    required String financialYear,
    required Input$BusinessOperationsSubmissionInput businessOperationsInput,
    required String fpoId,
  }) async {
    print(
      'Submitting business operations with data: $businessOperationsInput, fpoId=$fpoId',
    ); // Debug

    final result = await _client.mutate$SubmitBusinessOperations(
      Options$Mutation$SubmitBusinessOperations(
        variables: Variables$Mutation$SubmitBusinessOperations(
          input: businessOperationsInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    print('Business operations mutation result: ${result.parsedData}'); // Debug
    if (result.hasException) {
      print(
        'Business operations GraphQL exception: ${result.exception}',
      ); // Debug
      throw Exception(
        'Failed to submit business operations: ${result.exception}',
      );
    }

    return result.parsedData?.createBusinessOperationsSubmission;
  }

  // Compliances (Step 6)
  Future<Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission?>
  submitComplianceDetails({
    required String financialYear,
    required Input$ComplianceDetailsSubmissionInput complianceDetailsInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitComplianceDetails(
      Options$Mutation$SubmitComplianceDetails(
        variables: Variables$Mutation$SubmitComplianceDetails(
          input: complianceDetailsInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        'Failed to submit compliance details: ${result.exception}',
      );
    }

    return result.parsedData?.createComplianceDetailsSubmission;
  }

  // Processes Systems (Step 7)
  Future<Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission?>
  submitProcessesSystems({
    required String financialYear,
    required Input$ProcessesSystemsSubmissionInput processesSystemsInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitProcessesSystems(
      Options$Mutation$SubmitProcessesSystems(
        variables: Variables$Mutation$SubmitProcessesSystems(
          input: processesSystemsInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        'Failed to submit processes systems: ${result.exception}',
      );
    }

    return result.parsedData?.createProcessesSystemsSubmission;
  }

  // Financial Details (Step 8)
  Future<Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission?>
  submitFinancialDetails({
    required String financialYear,
    required Input$FinancialDetailsSubmissionV2Input financialDataInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitFinancialDetails(
      Options$Mutation$SubmitFinancialDetails(
        variables: Variables$Mutation$SubmitFinancialDetails(
          input: financialDataInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        'Failed to submit financial details: ${result.exception}',
      );
    }

    return result.parsedData?.createFinancialDetailsSubmission;
  }

  // Sustainable Activities (Step 9)
  Future<
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission?
  >
  submitSustainableActivities({
    required String financialYear,
    required Input$SustainableActivitiesSubmissionInput
    sustainableActivitiesInput,
    required String fpoId,
  }) async {
    final result = await _client.mutate$SubmitSustainableActivities(
      Options$Mutation$SubmitSustainableActivities(
        variables: Variables$Mutation$SubmitSustainableActivities(
          input: sustainableActivitiesInput,
          financialYear: financialYear,
          fpoId: fpoId,
        ),
      ),
    );

    if (result.hasException) {
      throw Exception(
        'Failed to submit sustainable activities: ${result.exception}',
      );
    }

    return result.parsedData?.createSustainableActivitiesSubmission;
  }

  // Get submission data for a specific financial year
  Future<Query$GetSubmission$getSubmission?> getSubmission({
    required String financialYear,
    required String fpoId,
  }) async {
    print('=== GraphQL getSubmission DEBUG ===');
    print('Variables: financialYear=$financialYear, fpoId=$fpoId');
    print('Client: $_client');
    print('===================================');

    final result = await _client.query$GetSubmission(
      Options$Query$GetSubmission(
        variables: Variables$Query$GetSubmission(
          financialYear: financialYear,
          fpoId: fpoId,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception('Failed to get submission: ${result.exception}');
    }

    return result.parsedData?.getSubmission;
  }

  // Get all FPOs associated with the user
  Future<Query$GetAllMyFpos?> getAllMyFpos() async {
    final result = await _client.query$GetAllMyFpos(
      Options$Query$GetAllMyFpos(fetchPolicy: FetchPolicy.networkOnly),
    );

    if (result.hasException) {
      throw Exception('Failed to get user FPOs: ${result.exception}');
    }

    return result.parsedData;
  }
}

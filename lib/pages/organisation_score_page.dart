import 'package:flutter/material.dart';
import 'package:fpo/schema.graphql.dart';
import 'dart:convert';
import '../services/auth_service.dart';
import '../services/form_data_service.dart';
import '../graphql/queries/form_queries.graphql.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../config.dart';

class OrganisationScorePage extends StatefulWidget {
  const OrganisationScorePage({super.key});

  @override
  State<OrganisationScorePage> createState() => _OrganisationScorePageState();
}

class _OrganisationScorePageState extends State<OrganisationScorePage> {
  double? _calculatedScore;
  bool _isLoadingScore = true;
  String _selectedFinancialYear = '2023-24';
  final List<String> _availableFinancialYears = [
    '2022-23',
    '2023-24',
    '2024-25',
  ];
  Query$GetSubmission$getSubmission? _submissionData;
  List<Map<String, dynamic>> _fpoCategories = [];
  bool _isGreenFPO = false;

  @override
  void initState() {
    super.initState();
    _fetchScoreData();
  }

  int? _extractNumericId(String globalId) {
    try {
      final decoded = utf8.decode(base64.decode(globalId));
      final parts = decoded.split(':');
      if (parts.length == 2) {
        return int.tryParse(parts[1]);
      }
    } catch (e) {
      print('Error extracting numeric ID from global ID: $e');
    }
    return null;
  }

  Future<void> _fetchScoreData() async {
    setState(() {
      _isLoadingScore = true;
    });

    try {
      final submission = await FormDataService.instance.getSubmission(
        financialYear: _selectedFinancialYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null) {
        _processSubmissionData(submission);
      }

      setState(() {
        _submissionData = submission;
        _calculatedScore = submission?.calculatedScore;
        _isLoadingScore = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingScore = false;
      });
    }
  }

  void _processSubmissionData(Query$GetSubmission$getSubmission submission) {
    // Calculate category scores
    _fpoCategories = _calculateCategoryScores(submission);

    // Check if FPO is Green FPO (has sustainable activities)
    _isGreenFPO = _checkIfGreenFPO(submission.sustainableActivities);
  }

  bool _checkIfGreenFPO(
    Query$GetSubmission$getSubmission$sustainableActivities?
    sustainableActivities,
  ) {
    if (sustainableActivities == null) return false;

    // Check if any sustainable activity is true
    return sustainableActivities.climateResilientSeedsToFarmers == true ||
        sustainableActivities.compostingUnitsAtFpoLevel == true ||
        sustainableActivities.dripSprinklerIrrigationToFarmers == true ||
        sustainableActivities.establishmentOfRainwaterHarvestingAtFpoLevel ==
            true ||
        sustainableActivities.organicBioManureFertilizersToFarmers == true ||
        sustainableActivities.pestDiseaseAlertsToFarmers == true ||
        sustainableActivities.solarPanelsAtFpoLevel == true ||
        sustainableActivities.supplyingAgriculturalResidueToBioCngGasPlants ==
            true ||
        sustainableActivities.trainingOnOrganicFarmingToFarmers == true ||
        sustainableActivities.weatherAdvisoriesToFarmers == true;
  }

  List<Map<String, dynamic>> _calculateCategoryScores(
    Query$GetSubmission$getSubmission submission,
  ) {
    // Use scores directly from GraphQL response instead of calculating locally
    final governanceScore = _parseScoreFromString(submission.governanceScore);
    final businessScore = _parseScoreFromString(submission.businessScore);
    final processScore = _parseScoreFromString(submission.processScore);
    final financialScore = _parseScoreFromString(submission.financialScore);

    return [
      {
        'title': 'Governance',
        'icon': Icons.business,
        'score': governanceScore,
        'status': _getScoreLabel(governanceScore.toDouble()),
      },
      {
        'title': 'Business & Operations',
        'icon': Icons.store,
        'score': businessScore,
        'status': _getScoreLabel(businessScore.toDouble()),
      },
      {
        'title': 'Process & Systems',
        'icon': Icons.settings,
        'score': processScore,
        'status': _getScoreLabel(processScore.toDouble()),
      },
      {
        'title': 'Financial Performance',
        'icon': Icons.attach_money,
        'score': financialScore,
        'status': _getScoreLabel(financialScore.toDouble()),
      },
    ];
  }

  int _parseScoreFromString(String? scoreString) {
    if (scoreString == null) return 0;
    final score = double.tryParse(scoreString);
    return score?.round() ?? 0;
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  String _formatScore(double score) {
    if (score % 1 == 0) {
      return score.toInt().toString();
    }
    return score.toStringAsFixed(1);
  }

  Color _getScoreColor(double score) {
    if (score > 70) return Colors.green;
    if (score >= 50) return Colors.blue;
    return Colors.orange;
  }

  String _getScoreLabel(double score) {
    if (score > 70) return 'Achievers';
    if (score >= 50) return 'Performer';
    return 'Aspirational';
  }

  // Helper methods for enum mapping
  String _mapSecondLineManagementFromEnum(
    Enum$FpoGovernanceSubmissionSecondLineManagementChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_ONE_MANAGER:
        return 'CEO accompanied by accounts team & one divisional manager';
      case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_ACCOUNTS_TWO_MANAGERS:
        return 'CEO accompanied by accounts team & at least 2 divisional managers';
      case Enum$FpoGovernanceSubmissionSecondLineManagementChoices
          .CEO_WITH_ACCOUNTS:
        return 'No second line, CEO accompanied by accounts team';
      case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.NO_CEO:
        return 'Currently no CEO';
      case Enum$FpoGovernanceSubmissionSecondLineManagementChoices.ONLY_CEO:
        return 'No second line, only CEO';
      default:
        return enumValue.name;
    }
  }

  String _mapMinutesMaintenanceFromEnum(
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_COMPLIANT:
        return 'Detailed with proper compliance';
      case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .DETAILED_NOT_UPDATED:
        return 'Detailed but not updated on MCA';
      case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
          .SKETCHY_QUALITY:
        return 'Sketchy quality';
      case Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices.NOT_MAINTAINED:
        return 'Not maintained';
      default:
        return enumValue.name;
    }
  }

  String _mapAvailabilityTimelinessFromEnum(
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?
    enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_30_DAYS_PRIOR:
        return '30 days prior to sowing season';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_20_DAYS_PRIOR:
        return '20 days prior to sowing season';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_15_DAYS_PRIOR:
        return '15 days prior to sowing season';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .A_7_DAYS_PRIOR:
        return '7 days prior to sowing season';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
          .NOT_APPLICABLE:
        return 'Not applicable';
      default:
        return enumValue.name;
    }
  }

  String _mapAvailabilityPlaceFromEnum(
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?
    enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_3_KM_AVAILABLE:
        return 'Within 3 km of distance';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_6_KM_AVAILABLE:
        return 'Within 6 km of distance';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .A_10_KM_AVAILABLE:
        return 'Within 10 km of distance';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_WITHIN_10_KM:
        return 'Not within 10 km of distance';
      case Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
          .NOT_APPLICABLE:
        return 'Not applicable';
      default:
        return enumValue.name;
    }
  }

  String _mapAccountsMisFromEnum(
    Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .MS_OFFICE_TOOLS:
        return 'Basic MS Office tools';
      case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices.NO_MIS:
        return 'No MIS present';
      case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .SOFTWARE_DIGITAL:
        return 'Software & digitized MIS';
      case Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices
          .TALLY_NO_DIGITAL:
        return 'Tally but no digitization';
      default:
        return enumValue.name;
    }
  }

  String _mapStatutoryFillingsFromEnum(
    Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices.NO_DELAYS:
        return 'No delays';
      case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .FEW_DELAYS_FILLED:
        return 'Few delays but filled';
      case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .MULTIPLE_DELAYS_FILLED:
        return 'Multiple delays but filled';
      case Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
          .DELAYS_NOT_FILLED:
        return 'Delays not filled';
      default:
        return enumValue.name;
    }
  }

  String _mapBooksRecordsFromEnum(
    Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .CURRENT:
        return 'Current';
      case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .LAG_2_3_DAYS:
        return 'Updated with 2-3 days lag';
      case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .PROCESSES_SYSTEMS:
        return 'Processes and Systems';
      case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
          .WEEKLY_UPDATED:
        return 'Updated weekly';
      default:
        return enumValue.name;
    }
  }

  String _mapReconciliationStocksFromEnum(
    Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices? enumValue,
  ) {
    if (enumValue == null) return 'N/A';
    switch (enumValue) {
      case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .ABSENT_ANNUAL:
        return 'Absent or annual';
      case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .A_2_4_TIMES_YEAR:
        return '2-4 times per year';
      case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .EVERY_15_DAYS:
        return 'Every 15 days';
      case Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
          .MONTHLY:
        return 'Monthly';
      default:
        return enumValue.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'FPO Performance Report',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: _selectedFinancialYear,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFinancialYear = newValue!;
                  _fetchScoreData(); // Refresh data when year changes
                });
              },
              items: _availableFinancialYears.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    'FY $value',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _fetchScoreData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall Score Card
              _buildOverallScoreCard(),

              // Status Section
              _buildStatusSection(),

              // New sections for FPO reporting
              _buildMembershipGovernanceSection(),
              _buildBusinessOperationsSection(),
              _buildProcessSystemsSection(),
              _buildFinancialPerformanceSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _downloadReport,
        icon: const Icon(Icons.download),
        label: const Text('Download PDF'),
      ),
    );
  }

  Future<void> _downloadReport() async {
    final fpoGlobalId = AuthService.instance.currentFpoId;
    final submissionGlobalId = _submissionData?.id;

    if (fpoGlobalId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('FPO ID not available')));
      return;
    }

    if (submissionGlobalId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No submission available to download')),
      );
      return;
    }

    // Convert Relay global IDs (base64 "TypeName:ID") to plain integer IDs
    final fpoId = _extractNumericId(fpoGlobalId);
    if (fpoId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid FPO ID')));
      return;
    }

    final submissionId = _extractNumericId(submissionGlobalId);
    if (submissionId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid submission ID')));
      return;
    }

    // Build base endpoint by removing '/graphql/' from GRAPHQL_ENDPOINT
    String endpoint = Config.GRAPHQL_ENDPOINT.replaceFirst('/graphql/', '');
    if (!endpoint.endsWith('/')) {
      endpoint = '$endpoint/';
    }

    final token = AuthService.instance.token;
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please sign in again to download')),
      );
      return;
    }

    try {
      // The report needs a signed-in user, so ask for a short-lived signed
      // link and open that in the browser.
      final linkResponse = await http.get(
        Uri.parse(
          '${endpoint}fpo/fpos/$fpoId/submissions/$submissionId/pdf-link/',
        ),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (!mounted) return;
      if (linkResponse.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              linkResponse.statusCode == 401
                  ? 'Your session has expired. Please sign in again'
                  : 'Could not prepare the report download',
            ),
          ),
        );
        return;
      }
      final url = Uri.parse(jsonDecode(linkResponse.body)['url'] as String);
      final launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!mounted) return;
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open download link')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to launch: $e')));
    }
  }

  Widget _buildOverallScoreCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F8), // Light bluish background
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Score',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'FY $_selectedFinancialYear',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              if (!_isLoadingScore && _isGreenFPO)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.eco, color: Colors.white, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'Green FPO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),

          // Score Display
          if (_isLoadingScore)
            _buildLoadingState()
          else if (_calculatedScore != null)
            _buildCompactScoreDisplay(_calculatedScore!)
          else
            _buildNoScoreState(),
        ],
      ),
    );
  }

  Widget _buildCompactScoreDisplay(double score) {
    return Row(
      children: [
        // Circular Progress
        Container(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getScoreColor(score),
                  ),
                ),
              ),
              Center(
                child: Text(
                  _formatScore(score),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getScoreColor(score),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),

        // Score Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_formatScore(score)} / 100',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _getScoreColor(score).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getScoreLabel(score),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _getScoreColor(score),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Container(
      height: 80,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildNoScoreState() {
    return Container(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.grey[400], size: 24),
          const SizedBox(height: 8),
          Text(
            'No score data available',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Title
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              'FPO Categories & Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
          ),

          // FPO Categories Grid
          _buildMetricsGrid(),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid() {
    if (_isLoadingScore) {
      return Container(
        height: 300,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_fpoCategories.isEmpty) {
      return Container(
        height: 100,
        child: Center(
          child: Text(
            'No category data available',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // One item per row
        childAspectRatio: 4.0, // Wider aspect ratio for KPIs
        crossAxisSpacing: 8, // Horizontal spacing between items
        mainAxisSpacing: 8, // Vertical spacing between rows
      ),
      itemCount: _fpoCategories.length,
      itemBuilder: (context, index) {
        final category = _fpoCategories[index];
        return _buildFpoCategoryItem(
          category['title'],
          category['icon'],
          category['score'],
          category['status'],
        );
      },
    );
  }

  Widget _buildFpoCategoryItem(
    String title,
    IconData icon,
    int score,
    String status,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon with background
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24, color: Color(0xFF2069B9)),
          ),
          const SizedBox(width: 16),

          // Title and score
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1F2937),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Performance Score',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),

          // Score value (KPI style)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFF2069B9).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$score%',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2069B9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // New section builders
  Widget _buildMembershipGovernanceSection() {
    if (_submissionData == null) return const SizedBox.shrink();

    return _buildReportingSection('Membership & Governance', [
      _buildReportingCard(
        'Active membership',
        '${_submissionData?.fpoDetails?.farmersTransacted ?? 0}',
        'farmers transacted',
        Icons.people,
      ),
      _buildReportingCard(
        'Second line of management',
        _mapSecondLineManagementFromEnum(
          _submissionData?.governance?.secondLineManagement,
        ),
        '',
        Icons.corporate_fare,
      ),

      _buildReportingCard(
        'Minutes of meetings',
        _mapMinutesMaintenanceFromEnum(
          _submissionData?.governance?.minutesMaintenance,
        ),
        '',
        Icons.description,
      ),
      _buildReportingCard(
        'Achievement for size of FPO',
        _calculateFpoSizeAchievement(),
        '% of target',
        Icons.trending_up,
      ),
    ]);
  }

  Widget _buildBusinessOperationsSection() {
    if (_submissionData == null) return const SizedBox.shrink();

    if (_submissionData?.businessOperations?.accessibilityPercentage == null) {
      return const SizedBox.shrink();
    }

    if ((double.tryParse(
              _submissionData?.businessOperations?.accessibilityPercentage ??
                  '0',
            ) ??
            0) <
        0.01) {
      return _buildReportingSection('Business & Operations', [
        _buildReportingCard(
          'Input are not available ',
          'to farmers',
          '',
          Icons.inventory_2,
        ),
        if (_submissionData?.businessOperations?.availabilityOfInputsPlace !=
            Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
                .NOT_APPLICABLE)
          _buildReportingCard(
            'Output Collection Centers - distance',
            _mapAvailabilityPlaceFromEnum(
              _submissionData?.businessOperations?.availabilityOfInputsPlace,
            ),
            'distance for majority of farmers',
            Icons.local_shipping,
          ),
        if (_submissionData?.businessOperations?.availabilityOfInputsPlace ==
            Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
                .NOT_APPLICABLE)
          _buildReportingCard(
            'Output Collection Centers',
            'are not available',
            '',
            Icons.local_shipping,
          ),
      ]);
    }

    return _buildReportingSection('Business & Operations', [
      _buildReportingCard(
        'Input Provided to ',
        _formatPercentage(
          _submissionData?.businessOperations?.accessibilityPercentage,
        ),
        'of members',
        Icons.inventory_2,
      ),
      if (Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
              .NOT_APPLICABLE !=
          _submissionData?.businessOperations?.availabilityOfInputsTimeliness)
        _buildReportingCard(
          'Timely Input Delivery',
          _mapAvailabilityTimelinessFromEnum(
            _submissionData?.businessOperations?.availabilityOfInputsTimeliness,
          ),
          '',
          Icons.access_time,
        ),
      if (Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices
              .NOT_APPLICABLE ==
          _submissionData?.businessOperations?.availabilityOfInputsTimeliness)
        _buildReportingCard(
          'Timely Input Delivery',
          _mapAvailabilityTimelinessFromEnum(
            _submissionData?.businessOperations?.availabilityOfInputsTimeliness,
          ),
          '',
          Icons.access_time,
        ),
      if (_submissionData?.businessOperations?.availabilityOfInputsPlace !=
          Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
              .NOT_APPLICABLE)
        _buildReportingCard(
          'Inputs to members- Place',
          _mapAvailabilityPlaceFromEnum(
            _submissionData?.businessOperations?.availabilityOfInputsPlace,
          ),
          'for majority of farmers',
          Icons.location_on,
        ),
      if (_submissionData?.businessOperations?.availabilityOfInputsPlace !=
          Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
              .NOT_APPLICABLE)
        _buildReportingCard(
          'Output Collection Centers - distance',
          _mapAvailabilityPlaceFromEnum(
            _submissionData?.businessOperations?.availabilityOfInputsPlace,
          ),
          'distance for majority of farmers',
          Icons.local_shipping,
        ),
      if (_submissionData?.businessOperations?.availabilityOfInputsPlace ==
          Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices
              .NOT_APPLICABLE)
        _buildReportingCard(
          'Output Collection Centers',
          'are not available',
          '',
          Icons.local_shipping,
        ),
    ]);
  }

  Widget _buildProcessSystemsSection() {
    if (_submissionData == null) return const SizedBox.shrink();

    return _buildReportingSection('Process & Systems', [
      _buildReportingCard(
        'Accounts & MIS',
        _mapAccountsMisFromEnum(
          _submissionData?.processesSystems?.accountsAndMis,
        ),
        '',
        Icons.account_balance,
      ),
      _buildReportingCard(
        'Statutory filings',
        _mapStatutoryFillingsFromEnum(
          _submissionData?.processesSystems?.statutoryFillings,
        ),
        '',
        Icons.assignment,
      ),
      _buildReportingCard(
        'Books and records',
        _mapBooksRecordsFromEnum(
          _submissionData?.processesSystems?.booksAndRecordsUpToDate,
        ),
        '',
        Icons.book,
      ),
      _buildReportingCard(
        'Reconciliation of stocks',
        _mapReconciliationStocksFromEnum(
          _submissionData?.processesSystems?.reconciliationOfStocks,
        ),
        '',
        Icons.inventory,
      ),
    ]);
  }

  Widget _buildFinancialPerformanceSection() {
    if (_submissionData == null) return const SizedBox.shrink();

    // Calculate all values first and filter out "N/A" results
    final revenuePerMember = _calculateRevenuePerMember();
    final netProfitMargin = _calculateNetProfitMargin();
    final currentRatio = _calculateCurrentRatio();
    final inventoryPeriod = _calculateInventoryPeriod();

    final List<Widget> cards = [];

    // Only add cards for values that are not "N/A"
    if (revenuePerMember != 'N/A') {
      cards.add(
        _buildReportingCard(
          'Revenue per active member',
          revenuePerMember,
          'per member',
          Icons.monetization_on,
        ),
      );
    }

    if (netProfitMargin != 'N/A') {
      cards.add(
        _buildReportingCard(
          'Net profit margin',
          netProfitMargin,
          '%',
          Icons.trending_up,
        ),
      );
    }

    if (currentRatio != 'N/A') {
      cards.add(
        _buildReportingCard('Current ratio', currentRatio, '', Icons.balance),
      );
    }

    if (inventoryPeriod != 'N/A') {
      cards.add(
        _buildReportingCard(
          'Inventory period',
          inventoryPeriod,
          'days',
          Icons.schedule,
        ),
      );
    }

    // Only show the section if there are cards to display
    if (cards.isEmpty) return const SizedBox.shrink();

    return _buildReportingSection('Financial Performance', cards);
  }

  Widget _buildReportingSection(String title, List<Widget> cards) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          ...cards,
        ],
      ),
    );
  }

  Widget _buildReportingCard(
    String title,
    String value,
    String unit,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: const Color(0xFF2069B9)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF374151),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (unit.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        unit,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B7280),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for calculations
  String _calculateFpoSizeAchievement() {
    final actual = _submissionData?.fpoDetails?.sizeOfFpoFy2324;
    final target = _submissionData?.fpoDetails?.targetSizeOfFpo;

    if (actual != null && target != null && target > 0) {
      final pct = (actual / target) * 100;
      return _formatScore(pct);
    }
    return 'N/A';
  }

  String _calculateRevenuePerMember() {
    final rev =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearRevenue ?? '0',
        ) ??
        0;
    final active = _submissionData?.fpoDetails?.farmersTransacted ?? 0;

    if (active > 0) {
      final revPerMember = rev / active;
      return _formatCurrency(revPerMember);
    }
    return 'N/A';
  }

  String _calculateNetProfitMargin() {
    final np =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearNetProfit ?? '0',
        ) ??
        0;
    final rev =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearRevenue ?? '0',
        ) ??
        0;

    if (rev > 0) {
      final marginPct = (np / rev) * 100;
      return _formatScore(marginPct);
    }
    return 'N/A';
  }

  String _calculateCurrentRatio() {
    final ca =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearCurrentAssets ?? '0',
        ) ??
        0;
    final cl =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearCurrentLiabilities ??
              '0',
        ) ??
        0;

    if (cl > 0) {
      final currentRatio = ca / cl;
      if (currentRatio % 1 == 0) {
        return currentRatio.toInt().toString();
      }
      return currentRatio.toStringAsFixed(2);
    }
    return 'N/A';
  }

  String _calculateInventoryPeriod() {
    final ci =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearClosingInventory ?? '0',
        ) ??
        0;
    final cogs =
        double.tryParse(
          _submissionData?.financialDetails?.currentYearCogs ?? '0',
        ) ??
        0;

    if (cogs > 0) {
      final inventoryDays = (ci / cogs) * 365;
      if (inventoryDays % 1 == 0) {
        return inventoryDays.toInt().toString();
      }
      return inventoryDays.toStringAsFixed(0);
    }
    return 'N/A';
  }

  String _formatCurrency(double amount) {
    if (amount >= 10000000) {
      return '₹${(amount / 10000000).toStringAsFixed(1)} Cr';
    } else if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(1)} L';
    } else if (amount >= 1000) {
      return '₹${(amount / 1000).toStringAsFixed(1)} K';
    }
    return '₹${amount.toStringAsFixed(0)}';
  }

  String _formatPercentage(String? percentageString) {
    if (percentageString == null) return '0%';

    final percentage = double.tryParse(percentageString);
    if (percentage == null) return '0%';

    if (percentage % 1 == 0) {
      return '${percentage.toInt()}%';
    }
    return '${percentage.toStringAsFixed(1)}%';
  }
}

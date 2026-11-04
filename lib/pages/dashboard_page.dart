import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';
import '../services/form_data_service.dart';
import '../services/pdf_document_service.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedFinancialYear = '2024-25';
  bool _isProcessingDocument = false;
  double? _calculatedScore;
  bool _isLoadingScore = false;

  final List<String> _financialYears = [
    '2024-25',
    '2023-24',
    '2022-23',
    '2021-22',
  ];

  @override
  void initState() {
    super.initState();
    _loadSelectedFinancialYear();
  }

  @override
  void didUpdateWidget(covariant DashboardPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _fetchSubmissionData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authService = AuthService.instance;

    void _navigateToFpoSelector() {
      debugPrint('Navigating to FPO selector from dashboard');
      debugPrint('Current FPO ID: ${authService.currentFpoId}');
      context.go('/fpo-selector');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Form'),
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: _navigateToFpoSelector,
            child: Text("Select FPO"),
          ),
        ],
      ),
      body: Column(
        children: [
          // Financial Year Selector
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Text(
                  'Financial Year:',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedFinancialYear,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                        dropdownColor: colorScheme.primaryContainer,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedFinancialYear = newValue;
                              _calculatedScore = null;
                            });
                            _saveSelectedFinancialYear(newValue);
                            _fetchSubmissionData();
                          }
                        },
                        items: _financialYears.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshDashboard,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  if (authService.currentFpoVerificationStatus !=
                      'approved') ...[
                    _buildVerificationBanner(context, authService),
                    const SizedBox(height: 16),
                  ],
                  // Fill using Document Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.secondaryContainer,
                          colorScheme.secondaryContainer.withValues(alpha: 0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.secondary.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.description,
                                color: colorScheme.onSecondary,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Auto-Fill from Document',
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Upload a PDF or image to automatically extract and fill form data. Processing may take several minutes.',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSecondaryContainer
                                          .withValues(alpha: 0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _isProcessingDocument
                                ? null
                                : _fillUsingDocument,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.secondary,
                              foregroundColor: colorScheme.onSecondary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            icon: _isProcessingDocument
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: colorScheme.onSecondary,
                                    ),
                                  )
                                : const Icon(Icons.upload_file, size: 20),
                            label: Text(
                              _isProcessingDocument
                                  ? 'Processing Document...'
                                  : 'Select Document (PDF/Image)',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // FPO Profile Section
                  _buildInfoSection(
                    context,
                    '1. FPO Details',
                    'Basic information and incorporation details of the FPO',
                    Icons.business,
                    Colors.blue,
                    '1',
                  ),

                  const SizedBox(height: 16),

                  // Governance Section
                  _buildInfoSection(
                    context,
                    '2. Governance',
                    'Governance structure and management details',
                    Icons.account_balance,
                    Colors.indigo,
                    '2',
                  ),

                  const SizedBox(height: 16),

                  // CEO Profile Section
                  _buildInfoSection(
                    context,
                    '3. Profile of Chief Executive Officer',
                    'CEO details, qualifications and experience',
                    Icons.person,
                    Colors.green,
                    '3',
                  ),

                  const SizedBox(height: 16),

                  // Board Directors Section
                  _buildInfoSection(
                    context,
                    '4. Profile of Board of Directors',
                    'Board members details and their roles',
                    Icons.group,
                    Colors.orange,
                    '4',
                  ),

                  const SizedBox(height: 16),

                  // Business Operations Section
                  _buildInfoSection(
                    context,
                    '5. Business and Operations',
                    'Business activities and operational details',
                    Icons.factory,
                    Colors.purple,
                    '5',
                  ),

                  const SizedBox(height: 16),

                  // Compliances Section
                  _buildInfoSection(
                    context,
                    '6. Details of Compliances',
                    'Legal and regulatory compliance information',
                    Icons.gavel,
                    Colors.red,
                    '6',
                  ),

                  const SizedBox(height: 16),

                  // Process Systems Section
                  _buildInfoSection(
                    context,
                    '7. Processes and Systems (E)',
                    'Electronic systems and process documentation',
                    Icons.settings,
                    Colors.teal,
                    '7',
                  ),

                  const SizedBox(height: 16),

                  // Financial Details Section
                  _buildInfoSection(
                    context,
                    '8. Financial Details',
                    'Financial statements and accounting information',
                    Icons.account_balance_wallet,
                    Colors.amber,
                    '8',
                  ),

                  const SizedBox(height: 16),

                  // Sustainable Activities Section
                  _buildInfoSection(
                    context,
                    '9. Sustainable Activities',
                    'Environmental and sustainability initiatives',
                    Icons.eco,
                    Colors.lightGreen,
                    '9',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationBanner(
    BuildContext context,
    AuthService authService,
  ) {
    final theme = Theme.of(context);
    final status = authService.currentFpoVerificationStatus ?? 'pending';
    final rejected = status == 'rejected';
    final notes = authService.currentFpoVerificationNotes?.trim();
    final color = rejected ? theme.colorScheme.error : Colors.orange.shade800;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            rejected ? Icons.info_outline : Icons.hourglass_top,
            color: color,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rejected
                      ? 'FPO profile rejected'
                      : 'FPO verification pending',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rejected
                      ? (notes?.isNotEmpty == true
                            ? notes!
                            : 'The admin rejected this FPO profile.')
                      : 'Your FPO profile is waiting for admin review.',
                  style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
                ),
                const SizedBox(height: 4),
                Text(
                  'App access is active: you can complete every section and view your scores now. Public listing and admin report aggregation start only after approval.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshDashboard() async {
    await AuthService.instance.refreshFpoStatus();
    await _fetchSubmissionData();
  }

  Widget _buildInfoSection(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    String step,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _navigateToForm(context, step),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadSelectedFinancialYear() async {
    try {
      final savedYear = await AuthService.instance.getSelectedFinancialYear();
      if (savedYear != null && _financialYears.contains(savedYear)) {
        setState(() {
          _selectedFinancialYear = savedYear;
        });
      }
      _fetchSubmissionData();
    } catch (e) {
      debugPrint('Error loading selected financial year: $e');
      _fetchSubmissionData();
    }
  }

  Future<void> _saveSelectedFinancialYear(String financialYear) async {
    try {
      await AuthService.instance.saveSelectedFinancialYear(financialYear);
    } catch (e) {
      debugPrint('Error saving selected financial year: $e');
    }
  }

  Future<void> _fetchSubmissionData() async {
    setState(() {
      _isLoadingScore = true;
    });

    try {
      final submission = await FormDataService.instance.getSubmission(
        financialYear: _selectedFinancialYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (mounted) {
        setState(() {
          _calculatedScore = submission?.calculatedScore;
          _isLoadingScore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingScore = false;
        });
      }
      debugPrint('Error fetching submission data: $e');
      rethrow; // Add this to properly handle the refresh indicator
    }
  }

  Widget _buildScoreSection(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.tertiaryContainer,
            colorScheme.tertiaryContainer.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.tertiary.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.score,
                  color: colorScheme.onTertiary,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_calculatedScore != null && !_isLoadingScore)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    '${_calculatedScore!.toStringAsFixed(1)}/100',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getScoreColor(_calculatedScore!, colorScheme),
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: _calculatedScore! / 100,
                    backgroundColor: colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _getScoreColor(_calculatedScore!, colorScheme),
                    ),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _getScoreColor(double score, ColorScheme colorScheme) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return colorScheme.primary;
    if (score >= 40) return Colors.orange;
    return colorScheme.error;
  }

  void _navigateToForm(BuildContext context, String step) {
    context.push('/form/$_selectedFinancialYear/$step');
  }

  Future<void> _fillUsingDocument() async {
    setState(() {
      _isProcessingDocument = true;
    });

    try {
      // Pick document (PDF or image)
      final selectedFile = await PdfDocumentService.instance.pickPdfDocument();

      if (selectedFile == null) {
        // User cancelled file selection
        setState(() {
          _isProcessingDocument = false;
        });
        return;
      }

      // Validate file size (max 10MB)
      final fileSize = await selectedFile.length();
      if (fileSize > 10 * 1024 * 1024) {
        if (mounted) {
          setState(() {
            _isProcessingDocument = false;
          });
          _showErrorDialog(
            'File Too Large',
            'The selected file is too large (${_formatFileSize(fileSize)}). Please select a file smaller than 10MB.',
            Icons.file_present,
          );
        }
        return;
      }

      // Get FPO ID from auth service
      final userFpo = AuthService.instance.currentFpoId;
      if (userFpo == null) {
        if (mounted) {
          setState(() {
            _isProcessingDocument = false;
          });
          _showErrorDialog(
            'FPO Not Found',
            'No FPO is associated with your account. Please contact support.',
            Icons.business,
          );
        }
        return;
      }

      // Convert financial year format from "2024-25" to "2024-2025"
      final apiFinancialYear = _convertFinancialYear(_selectedFinancialYear);

      // Extract numeric ID from GraphQL global ID (base64 encoded "FPONode:X")
      final fpoId = _extractNumericId(userFpo);
      if (fpoId == null) {
        if (mounted) {
          setState(() {
            _isProcessingDocument = false;
          });
          _showErrorDialog(
            'Invalid FPO ID',
            'Unable to extract FPO ID from user data. Please contact support.',
            Icons.business,
          );
        }
        return;
      }

      // Process the document and extract data
      final processingResponse = await PdfDocumentService.instance
          .processDocument(
            selectedFile,
            fpoId: fpoId,
            financialYear: apiFinancialYear,
          );

      if (mounted) {
        setState(() {
          _isProcessingDocument = false;
        });

        // Show success bottom sheet with summary
        _showDocumentProcessedBottomSheet(processingResponse);
      }
    } on Exception catch (e) {
      if (mounted) {
        setState(() {
          _isProcessingDocument = false;
        });

        // Handle specific error types
        if (e.toString().contains('permission')) {
          _showErrorDialog(
            'Permission Required',
            'Storage permission is needed to select documents. Please grant permission in your device settings and try again.',
            Icons.security,
          );
        } else if (e.toString().contains('Unsupported file format')) {
          _showErrorDialog(
            'Invalid File Format',
            'The selected file is not supported. Please select a PDF or an image (JPG, PNG, HEIC) and try again.',
            Icons.insert_drive_file,
          );
        } else if (e.toString().contains('API Error')) {
          _showErrorDialog(
            'Server Error',
            'Unable to process the document due to a server error. Please try again later.',
            Icons.cloud_off,
          );
        } else if (e.toString().contains('SocketException') ||
            e.toString().contains('Connection') ||
            e.toString().contains('TimeoutException') ||
            e.toString().contains('timeout')) {
          _showErrorDialog(
            'Connection Error',
            'Unable to connect to the processing server or request timed out. Using offline processing mode.',
            Icons.wifi_off,
          );
        } else {
          debugPrint('Document Processing Error: $e');
          _showErrorDialog(
            'Processing Failed',
            'Unable to process the document. Error: ${e.toString()}',
            Icons.error_outline,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isProcessingDocument = false;
        });
        _showErrorDialog(
          'Unexpected Error',
          'An unexpected error occurred while processing the document. Please try again.',
          Icons.warning,
        );
      }
    }
  }

  void _showDocumentProcessedBottomSheet(
    PdfProcessingResponse processingResponse,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_circle,
                            color: colorScheme.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Document Data Extracted',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.close,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Document Processing Summary:',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Summary statistics
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant.withAlpha(50),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colorScheme.outline.withAlpha(100),
                              ),
                            ),
                            child: Column(
                              children: [
                                _buildSummaryStat(
                                  'Successful Extractions',
                                  processingResponse.summary.totalSuccessful,
                                  Colors.green,
                                ),
                                _buildSummaryStat(
                                  'No Data Extractions',
                                  processingResponse.summary.totalNoData,
                                  Colors.orange,
                                ),
                                _buildSummaryStat(
                                  'Error Extractions',
                                  processingResponse.summary.totalErrors,
                                  Colors.red,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Submission ID: ${processingResponse.submissionId}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Text summary
                          if (processingResponse.summary.textSummary.isNotEmpty)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer.withAlpha(
                                  30,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorScheme.primary.withAlpha(50),
                                ),
                              ),
                              child: Text(
                                processingResponse.summary.textSummary,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.errorContainer.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: colorScheme.error.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: colorScheme.error,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'No extractable data found in the selected document.',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: colorScheme.error),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          const SizedBox(height: 16),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer.withValues(
                                alpha: 0.3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: colorScheme.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'You can now navigate to the FPO Details form to review and submit the information.',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onPrimaryContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // Bottom action
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigate to FPO Details form
                          context.push('/form/$_selectedFinancialYear/1');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Go to FPO Details Form',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorDialog(String title, String message, IconData icon) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.error.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: colorScheme.error, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'OK',
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  String _formatFieldName(String fieldName) {
    // Convert camelCase to readable format
    return fieldName
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (match) => '${match[1]} ${match[2]}',
        )
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? word[0].toUpperCase() + word.substring(1).toLowerCase()
              : '',
        )
        .join(' ');
  }

  String _convertFinancialYear(String shortYear) {
    return shortYear; // Return as-is if format is unexpected
  }

  int? _extractNumericId(String globalId) {
    try {
      // Decode base64 global ID (format: "TypeName:ID")
      final decoded = utf8.decode(base64.decode(globalId));
      final parts = decoded.split(':');
      if (parts.length == 2) {
        return int.tryParse(parts[1]);
      }
    } catch (e) {
      debugPrint('Error extracting numeric ID from global ID: $e');
    }
    return null;
  }

  List<Widget> _buildUserFriendlyDataDisplay(
    Map<String, dynamic> data,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    List<Widget> widgets = [];

    for (var entry in data.entries) {
      final sectionData = entry.value as Map<String, dynamic>?;
      if (sectionData != null) {
        // Add section header
        widgets.add(
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12, top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _getSectionTitle(entry.key),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        );

        // Add section fields
        for (var fieldEntry in sectionData.entries) {
          widgets.add(
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getFieldTitle(fieldEntry.key),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatFieldValue(fieldEntry.key, fieldEntry.value),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return widgets;
  }

  String _getSectionTitle(String sectionKey) {
    switch (sectionKey) {
      case 'extract_basic_details':
        return '📋 Basic Details';
      case 'extract_governance_details':
        return '🏛️ Governance Details';
      case 'extract_ceo_profile':
        return '👨‍💼 CEO Profile';
      case 'extract_financial_details':
        return '💰 Financial Details';
      case 'extract_board_directors':
        return '👥 Board of Directors';
      case 'extract_business_operations':
        return '🏭 Business Operations';
      default:
        return _formatFieldName(sectionKey);
    }
  }

  String _getFieldTitle(String fieldKey) {
    switch (fieldKey) {
      case 'name_of_producer_organization':
        return 'Organization Name';
      case 'registered_address':
        return 'Registered Address';
      case 'district':
        return 'District';
      case 'state':
        return 'State';
      case 'type_of_producer_organization':
        return 'Organization Type';
      case 'date_of_incorporation':
        return 'Date of Incorporation';
      case 'size_of_fpo_fy_23_24':
        return 'FPO Size (FY 2023-24)';
      case 'size_of_fpo_fy_22_23':
        return 'FPO Size (FY 2022-23)';
      case 'annual_general_body_meetings':
        return 'Annual General Body Meetings';
      case 'bod_meetings_last_financial_year':
        return 'Board Meetings (Last FY)';
      case 'num_bods':
        return 'Number of Board Directors';
      case 'num_women_bods':
        return 'Women Board Directors';
      case 'name':
        return 'Name';
      case 'qualification':
        return 'Qualification';
      case 'type_of_experience':
        return 'Experience Type';
      case 'total_years_of_experience':
        return 'Years of Experience';
      case 'target_revenue':
        return 'Target Revenue';
      case 'operating_margin_fy_current':
        return 'Operating Margin (Current FY)';
      case 'total_debt_today':
        return 'Total Debt';
      case 'revenue_data':
        return 'Revenue Data';
      default:
        return _formatFieldName(fieldKey);
    }
  }

  String _formatFieldValue(String fieldKey, dynamic value) {
    if (value == null) return 'N/A';

    switch (fieldKey) {
      case 'type_of_producer_organization':
        return _formatOrganizationType(value.toString());
      case 'type_of_experience':
        return _formatExperienceType(value.toString());
      case 'date_of_incorporation':
        return _formatDate(value.toString());
      case 'size_of_fpo_fy_23_24':
      case 'size_of_fpo_fy_22_23':
      case 'target_revenue':
      case 'total_debt_today':
        return _formatCurrency(value);
      case 'operating_margin_fy_current':
        return '${value}%';
      case 'revenue_data':
        if (value is List) {
          return value
              .map(
                (item) =>
                    '${item['financial_year']}: ${_formatCurrency(item['revenue'])} (${item['name_of_products']})',
              )
              .join('\n');
        }
        return value.toString();
      default:
        return value.toString();
    }
  }

  String _formatOrganizationType(String type) {
    switch (type) {
      case 'producer_company':
        return 'Producer Company';
      case 'cooperative_society':
        return 'Cooperative Society';
      case 'self_help_group':
        return 'Self Help Group';
      default:
        return type
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (word) => word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1)
                  : '',
            )
            .join(' ');
    }
  }

  String _formatExperienceType(String type) {
    switch (type) {
      case 'agricultural_cooperatives':
        return 'Agricultural Cooperatives';
      case 'business_management':
        return 'Business Management';
      case 'rural_development':
        return 'Rural Development';
      default:
        return type
            .replaceAll('_', ' ')
            .split(' ')
            .map(
              (word) => word.isNotEmpty
                  ? word[0].toUpperCase() + word.substring(1)
                  : '',
            )
            .join(' ');
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  String _formatCurrency(dynamic amount) {
    if (amount == null) return 'N/A';

    final num value = num.tryParse(amount.toString()) ?? 0;

    if (value >= 10000000) {
      return '₹${(value / 10000000).toStringAsFixed(2)} Cr';
    } else if (value >= 100000) {
      return '₹${(value / 100000).toStringAsFixed(2)} L';
    } else if (value >= 1000) {
      return '₹${(value / 1000).toStringAsFixed(2)} K';
    } else {
      return '₹${value.toStringAsFixed(0)}';
    }
  }

  Widget _buildSummaryStat(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color.withAlpha(100)),
            ),
            child: Text(
              value.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

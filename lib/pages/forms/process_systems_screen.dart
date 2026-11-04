import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_data_mapper.dart';
import '../../utils/form_navigation_helper.dart';

class ProcessSystemsScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const ProcessSystemsScreen({
    super.key,
    required this.formYear,
    this.currentStep = 7,
  });

  @override
  State<ProcessSystemsScreen> createState() => _ProcessSystemsScreenState();
}

class _ProcessSystemsScreenState extends State<ProcessSystemsScreen> {
  // Dropdown selections
  String? _selectedAccountsMIS;
  String? _selectedInsuranceStock;
  String? _selectedCreditRecord;
  String? _selectedStatutoryFillings;
  String? _selectedBooksRecords;
  String? _selectedReconciliationStocks;
  String? _selectedPenaltiesLevied;

  // Dropdown options
  final List<String> _accountsMISOptions = [
    'No MIS is present ,Accounting is done manually',
    'Accounting managed by using basic MS Office tools but not software packages',
    'Accounting managed by tally, but no digitalization of the other operational records',
    'Software for managing accounts & digitalization of MIS',
  ];

  final List<String> _insuranceStockOptions = [
    'No insurance cover',
    'Less than 50% of the stock is insured against fire',
    '50% of the stock is insured against fire & theft',
    '100% stock is insured against fire & theft',
  ];

  final List<String> _creditRecordOptions = [
    'No Credit History',
    'More than one Record of delays/defaults in the last 3 financial years',
    'One record of delays/defaults in last 3 financial years',
    'No records of delays or default',
  ];

  final List<String> _statutoryFillingsOptions = [
    'Any delays in the past 12 months that are not yet filled',
    'Multiple delays (>5) over the past 12 months but filled as on date',
    'Few delays (<3) over the past 12 months but filled as on date',
    'No delays',
  ];

  final List<String> _booksRecordsOptions = [
    'Updated on monthly or more basis',
    'Updated on weekly basis',
    'Updated with a lag of 2-3 days',
    'Current',
  ];

  final List<String> _reconciliationStocksOptions = [
    'Absent or Annual',
    '2-4 times in a year',
    'Monthly',
    'At least every 15 days',
  ];

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
        'Process Systems: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null && submission.processesSystems != null) {
        final processData = submission.processesSystems!;
        debugPrint('Process Systems: Data found: ${processData.toJson()}');
        _populateProcessSystemsData(processData);
      }
    } catch (e, stack) {
      debugPrint('Process Systems: Error loading existing data: $e');
      debugPrint('Process Systems: Stack trace: $stack');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _populateProcessSystemsData(dynamic processData) {
    if (!mounted) return;

    setState(() {
      // Map the enum values back to display strings using FormDataMapper
      _selectedAccountsMIS = FormDataMapper.mapAccountsMISFromEnum(
        processData.accountsAndMis,
      );
      _selectedInsuranceStock = FormDataMapper.mapInsuranceStockFromEnum(
        processData.insuranceOfStock,
      );
      _selectedCreditRecord = FormDataMapper.mapCreditRecordFromEnum(
        processData.creditRecordOfFpo,
      );
      _selectedStatutoryFillings = FormDataMapper.mapStatutoryFillingsFromEnum(
        processData.statutoryFillings,
      );
      _selectedBooksRecords = _mapBooksRecordsFromEnum(
        processData.booksAndRecordsUpToDate,
      );
      _selectedReconciliationStocks =
          FormDataMapper.mapReconciliationStocksFromEnum(
            processData.reconciliationOfStocks,
          );
      _selectedPenaltiesLevied = _mapBoolToYesNo(
        processData.penaltiesLeviedBoardMeeting,
      );
    });
  }

  String? _mapBooksRecordsFromEnum(dynamic enumValue) {
    debugPrint('Process Systems: Mapping books records from enum: "$enumValue" (${enumValue.runtimeType})');
    
    // Handle if we get an enum object directly
    if (enumValue is Enum$BooksRecordsTypeEnum) {
      switch (enumValue) {
        case Enum$BooksRecordsTypeEnum.WEEKLY_UPDATED:
          return 'Updated on weekly basis';
        case Enum$BooksRecordsTypeEnum.LAG_2_3_DAYS:
          return 'Updated with a lag of 2-3 days';
        case Enum$BooksRecordsTypeEnum.CURRENT:
          return 'Current';
        case Enum$BooksRecordsTypeEnum.PROCESSES_SYSTEMS:
          return 'Updated on monthly or more basis';
        default:
          return enumValue.name;
      }
    }

    if (enumValue is Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices) {
      switch (enumValue) {
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.WEEKLY_UPDATED:
          return 'Updated on weekly basis';
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.CURRENT:
          return 'Current';
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.LAG_2_3_DAYS:
          return 'Updated with a lag of 2-3 days';
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.PROCESSES_SYSTEMS:
          return 'Updated on monthly or more basis';
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.MONTHLY_OR_MORE:
          return 'Updated on monthly or more basis';
        case Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices.$unknown:
          return enumValue.name;
      }
    }
    
    // Handle if we get a string representation
    if (enumValue is String) {
      String? result;
      switch (enumValue) {
        case 'WEEKLY_UPDATED':
          result = 'Updated on weekly basis';
          break;
        case 'LAG_2_3_DAYS':
          result = 'Updated with a lag of 2-3 days';
          break;
        case 'CURRENT':
          result = 'Current';
          break;
        case 'PROCESSES_SYSTEMS':
          result = 'Updated on monthly or more basis';
          break;
        default:
          result = enumValue;
      }

      debugPrint('Process Systems: Books records mapped to: "$result"');
      return result;
    }
    
    return null;
  }

  String? _mapBoolToYesNo(bool? value) {
    if (value == null) return null;
    return value ? 'Yes' : 'No';
  }

  // Reverse mapping methods (for saving)
  Enum$AccountsMISTypeEnum? _mapAccountsMISToEnum(String? displayValue) {
    if (displayValue == null) return null;
    if (displayValue.contains('manually'))
      return Enum$AccountsMISTypeEnum.NO_MIS;
    if (displayValue.contains('MS Office tools'))
      return Enum$AccountsMISTypeEnum.MS_OFFICE_TOOLS;
    if (displayValue.contains('tally'))
      return Enum$AccountsMISTypeEnum.TALLY_NO_DIGITAL;
    if (displayValue.contains('Software'))
      return Enum$AccountsMISTypeEnum.SOFTWARE_DIGITAL;
    return null;
  }

  Enum$InsuranceStockTypeEnum? _mapInsuranceStockToEnum(String? displayValue) {
    if (displayValue == null) return null;
    if (displayValue.contains('No insurance'))
      return Enum$InsuranceStockTypeEnum.NO_INSURANCE;
    if (displayValue.contains('Less than 50%'))
      return Enum$InsuranceStockTypeEnum.LESS_THAN_50_FIRE;
    if (displayValue.contains('50% of the stock'))
      return Enum$InsuranceStockTypeEnum.FIFTY_PERCENT_FIRE_THEFT;
    if (displayValue.contains('100% stock'))
      return Enum$InsuranceStockTypeEnum.HUNDRED_PERCENT_FIRE_THEFT;
    return null;
  }

  Enum$CreditRecordTypeEnum? _mapCreditRecordToEnum(String? displayValue) {
    if (displayValue == null) return null;
    if (displayValue.contains('No Credit History'))
      return Enum$CreditRecordTypeEnum.NO_CREDIT_HISTORY;
    if (displayValue.contains('More than one Record'))
      return Enum$CreditRecordTypeEnum.MULTIPLE_DELAYS;
    if (displayValue.contains('One record'))
      return Enum$CreditRecordTypeEnum.ONE_DELAY;
    if (displayValue.contains('No records'))
      return Enum$CreditRecordTypeEnum.NO_DELAYS;
    return null;
  }

  Enum$StatutoryFillingsTypeEnum? _mapStatutoryFillingsToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;
    if (displayValue.contains('not yet filled'))
      return Enum$StatutoryFillingsTypeEnum.DELAYS_NOT_FILLED;
    if (displayValue.contains('Multiple delays (>5)'))
      return Enum$StatutoryFillingsTypeEnum.MULTIPLE_DELAYS_FILLED;
    if (displayValue.contains('Few delays (<3)'))
      return Enum$StatutoryFillingsTypeEnum.FEW_DELAYS_FILLED;
    if (displayValue.contains('No delays'))
      return Enum$StatutoryFillingsTypeEnum.NO_DELAYS;
    return null;
  }

  Enum$BooksRecordsTypeEnum? _mapBooksRecordsToEnum(String? displayValue) {
    if (displayValue == null) return null;
    if (displayValue.contains('monthly or more'))
      return Enum$BooksRecordsTypeEnum.PROCESSES_SYSTEMS;
    if (displayValue.contains('weekly'))
      return Enum$BooksRecordsTypeEnum.WEEKLY_UPDATED;
    if (displayValue.contains('lag of 2-3 days'))
      return Enum$BooksRecordsTypeEnum.LAG_2_3_DAYS;
    if (displayValue.contains('Current'))
      return Enum$BooksRecordsTypeEnum.CURRENT;
    return null;
  }

  Enum$ReconciliationStocksTypeEnum? _mapReconciliationStocksToEnum(
    String? displayValue,
  ) {
    if (displayValue == null) return null;
    if (displayValue.contains('Absent or Annual'))
      return Enum$ReconciliationStocksTypeEnum.ABSENT_ANNUAL;
    if (displayValue.contains('2-4 times'))
      return Enum$ReconciliationStocksTypeEnum.TWO_TO_FOUR_TIMES;
    if (displayValue.contains('Monthly'))
      return Enum$ReconciliationStocksTypeEnum.MONTHLY;
    if (displayValue.contains('every 15 days'))
      return Enum$ReconciliationStocksTypeEnum.EVERY_15_DAYS;
    return null;
  }

  bool? _mapYesNoToBool(String? value) {
    if (value == null) return null;
    return value == 'Yes';
  }

  Future<bool> _validateForm() async {
    if (_selectedAccountsMIS == null) {
      _showValidationError('Please select accounts & MIS option');
      return false;
    }
    if (_selectedInsuranceStock == null) {
      _showValidationError('Please select insurance of stock option');
      return false;
    }
    if (_selectedCreditRecord == null) {
      _showValidationError('Please select credit record option');
      return false;
    }
    if (_selectedStatutoryFillings == null) {
      _showValidationError('Please select statutory fillings option');
      return false;
    }
    if (_selectedBooksRecords == null) {
      _showValidationError('Please select books and records option');
      return false;
    }
    if (_selectedReconciliationStocks == null) {
      _showValidationError('Please select reconciliation of stocks option');
      return false;
    }
    if (_selectedPenaltiesLevied == null) {
      _showValidationError('Please select penalties levied option');
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
      final processSystemsInput = Input$ProcessesSystemsSubmissionInput(
        accountsAndMis: _mapAccountsMISToEnum(_selectedAccountsMIS),
        insuranceOfStock: _mapInsuranceStockToEnum(_selectedInsuranceStock),
        creditRecordOfFpo: _mapCreditRecordToEnum(_selectedCreditRecord),
        statutoryFillings: _mapStatutoryFillingsToEnum(
          _selectedStatutoryFillings,
        ),
        booksAndRecordsUpToDate: _mapBooksRecordsToEnum(_selectedBooksRecords),
        reconciliationOfStocks: _mapReconciliationStocksToEnum(
          _selectedReconciliationStocks,
        ),
        penaltiesLeviedBoardMeeting: _mapYesNoToBool(_selectedPenaltiesLevied),
      );

      debugPrint('Process Systems: Submitting data: $processSystemsInput');

      final result = await FormDataService.instance.submitProcessesSystems(
        financialYear: widget.formYear,
        processesSystemsInput: processSystemsInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result?.success != true) {
        throw Exception(
          'Failed to submit process systems: ${result?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Process systems data submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      debugPrint('Process systems form submission error: $e');
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
      final processSystemsInput = Input$ProcessesSystemsSubmissionInput(
        accountsAndMis: _mapAccountsMISToEnum(_selectedAccountsMIS),
        insuranceOfStock: _mapInsuranceStockToEnum(_selectedInsuranceStock),
        creditRecordOfFpo: _mapCreditRecordToEnum(_selectedCreditRecord),
        statutoryFillings: _mapStatutoryFillingsToEnum(
          _selectedStatutoryFillings,
        ),
        booksAndRecordsUpToDate: _mapBooksRecordsToEnum(_selectedBooksRecords),
        reconciliationOfStocks: _mapReconciliationStocksToEnum(
          _selectedReconciliationStocks,
        ),
        penaltiesLeviedBoardMeeting: _mapYesNoToBool(_selectedPenaltiesLevied),
      );

      debugPrint('Process Systems: Submitting data: $processSystemsInput');

      final result = await FormDataService.instance.submitProcessesSystems(
        financialYear: widget.formYear,
        processesSystemsInput: processSystemsInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (result?.success != true) {
        throw Exception(
          'Failed to submit process systems: ${result?.errors?.join(", ") ?? "Unknown error"}',
        );
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Process systems data submitted successfully!'),
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
      debugPrint('Process systems form submission error: $e');
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
                              'System Management',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'Process & Systems',
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
                        '7/9',
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
                      widthFactor: 0.778, // 7/9 = 77.8%
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
                    // Accounts & MIS Section
                    Text(
                      'ACCOUNTS & MIS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Accounts & MIS*',
                      value: _selectedAccountsMIS,
                      items: _accountsMISOptions,
                      hintText: 'Select accounts & MIS option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAccountsMIS = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Insurance of Stock Section
                    Text(
                      'INSURANCE OF STOCK AGAINST FIRE & THEFT',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Insurance of stock against fire & theft*',
                      value: _selectedInsuranceStock,
                      items: _insuranceStockOptions,
                      hintText: 'Select insurance coverage option',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedInsuranceStock = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Credit Record Section
                    Text(
                      'CREDIT RECORD OF FPO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Credit Record of FPO*',
                      value: _selectedCreditRecord,
                      items: _creditRecordOptions,
                      hintText: 'Select credit record status',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCreditRecord = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Statutory Fillings Section
                    Text(
                      'STATUTORY FILLINGS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Statutory fillings*',
                      value: _selectedStatutoryFillings,
                      items: _statutoryFillingsOptions,
                      hintText: 'Select statutory fillings status',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedStatutoryFillings = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Books and Records Section
                    Text(
                      'BOOKS AND RECORDS STATUS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Are the books and records up to date*',
                      value: _selectedBooksRecords,
                      items: _booksRecordsOptions,
                      hintText: 'Select books and records status',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedBooksRecords = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Reconciliation of Stocks Section
                    Text(
                      'RECONCILIATION OF STOCKS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label: 'Reconciliation of stocks*',
                      value: _selectedReconciliationStocks,
                      items: _reconciliationStocksOptions,
                      hintText: 'Select reconciliation frequency',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedReconciliationStocks = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    // Penalties Section
                    Text(
                      'PENALTIES FOR NON-COMPLIANCE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _buildDropdownWithLabel(
                      label:
                          'Have penalties been levied in the financial year (22-23) for non compliance with statutory frequency of Board meeting?*',
                      value: _selectedPenaltiesLevied,
                      items: _yesNoOptions,
                      hintText: 'Select Yes or No',
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPenaltiesLevied = newValue;
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: label.replaceAll('*', ''),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (label.contains('*'))
                TextSpan(
                  text: '*',
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
        _buildOptimizedDropdownWidget(
          value: value,
          items: items,
          hintText: hintText,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildOptimizedDropdownWidget({
    required String? value,
    required List<String> items,
    required String hintText,
    required ValueChanged<String?> onChanged,
  }) {
    // Determine if we have long text items that need smaller font
    bool hasLongText = items.any((item) => item.length > 50);
    double fontSize = hasLongText ? 11.0 : 14.0;
    double hintFontSize = hasLongText ? 13.0 : 15.0;
    int maxLines = hasLongText ? 3 : 2;
    int selectedMaxLines = hasLongText ? 2 : 1;

    return Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
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
    );
  }
}

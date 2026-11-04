import 'dart:convert';

import 'package:flutter/material.dart';

import '../../schema.graphql.dart';
import '../../services/auth_service.dart';
import '../../services/form_data_service.dart';
import '../../utils/form_navigation_helper.dart';
import '../../utils/input_formatters.dart';
import '../../utils/voice_input_widget.dart';

class LoanEntry {
  final String year;
  final String lenderName;
  final double amount;

  LoanEntry({
    required this.year,
    required this.lenderName,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'lenderName': lenderName,
      'amount': amount,
    };
  }

  factory LoanEntry.fromJson(Map<String, dynamic> json) {
    return LoanEntry(
      year: json['year'] ?? '',
      lenderName: json['lenderName'] ?? '',
      amount: (json['amount'] is num) ? (json['amount'] as num).toDouble() : 0.0,
    );
  }

  @override
  String toString() {
    return 'LoanEntry(year: $year, lenderName: $lenderName, amount: $amount)';
  }

  // Helper method to get formatted year display
  String get formattedYear {
    if (year.length == 4) {
      final yearInt = int.tryParse(year);
      if (yearInt != null) {
        final nextYear = yearInt + 1;
        return '${year.substring(2)}-${nextYear.toString().substring(2)}';
      }
    }
    return year;
  }
}

class FinancialDetailsScreen extends StatefulWidget {
  final String formYear;
  final int currentStep;

  const FinancialDetailsScreen({
    super.key,
    required this.formYear,
    this.currentStep = 8,
  });

  @override
  State<FinancialDetailsScreen> createState() => _FinancialDetailsScreenState();
}

class _FinancialDetailsScreenState extends State<FinancialDetailsScreen> {
  // Revenue fields for 3 financial years
  final _currentYearRevenueController = TextEditingController();
  final _previousYearRevenueController = TextEditingController();
  final _twoYearsBackRevenueController = TextEditingController();
  final _currentYearProductsController = TextEditingController();
  final _previousYearProductsController = TextEditingController();
  final _twoYearsBackProductsController = TextEditingController();

  // Quantity procured fields
  final _currentYearQuantityController = TextEditingController();
  final _previousYearQuantityController = TextEditingController();
  final _twoYearsBackQuantityController = TextEditingController();
  final _currentYearQuantityProductsController = TextEditingController();
  final _previousYearQuantityProductsController = TextEditingController();
  final _twoYearsBackQuantityProductsController = TextEditingController();

  // Retail buying fields
  final _currentYearRetailRevenueController = TextEditingController();
  final _previousYearRetailRevenueController = TextEditingController();
  final _twoYearsBackRetailRevenueController = TextEditingController();
  final _currentYearRetailProductsController = TextEditingController();
  final _previousYearRetailProductsController = TextEditingController();
  final _twoYearsBackRetailProductsController = TextEditingController();

  // Wholesale buying fields
  final _currentYearWholesaleRevenueController = TextEditingController();
  final _previousYearWholesaleRevenueController = TextEditingController();
  final _twoYearsBackWholesaleRevenueController = TextEditingController();
  final _currentYearWholesaleProductsController = TextEditingController();
  final _previousYearWholesaleProductsController = TextEditingController();
  final _twoYearsBackWholesaleProductsController = TextEditingController();

  // Institutional buying fields
  final _currentYearInstitutionalRevenueController = TextEditingController();
  final _previousYearInstitutionalRevenueController = TextEditingController();
  final _twoYearsBackInstitutionalRevenueController = TextEditingController();
  final _currentYearInstitutionalProductsController = TextEditingController();
  final _previousYearInstitutionalProductsController = TextEditingController();
  final _twoYearsBackInstitutionalProductsController = TextEditingController();

  // Cost of goods sold fields
  final _currentYearCogsController = TextEditingController();
  final _previousYearCogsController = TextEditingController();
  final _twoYearsBackCogsController = TextEditingController();

  // Profit fields
  final _currentYearGrossProfitController = TextEditingController();
  final _previousYearGrossProfitController = TextEditingController();
  final _twoYearsBackGrossProfitController = TextEditingController();
  final _currentYearNetProfitController = TextEditingController();
  final _previousYearNetProfitController = TextEditingController();
  final _twoYearsBackNetProfitController = TextEditingController();

  // Margin fields
  final _operatingMarginController = TextEditingController();
  final _grossNetProfitMarginDifferenceController = TextEditingController();

  // Share capital fields
  final _currentYearShareCapitalController = TextEditingController();
  final _previousYearShareCapitalController = TextEditingController();
  final _twoYearsBackShareCapitalController = TextEditingController();

  // Shareholders - linked to FPO size (read-only, from FPO details)
  int? _fpoSizeFy2324; // Size of FPO for FY 23-24 (current year)
  int? _fpoSizeFy2223; // Size of FPO for FY 22-23 (previous year)
  int? _fpoSizeFy2122; // Size of FPO for FY 21-22 (two years back)
  final _currentYearShareholdersController = TextEditingController();
  final _previousYearShareholdersController = TextEditingController();
  final _twoYearsBackShareholdersController = TextEditingController();

  // Accounts payable/receivable fields
  final _currentYearAccountsPayableController = TextEditingController();
  final _previousYearAccountsPayableController = TextEditingController();
  final _twoYearsBackAccountsPayableController = TextEditingController();
  final _currentYearAccountsReceivableController = TextEditingController();
  final _previousYearAccountsReceivableController = TextEditingController();
  final _twoYearsBackAccountsReceivableController = TextEditingController();

  // Inventory fields
  final _currentYearOpeningInventoryController = TextEditingController();
  final _previousYearOpeningInventoryController = TextEditingController();
  final _twoYearsBackOpeningInventoryController = TextEditingController();
  final _currentYearClosingInventoryController = TextEditingController();
  final _previousYearClosingInventoryController = TextEditingController();
  final _twoYearsBackClosingInventoryController = TextEditingController();

  // Grant fields
  final _currentYearProjectGrantController = TextEditingController();
  final _previousYearProjectGrantController = TextEditingController();
  final _twoYearsBackProjectGrantController = TextEditingController();
  final _currentYearMatchingGrantController = TextEditingController();
  final _previousYearMatchingGrantController = TextEditingController();
  final _twoYearsBackMatchingGrantController = TextEditingController();

  // Net worth fields
  final _currentYearAssetsController = TextEditingController();
  final _previousYearAssetsController = TextEditingController();
  final _twoYearsBackAssetsController = TextEditingController();
  final _currentYearLiabilitiesController = TextEditingController();
  final _previousYearLiabilitiesController = TextEditingController();
  final _twoYearsBackLiabilitiesController = TextEditingController();

  // Current ratio fields
  final _currentYearCurrentAssetsController = TextEditingController();
  final _previousYearCurrentAssetsController = TextEditingController();
  final _twoYearsBackCurrentAssetsController = TextEditingController();
  final _currentYearCurrentLiabilitiesController = TextEditingController();
  final _previousYearCurrentLiabilitiesController = TextEditingController();
  final _twoYearsBackCurrentLiabilitiesController = TextEditingController();

  // Credit history fields
  final _currentYearLenderNameController = TextEditingController();
  final _previousYearLenderNameController = TextEditingController();
  final _twoYearsBackLenderNameController = TextEditingController();
  final _currentYearLoanAmountController = TextEditingController();
  final _previousYearLoanAmountController = TextEditingController();
  final _twoYearsBackLoanAmountController = TextEditingController();

  // Other financial fields
  final _cashChequePercentageController = TextEditingController();
  final _daysPayableReceivableDifferenceController = TextEditingController();
  final _totalDebtTodayController = TextEditingController();
  final _targetRevenueController = TextEditingController();
  String? _institutionalLendingHistoryValue;

  // Credit default fields
  final _creditDefaultYearController = TextEditingController();
  final _creditDefaultLenderController = TextEditingController();
  final _creditDefaultAmountController = TextEditingController();

  // Loan details management
  final List<LoanEntry> _loanEntries = [];

  // Loan entry form controllers
  final _loanYearController = TextEditingController();
  final _loanLenderNameController = TextEditingController();
  final _loanAmountController = TextEditingController();

  bool _isSubmitting = false;
  bool _isLoading = true;

  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _fieldKeys = {};

  @override
  void initState() {
    super.initState();
    _setupCalculationListeners();
    _loadExistingData();
  }

  void _setupCalculationListeners() {
    // Add listeners for automatic gross profit calculation
    _currentYearRevenueController.addListener(_calculateCurrentYearGrossProfit);
    _currentYearCogsController.addListener(_calculateCurrentYearGrossProfit);
    
    _previousYearRevenueController.addListener(_calculatePreviousYearGrossProfit);
    _previousYearCogsController.addListener(_calculatePreviousYearGrossProfit);
    
    _twoYearsBackRevenueController.addListener(_calculateTwoYearsBackGrossProfit);
    _twoYearsBackCogsController.addListener(_calculateTwoYearsBackGrossProfit);

    // Add listeners for net profit validation
    _currentYearNetProfitController.addListener(_validateCurrentYearNetProfit);
    _previousYearNetProfitController.addListener(_validatePreviousYearNetProfit);
    _twoYearsBackNetProfitController.addListener(_validateTwoYearsBackNetProfit);
  }

  // Gross Profit Calculation Methods
  void _calculateCurrentYearGrossProfit() {
    final revenueText = _currentYearRevenueController.text.trim();
    final cogsText = _currentYearCogsController.text.trim();
    
    // Only calculate if both fields have values
    if (revenueText.isNotEmpty || cogsText.isNotEmpty) {
      final revenue = double.tryParse(revenueText) ?? 0;
      final cogs = double.tryParse(cogsText) ?? 0;
      final grossProfit = revenue - cogs;
      
      // Avoid updating if the value is the same to prevent listener loops
      final currentGrossProfit = _currentYearGrossProfitController.text;
      final newGrossProfitText = grossProfit.toString();
      if (currentGrossProfit != newGrossProfitText) {
        _currentYearGrossProfitController.text = newGrossProfitText;
      }
    } else {
      // Clear gross profit if both revenue and cogs are empty
      _currentYearGrossProfitController.text = '';
    }
  }

  void _calculatePreviousYearGrossProfit() {
    final revenueText = _previousYearRevenueController.text.trim();
    final cogsText = _previousYearCogsController.text.trim();
    
    if (revenueText.isNotEmpty || cogsText.isNotEmpty) {
      final revenue = double.tryParse(revenueText) ?? 0;
      final cogs = double.tryParse(cogsText) ?? 0;
      final grossProfit = revenue - cogs;
      
      final currentGrossProfit = _previousYearGrossProfitController.text;
      final newGrossProfitText = grossProfit.toString();
      if (currentGrossProfit != newGrossProfitText) {
        _previousYearGrossProfitController.text = newGrossProfitText;
      }
    } else {
      _previousYearGrossProfitController.text = '';
    }
  }

  void _calculateTwoYearsBackGrossProfit() {
    final revenueText = _twoYearsBackRevenueController.text.trim();
    final cogsText = _twoYearsBackCogsController.text.trim();
    
    if (revenueText.isNotEmpty || cogsText.isNotEmpty) {
      final revenue = double.tryParse(revenueText) ?? 0;
      final cogs = double.tryParse(cogsText) ?? 0;
      final grossProfit = revenue - cogs;
      
      final currentGrossProfit = _twoYearsBackGrossProfitController.text;
      final newGrossProfitText = grossProfit.toString();
      if (currentGrossProfit != newGrossProfitText) {
        _twoYearsBackGrossProfitController.text = newGrossProfitText;
      }
    } else {
      _twoYearsBackGrossProfitController.text = '';
    }
  }

  // Net Profit Validation Methods
  void _validateCurrentYearNetProfit() {
    _validateNetProfitAgainstGrossProfit(
      _currentYearNetProfitController.text,
      _currentYearGrossProfitController.text,
      'current year',
    );
  }

  void _validatePreviousYearNetProfit() {
    _validateNetProfitAgainstGrossProfit(
      _previousYearNetProfitController.text,
      _previousYearGrossProfitController.text,
      'previous year',
    );
  }

  void _validateTwoYearsBackNetProfit() {
    _validateNetProfitAgainstGrossProfit(
      _twoYearsBackNetProfitController.text,
      _twoYearsBackGrossProfitController.text,
      'two years back',
    );
  }

  void _validateNetProfitAgainstGrossProfit(String netProfitText, String grossProfitText, String year) {
    final netProfit = double.tryParse(netProfitText) ?? 0;
    final grossProfit = double.tryParse(grossProfitText) ?? 0;
    
    if (netProfit > grossProfit && grossProfit != 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Warning: Net profit (₹${netProfit.toStringAsFixed(0)}) is higher than gross profit (₹${grossProfit.toStringAsFixed(0)}) for $year. Please verify your entries.',
            ),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    _currentYearRevenueController.dispose();
    _previousYearRevenueController.dispose();
    _twoYearsBackRevenueController.dispose();
    _currentYearProductsController.dispose();
    _previousYearProductsController.dispose();
    _twoYearsBackProductsController.dispose();
    _currentYearQuantityController.dispose();
    _previousYearQuantityController.dispose();
    _twoYearsBackQuantityController.dispose();
    _currentYearQuantityProductsController.dispose();
    _previousYearQuantityProductsController.dispose();
    _twoYearsBackQuantityProductsController.dispose();
    _currentYearRetailRevenueController.dispose();
    _previousYearRetailRevenueController.dispose();
    _twoYearsBackRetailRevenueController.dispose();
    _currentYearRetailProductsController.dispose();
    _previousYearRetailProductsController.dispose();
    _twoYearsBackRetailProductsController.dispose();
    _currentYearWholesaleRevenueController.dispose();
    _previousYearWholesaleRevenueController.dispose();
    _twoYearsBackWholesaleRevenueController.dispose();
    _currentYearWholesaleProductsController.dispose();
    _previousYearWholesaleProductsController.dispose();
    _twoYearsBackWholesaleProductsController.dispose();
    _currentYearInstitutionalRevenueController.dispose();
    _previousYearInstitutionalRevenueController.dispose();
    _twoYearsBackInstitutionalRevenueController.dispose();
    _currentYearInstitutionalProductsController.dispose();
    _previousYearInstitutionalProductsController.dispose();
    _twoYearsBackInstitutionalProductsController.dispose();
    _currentYearCogsController.dispose();
    _previousYearCogsController.dispose();
    _twoYearsBackCogsController.dispose();
    _currentYearGrossProfitController.dispose();
    _previousYearGrossProfitController.dispose();
    _twoYearsBackGrossProfitController.dispose();
    _currentYearNetProfitController.dispose();
    _previousYearNetProfitController.dispose();
    _twoYearsBackNetProfitController.dispose();
    _operatingMarginController.dispose();
    _grossNetProfitMarginDifferenceController.dispose();
    _currentYearShareCapitalController.dispose();
    _previousYearShareCapitalController.dispose();
    _twoYearsBackShareCapitalController.dispose();
    _currentYearShareholdersController.dispose();
    _previousYearShareholdersController.dispose();
    _twoYearsBackShareholdersController.dispose();
    _currentYearAccountsPayableController.dispose();
    _previousYearAccountsPayableController.dispose();
    _twoYearsBackAccountsPayableController.dispose();
    _currentYearAccountsReceivableController.dispose();
    _previousYearAccountsReceivableController.dispose();
    _twoYearsBackAccountsReceivableController.dispose();
    _currentYearOpeningInventoryController.dispose();
    _previousYearOpeningInventoryController.dispose();
    _twoYearsBackOpeningInventoryController.dispose();
    _currentYearClosingInventoryController.dispose();
    _previousYearClosingInventoryController.dispose();
    _twoYearsBackClosingInventoryController.dispose();
    _currentYearProjectGrantController.dispose();
    _previousYearProjectGrantController.dispose();
    _twoYearsBackProjectGrantController.dispose();
    _currentYearMatchingGrantController.dispose();
    _previousYearMatchingGrantController.dispose();
    _twoYearsBackMatchingGrantController.dispose();
    _currentYearAssetsController.dispose();
    _previousYearAssetsController.dispose();
    _twoYearsBackAssetsController.dispose();
    _currentYearLiabilitiesController.dispose();
    _previousYearLiabilitiesController.dispose();
    _twoYearsBackLiabilitiesController.dispose();
    _currentYearCurrentAssetsController.dispose();
    _previousYearCurrentAssetsController.dispose();
    _twoYearsBackCurrentAssetsController.dispose();
    _currentYearCurrentLiabilitiesController.dispose();
    _previousYearCurrentLiabilitiesController.dispose();
    _twoYearsBackCurrentLiabilitiesController.dispose();
    _currentYearLenderNameController.dispose();
    _previousYearLenderNameController.dispose();
    _twoYearsBackLenderNameController.dispose();
    _currentYearLoanAmountController.dispose();
    _previousYearLoanAmountController.dispose();
    _twoYearsBackLoanAmountController.dispose();
    _cashChequePercentageController.dispose();
    _daysPayableReceivableDifferenceController.dispose();
    _totalDebtTodayController.dispose();
    _targetRevenueController.dispose();
    // _institutionalLendingHistoryController is now a String variable, no need to dispose
    _creditDefaultYearController.dispose();
    _creditDefaultLenderController.dispose();
    _creditDefaultAmountController.dispose();
    _loanYearController.dispose();
    _loanLenderNameController.dispose();
    _loanAmountController.dispose();
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
  String get _targetRevenueFY =>
      'FY ${_nextYear.substring(2)}-${(_currentYearInt + 2).toString().substring(2)}';

  // Loan management methods
  void _addLoanEntry() {
    final year = _loanYearController.text.trim();
    final lenderName = _loanLenderNameController.text.trim();
    final amountText = _loanAmountController.text.trim();

    if (year.isEmpty || lenderName.isEmpty || amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all loan details'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }


    final amount = double.tryParse(amountText) ?? 0.0;

    setState(() {
      _loanEntries.add(LoanEntry(
        year: year,
        lenderName: lenderName,
        amount: amount,
      ));
    });

    // Clear form
    _loanYearController.clear();
    _loanLenderNameController.clear();
    _loanAmountController.clear();

    // Recalculate existing lender fields
    _calculateExistingLenderFields();
  }

  void _removeLoanEntry(int index) {
    setState(() {
      _loanEntries.removeAt(index);
    });
    _calculateExistingLenderFields();
  }

  void _calculateExistingLenderFields() {
    // Clear existing fields
    _currentYearLenderNameController.clear();
    _previousYearLenderNameController.clear();
    _twoYearsBackLenderNameController.clear();
    _currentYearLoanAmountController.clear();
    _previousYearLoanAmountController.clear();
    _twoYearsBackLoanAmountController.clear();

    // Find all loans for each year and aggregate
    final currentYearLoans = _loanEntries.where((entry) => entry.year == _currentYear).toList();
    final previousYearLoans = _loanEntries.where((entry) => entry.year == _previousYear).toList();
    final twoYearsBackLoans = _loanEntries.where((entry) => entry.year == _secondPreviousYear).toList();

    // Calculate aggregated values for current year
    if (currentYearLoans.isNotEmpty) {
      final lenderNames = currentYearLoans.map((loan) => loan.lenderName).where((name) => name.isNotEmpty).toList();
      final totalAmount = currentYearLoans.fold(0.0, (sum, loan) => sum + loan.amount);

      _currentYearLenderNameController.text = lenderNames.join(', ');
      _currentYearLoanAmountController.text = totalAmount.toString();
    }

    // Calculate aggregated values for previous year
    if (previousYearLoans.isNotEmpty) {
      final lenderNames = previousYearLoans.map((loan) => loan.lenderName).where((name) => name.isNotEmpty).toList();
      final totalAmount = previousYearLoans.fold(0.0, (sum, loan) => sum + loan.amount);

      _previousYearLenderNameController.text = lenderNames.join(', ');
      _previousYearLoanAmountController.text = totalAmount.toString();
    }

    // Calculate aggregated values for two years back
    if (twoYearsBackLoans.isNotEmpty) {
      final lenderNames = twoYearsBackLoans.map((loan) => loan.lenderName).where((name) => name.isNotEmpty).toList();
      final totalAmount = twoYearsBackLoans.fold(0.0, (sum, loan) => sum + loan.amount);

      _twoYearsBackLenderNameController.text = lenderNames.join(', ');
      _twoYearsBackLoanAmountController.text = totalAmount.toString();
    }
  }

  List<String> get _availableYears {
    return [
      _currentYear,
      _previousYear,
      _secondPreviousYear,
    ];
  }

  Future<void> _loadExistingData() async {
    try {
      debugPrint(
        'Financial Details: Loading existing data for year: ${widget.formYear}',
      );

      final submission = await FormDataService.instance.getSubmission(
        financialYear: widget.formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (submission != null) {
        debugPrint(
          'Financial Details: Submission exists, checking financialDetails...',
        );

        // Load FPO sizes from FPO details for all three years
        if (submission.fpoDetails != null) {
          _fpoSizeFy2324 = submission.fpoDetails!.sizeOfFpoFy2324;
          _fpoSizeFy2223 = submission.fpoDetails!.sizeOfFpoFy2223;
          _fpoSizeFy2122 = submission.fpoDetails!.sizeOfFpoFy2122;

          debugPrint('Financial Details: FPO Size FY23-24: $_fpoSizeFy2324');
          debugPrint('Financial Details: FPO Size FY22-23: $_fpoSizeFy2223');
          debugPrint('Financial Details: FPO Size FY21-22: $_fpoSizeFy2122');

          // Set shareholder fields to respective FPO sizes
          if (_fpoSizeFy2324 != null) {
            _currentYearShareholdersController.text = _fpoSizeFy2324.toString();
          }
          if (_fpoSizeFy2223 != null) {
            _previousYearShareholdersController.text = _fpoSizeFy2223.toString();
          }
          if (_fpoSizeFy2122 != null) {
            _twoYearsBackShareholdersController.text = _fpoSizeFy2122.toString();
          }
        }

        if (submission.financialDetails != null) {
          final financialData = submission.financialDetails!.toJson();
          debugPrint('Financial Details: Financial data found: $financialData');
          debugPrint(financialData.toString());
          await _populateFormFields(financialData);
        } else {
          debugPrint(
            'Financial Details: No financialDetailsV2 found in submission',
          );
        }
      } else {
        debugPrint(
          'Financial Details: No submission found for this financial year',
        );
      }
    } catch (e, stack) {
      debugPrint('Financial Details: Error loading existing data: $e');
      debugPrint('Financial Details: Stack trace: $stack');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Helper function to handle 0 values
  String _getValueText(dynamic value) {
    if (value == null) return '';

    // Handle numeric types directly
    if (value is num) {
      return value == 0 ? '' : value.toString();
    }

    // Handle string types
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.isEmpty) return '';

      final parsed = double.tryParse(trimmed);
      return (parsed != null && parsed == 0) ? '' : trimmed;
    }

    // Handle other types by converting to string first
    final stringValue = value.toString().trim();
    if (stringValue.isEmpty) return '';

    final parsed = double.tryParse(stringValue);
    return (parsed != null && parsed == 0) ? '' : stringValue;
  }

  // Helper method to parse double from controller text
  double _parseControllerValue(TextEditingController controller) {
    final text = controller.text.trim().replaceAll(",", "").replaceAll(" ", "");
    return double.tryParse(text) ?? 0.0;
  }

  // Validation: Check for significant year-to-year variations (more than 50% change)
  List<String> _validateYearToYearVariations() {
    final List<String> warnings = [];

    // Check revenue variations
    final currentRevenue = _parseControllerValue(_currentYearRevenueController);
    final previousRevenue = _parseControllerValue(
      _previousYearRevenueController,
    );
    final twoYearsBackRevenue = _parseControllerValue(
      _twoYearsBackRevenueController,
    );

    if (previousRevenue > 0 && currentRevenue > 0) {
      final revenueChange =
          ((currentRevenue - previousRevenue) / previousRevenue).abs();
      if (revenueChange > 0.5) {
        warnings.add(
          'Revenue variation between ${_secondFY} and ${_thirdFY} is ${(revenueChange * 100).toStringAsFixed(1)}% (more than 50%)',
        );
      }
    }

    if (twoYearsBackRevenue > 0 && previousRevenue > 0) {
      final revenueChange =
          ((previousRevenue - twoYearsBackRevenue) / twoYearsBackRevenue).abs();
      if (revenueChange > 0.5) {
        warnings.add(
          'Revenue variation between ${_firstFY} and ${_secondFY} is ${(revenueChange * 100).toStringAsFixed(1)}% (more than 50%)',
        );
      }
    }

    // Check quantity procured variations
    final currentQuantity = _parseControllerValue(
      _currentYearQuantityController,
    );
    final previousQuantity = _parseControllerValue(
      _previousYearQuantityController,
    );
    final twoYearsBackQuantity = _parseControllerValue(
      _twoYearsBackQuantityController,
    );

    if (previousQuantity > 0 && currentQuantity > 0) {
      final quantityChange =
          ((currentQuantity - previousQuantity) / previousQuantity).abs();
      if (quantityChange > 0.5) {
        warnings.add(
          'Quantity procured variation between ${_secondFY} and ${_thirdFY} is ${(quantityChange * 100).toStringAsFixed(1)}% (more than 50%)',
        );
      }
    }

    if (twoYearsBackQuantity > 0 && previousQuantity > 0) {
      final quantityChange =
          ((previousQuantity - twoYearsBackQuantity) / twoYearsBackQuantity)
              .abs();
      if (quantityChange > 0.5) {
        warnings.add(
          'Quantity procured variation between ${_firstFY} and ${_secondFY} is ${(quantityChange * 100).toStringAsFixed(1)}% (more than 50%)',
        );
      }
    }

    return warnings;
  }

  // Validation: Check Revenue/Quantity ratio makes sense (price per MT)
  List<String> _validateRevenueQuantityRatio() {
    final List<String> warnings = [];

    final currentRevenue = _parseControllerValue(_currentYearRevenueController);
    final currentQuantity = _parseControllerValue(
      _currentYearQuantityController,
    );
    final previousRevenue = _parseControllerValue(
      _previousYearRevenueController,
    );
    final previousQuantity = _parseControllerValue(
      _previousYearQuantityController,
    );
    final twoYearsBackRevenue = _parseControllerValue(
      _twoYearsBackRevenueController,
    );
    final twoYearsBackQuantity = _parseControllerValue(
      _twoYearsBackQuantityController,
    );

    // Check current year
    if (currentRevenue > 0 && currentQuantity > 0) {
      final pricePerMT = currentRevenue / currentQuantity;
      if (pricePerMT < 1000 || pricePerMT > 1000000) {
        warnings.add(
          'Price per metric tonne in ${_thirdFY} is ₹${pricePerMT.toStringAsFixed(2)} - this may not be realistic',
        );
      }
    }

    // Check previous year
    if (previousRevenue > 0 && previousQuantity > 0) {
      final pricePerMT = previousRevenue / previousQuantity;
      if (pricePerMT < 1000 || pricePerMT > 1000000) {
        warnings.add(
          'Price per metric tonne in ${_secondFY} is ₹${pricePerMT.toStringAsFixed(2)} - this may not be realistic',
        );
      }
    }

    // Check two years back
    if (twoYearsBackRevenue > 0 && twoYearsBackQuantity > 0) {
      final pricePerMT = twoYearsBackRevenue / twoYearsBackQuantity;
      if (pricePerMT < 1000 || pricePerMT > 1000000) {
        warnings.add(
          'Price per metric tonne in ${_firstFY} is ₹${pricePerMT.toStringAsFixed(2)} - this may not be realistic',
        );
      }
    }

    return warnings;
  }

  // Validation: Check total buying (retail + wholesale + institutional) <= Revenue
  List<String> _validateTotalBuyingVsRevenue() {
    final List<String> warnings = [];

    // Current year
    final currentRevenue = _parseControllerValue(_currentYearRevenueController);
    final currentRetail = _parseControllerValue(
      _currentYearRetailRevenueController,
    );
    final currentWholesale = _parseControllerValue(
      _currentYearWholesaleRevenueController,
    );
    final currentInstitutional = _parseControllerValue(
      _currentYearInstitutionalRevenueController,
    );
    final currentTotalBuying =
        currentRetail + currentWholesale + currentInstitutional;

    if (currentTotalBuying > currentRevenue) {
      warnings.add(
        'Total buying (₹${currentTotalBuying.toStringAsFixed(2)}) exceeds Revenue (₹${currentRevenue.toStringAsFixed(2)}) in ${_thirdFY}',
      );
    }

    // Previous year
    final previousRevenue = _parseControllerValue(
      _previousYearRevenueController,
    );
    final previousRetail = _parseControllerValue(
      _previousYearRetailRevenueController,
    );
    final previousWholesale = _parseControllerValue(
      _previousYearWholesaleRevenueController,
    );
    final previousInstitutional = _parseControllerValue(
      _previousYearInstitutionalRevenueController,
    );
    final previousTotalBuying =
        previousRetail + previousWholesale + previousInstitutional;

    if (previousTotalBuying > previousRevenue) {
      warnings.add(
        'Total buying (₹${previousTotalBuying.toStringAsFixed(2)}) exceeds Revenue (₹${previousRevenue.toStringAsFixed(2)}) in ${_secondFY}',
      );
    }

    // Two years back
    final twoYearsBackRevenue = _parseControllerValue(
      _twoYearsBackRevenueController,
    );
    final twoYearsBackRetail = _parseControllerValue(
      _twoYearsBackRetailRevenueController,
    );
    final twoYearsBackWholesale = _parseControllerValue(
      _twoYearsBackWholesaleRevenueController,
    );
    final twoYearsBackInstitutional = _parseControllerValue(
      _twoYearsBackInstitutionalRevenueController,
    );
    final twoYearsBackTotalBuying =
        twoYearsBackRetail + twoYearsBackWholesale + twoYearsBackInstitutional;

    if (twoYearsBackTotalBuying > twoYearsBackRevenue) {
      warnings.add(
        'Total buying (₹${twoYearsBackTotalBuying.toStringAsFixed(2)}) exceeds Revenue (₹${twoYearsBackRevenue.toStringAsFixed(2)}) in ${_firstFY}',
      );
    }

    return warnings;
  }

  // Validation: Check COGS vs Revenue ratio makes sense
  List<String> _validateCogsVsRevenue() {
    final List<String> warnings = [];

    // Current year
    final currentRevenue = _parseControllerValue(_currentYearRevenueController);
    final currentCogs = _parseControllerValue(_currentYearCogsController);

    if (currentRevenue > 0 && currentCogs > 0) {
      final cogsRatio = currentCogs / currentRevenue;
      if (cogsRatio < 0.1 || cogsRatio > 0.95) {
        warnings.add(
          'COGS/Revenue ratio in ${_thirdFY} is ${(cogsRatio * 100).toStringAsFixed(1)}% - this may not be realistic',
        );
      }
    }

    // Previous year
    final previousRevenue = _parseControllerValue(
      _previousYearRevenueController,
    );
    final previousCogs = _parseControllerValue(_previousYearCogsController);

    if (previousRevenue > 0 && previousCogs > 0) {
      final cogsRatio = previousCogs / previousRevenue;
      if (cogsRatio < 0.1 || cogsRatio > 0.95) {
        warnings.add(
          'COGS/Revenue ratio in ${_secondFY} is ${(cogsRatio * 100).toStringAsFixed(1)}% - this may not be realistic',
        );
      }
    }

    // Two years back
    final twoYearsBackRevenue = _parseControllerValue(
      _twoYearsBackRevenueController,
    );
    final twoYearsBackCogs = _parseControllerValue(_twoYearsBackCogsController);

    if (twoYearsBackRevenue > 0 && twoYearsBackCogs > 0) {
      final cogsRatio = twoYearsBackCogs / twoYearsBackRevenue;
      if (cogsRatio < 0.1 || cogsRatio > 0.95) {
        warnings.add(
          'COGS/Revenue ratio in ${_firstFY} is ${(cogsRatio * 100).toStringAsFixed(1)}% - this may not be realistic',
        );
      }
    }

    return warnings;
  }

  // Validation: Check Net Profit <= Gross Profit
  List<String> _validateNetProfitVsGrossProfit() {
    final List<String> warnings = [];

    // Current year
    final currentGrossProfit = _parseControllerValue(
      _currentYearGrossProfitController,
    );
    final currentNetProfit = _parseControllerValue(
      _currentYearNetProfitController,
    );

    if (currentNetProfit > currentGrossProfit) {
      warnings.add(
        'Net Profit (₹${currentNetProfit.toStringAsFixed(2)}) exceeds Gross Profit (₹${currentGrossProfit.toStringAsFixed(2)}) in ${_thirdFY}',
      );
    }

    // Previous year
    final previousGrossProfit = _parseControllerValue(
      _previousYearGrossProfitController,
    );
    final previousNetProfit = _parseControllerValue(
      _previousYearNetProfitController,
    );

    if (previousNetProfit > previousGrossProfit) {
      warnings.add(
        'Net Profit (₹${previousNetProfit.toStringAsFixed(2)}) exceeds Gross Profit (₹${previousGrossProfit.toStringAsFixed(2)}) in ${_secondFY}',
      );
    }

    // Two years back
    final twoYearsBackGrossProfit = _parseControllerValue(
      _twoYearsBackGrossProfitController,
    );
    final twoYearsBackNetProfit = _parseControllerValue(
      _twoYearsBackNetProfitController,
    );

    if (twoYearsBackNetProfit > twoYearsBackGrossProfit) {
      warnings.add(
        'Net Profit (₹${twoYearsBackNetProfit.toStringAsFixed(2)}) exceeds Gross Profit (₹${twoYearsBackGrossProfit.toStringAsFixed(2)}) in ${_firstFY}',
      );
    }

    return warnings;
  }

  // Validation: Check Current Assets <= Total Assets
  List<String> _validateCurrentAssetsVsTotalAssets() {
    final List<String> warnings = [];

    // Current year
    final currentAssets = _parseControllerValue(_currentYearAssetsController);
    final currentCurrentAssets = _parseControllerValue(
      _currentYearCurrentAssetsController,
    );

    if (currentCurrentAssets > currentAssets) {
      warnings.add(
        'Current Assets (₹${currentCurrentAssets.toStringAsFixed(2)}) exceed Total Assets (₹${currentAssets.toStringAsFixed(2)}) in ${_thirdFY}',
      );
    }

    // Previous year
    final previousAssets = _parseControllerValue(_previousYearAssetsController);
    final previousCurrentAssets = _parseControllerValue(
      _previousYearCurrentAssetsController,
    );

    if (previousCurrentAssets > previousAssets) {
      warnings.add(
        'Current Assets (₹${previousCurrentAssets.toStringAsFixed(2)}) exceed Total Assets (₹${previousAssets.toStringAsFixed(2)}) in ${_secondFY}',
      );
    }

    // Two years back
    final twoYearsBackAssets = _parseControllerValue(
      _twoYearsBackAssetsController,
    );
    final twoYearsBackCurrentAssets = _parseControllerValue(
      _twoYearsBackCurrentAssetsController,
    );

    if (twoYearsBackCurrentAssets > twoYearsBackAssets) {
      warnings.add(
        'Current Assets (₹${twoYearsBackCurrentAssets.toStringAsFixed(2)}) exceed Total Assets (₹${twoYearsBackAssets.toStringAsFixed(2)}) in ${_firstFY}',
      );
    }

    return warnings;
  }

  // Run all financial validations and return warnings
  List<String> _runAllFinancialValidations() {
    final List<String> allWarnings = [];

    allWarnings.addAll(_validateYearToYearVariations());
    allWarnings.addAll(_validateRevenueQuantityRatio());
    allWarnings.addAll(_validateTotalBuyingVsRevenue());
    allWarnings.addAll(_validateCogsVsRevenue());
    allWarnings.addAll(_validateNetProfitVsGrossProfit());
    allWarnings.addAll(_validateCurrentAssetsVsTotalAssets());

    return allWarnings;
  }

  Future<void> _populateFormFields(Map<String, dynamic> financialData) async {
    if (!mounted) return;

    debugPrint('Financial Details: Populating fields with data...');

    // Debug log product data from server
    debugPrint('Retail Products from server:');
    debugPrint('- Current Year: ${financialData['currentYearRetailProducts']}');
    debugPrint(
      '- Previous Year: ${financialData['previousYearRetailProducts']}',
    );
    debugPrint(
      '- Two Years Back: ${financialData['twoYearsBackRetailProducts']}',
    );

    debugPrint('Wholesale Products from server:');
    debugPrint(
      '- Current Year: ${financialData['currentYearWholesaleProducts']}',
    );
    debugPrint(
      '- Previous Year: ${financialData['previousYearWholesaleProducts']}',
    );
    debugPrint(
      '- Two Years Back: ${financialData['twoYearsBackWholesaleProducts']}',
    );

    debugPrint('Institutional Products from server:');
    debugPrint(
      '- Current Year: ${financialData['currentYearInstitutionalProducts']}',
    );
    debugPrint(
      '- Previous Year: ${financialData['previousYearInstitutionalProducts']}',
    );
    debugPrint(
      '- Two Years Back: ${financialData['twoYearsBackInstitutionalProducts']}',
    );

    setState(() {
      // Revenue data
      _currentYearRevenueController.text = _getValueText(
        financialData['currentYearRevenue'],
      );
      _previousYearRevenueController.text = _getValueText(
        financialData['previousYearRevenue'],
      );
      _twoYearsBackRevenueController.text = _getValueText(
        financialData['twoYearsBackRevenue'],
      );
      _currentYearProductsController.text =
          financialData['currentYearProducts'] ?? '';
      _previousYearProductsController.text =
          financialData['previousYearProducts'] ?? '';
      _twoYearsBackProductsController.text =
          financialData['twoYearsBackProducts'] ?? '';

      // Quantity procured data
      _currentYearQuantityController.text = _getValueText(
        financialData['currentYearQuantityProcured'],
      );
      _previousYearQuantityController.text = _getValueText(
        financialData['previousYearQuantityProcured'],
      );
      _twoYearsBackQuantityController.text = _getValueText(
        financialData['twoYearsBackQuantityProcured'],
      );
      _currentYearQuantityProductsController.text =
          financialData['currentYearProducts'] ?? '';
      _previousYearQuantityProductsController.text =
          financialData['previousYearProducts'] ?? '';
      _twoYearsBackQuantityProductsController.text =
          financialData['twoYearsBackProducts'] ?? '';

      // Retail buying data
      _currentYearRetailRevenueController.text = _getValueText(
        financialData['currentYearRetailRevenue'],
      );
      _previousYearRetailRevenueController.text = _getValueText(
        financialData['previousYearRetailRevenue'],
      );
      _twoYearsBackRetailRevenueController.text = _getValueText(
        financialData['twoYearsBackRetailRevenue'],
      );
      _currentYearRetailProductsController.text =
          financialData['currentYearRetailProducts'] ?? '';
      _previousYearRetailProductsController.text =
          financialData['previousYearRetailProducts'] ?? '';
      _twoYearsBackRetailProductsController.text =
          financialData['twoYearsBackRetailProducts'] ?? '';

      // Wholesale buying data
      _currentYearWholesaleRevenueController.text = _getValueText(
        financialData['currentYearWholesaleRevenue'],
      );
      _previousYearWholesaleRevenueController.text = _getValueText(
        financialData['previousYearWholesaleRevenue'],
      );
      _twoYearsBackWholesaleRevenueController.text = _getValueText(
        financialData['twoYearsBackWholesaleRevenue'],
      );
      _currentYearWholesaleProductsController.text =
          financialData['currentYearWholesaleProducts'] ?? '';
      _previousYearWholesaleProductsController.text =
          financialData['previousYearWholesaleProducts'] ?? '';
      _twoYearsBackWholesaleProductsController.text =
          financialData['twoYearsBackWholesaleProducts'] ?? '';

      // Institutional buying data
      _currentYearInstitutionalRevenueController.text = _getValueText(
        financialData['currentYearInstitutionalRevenue'],
      );
      _previousYearInstitutionalRevenueController.text = _getValueText(
        financialData['previousYearInstitutionalRevenue'],
      );
      _twoYearsBackInstitutionalRevenueController.text = _getValueText(
        financialData['twoYearsBackInstitutionalRevenue'],
      );
      _currentYearInstitutionalProductsController.text =
          financialData['currentYearInstitutionalProducts'] ?? '';
      _previousYearInstitutionalProductsController.text =
          financialData['previousYearInstitutionalProducts'] ?? '';
      _twoYearsBackInstitutionalProductsController.text =
          financialData['twoYearsBackInstitutionalProducts'] ?? '';

      // Cost of goods sold data
      _currentYearCogsController.text = _getValueText(
        financialData['currentYearCogs'],
      );
      _previousYearCogsController.text = _getValueText(
        financialData['previousYearCogs'],
      );
      _twoYearsBackCogsController.text = _getValueText(
        financialData['twoYearsBackCogs'],
      );

      // Profit data
      _currentYearGrossProfitController.text = _getValueText(
        financialData['currentYearGrossProfit'],
      );
      _previousYearGrossProfitController.text = _getValueText(
        financialData['previousYearGrossProfit'],
      );
      _twoYearsBackGrossProfitController.text = _getValueText(
        financialData['twoYearsBackGrossProfit'],
      );
      _currentYearNetProfitController.text = _getValueText(
        financialData['currentYearNetProfit'],
      );
      _previousYearNetProfitController.text = _getValueText(
        financialData['previousYearNetProfit'],
      );
      _twoYearsBackNetProfitController.text = _getValueText(
        financialData['twoYearsBackNetProfit'],
      );

      // Margin data
      _operatingMarginController.text = _getValueText(
        financialData['operatingMarginCurrentYear'],
      );
      _grossNetProfitMarginDifferenceController.text = _getValueText(
        financialData['grossNetProfitMarginDifference'],
      );

      // Share capital data
      _currentYearShareCapitalController.text = _getValueText(
        financialData['currentYearShareCapital'],
      );
      _previousYearShareCapitalController.text = _getValueText(
        financialData['previousYearShareCapital'],
      );
      _twoYearsBackShareCapitalController.text = _getValueText(
        financialData['twoYearsBackShareCapital'],
      );

      // Shareholder fields are populated from FPO size, not from financial data
      // They are already set in _loadExistingData() from submission.fpoDetails.sizeOfFpoFy2324

      // Accounts payable/receivable data
      _currentYearAccountsPayableController.text = _getValueText(
        financialData['currentYearAccountsPayable'],
      );
      _previousYearAccountsPayableController.text = _getValueText(
        financialData['previousYearAccountsPayable'],
      );
      _twoYearsBackAccountsPayableController.text = _getValueText(
        financialData['twoYearsBackAccountsPayable'],
      );
      _currentYearAccountsReceivableController.text = _getValueText(
        financialData['currentYearAccountsReceivable'],
      );
      _previousYearAccountsReceivableController.text = _getValueText(
        financialData['previousYearAccountsReceivable'],
      );
      _twoYearsBackAccountsReceivableController.text = _getValueText(
        financialData['twoYearsBackAccountsReceivable'],
      );

      // Inventory data
      _currentYearOpeningInventoryController.text = _getValueText(
        financialData['currentYearOpeningInventory'],
      );
      _previousYearOpeningInventoryController.text = _getValueText(
        financialData['previousYearOpeningInventory'],
      );
      _twoYearsBackOpeningInventoryController.text = _getValueText(
        financialData['twoYearsBackOpeningInventory'],
      );
      _currentYearClosingInventoryController.text = _getValueText(
        financialData['currentYearClosingInventory'],
      );
      _previousYearClosingInventoryController.text = _getValueText(
        financialData['previousYearClosingInventory'],
      );
      _twoYearsBackClosingInventoryController.text = _getValueText(
        financialData['twoYearsBackClosingInventory'],
      );

      // Grant data
      _currentYearProjectGrantController.text = _getValueText(
        financialData['currentYearProjectGrant'],
      );
      _previousYearProjectGrantController.text = _getValueText(
        financialData['previousYearProjectGrant'],
      );
      _twoYearsBackProjectGrantController.text = _getValueText(
        financialData['twoYearsBackProjectGrant'],
      );
      _currentYearMatchingGrantController.text = _getValueText(
        financialData['currentYearMatchingGrant'],
      );
      _previousYearMatchingGrantController.text = _getValueText(
        financialData['previousYearMatchingGrant'],
      );
      _twoYearsBackMatchingGrantController.text = _getValueText(
        financialData['twoYearsBackMatchingGrant'],
      );

      // Net worth data
      _currentYearAssetsController.text = _getValueText(
        financialData['currentYearAssets'],
      );
      _previousYearAssetsController.text = _getValueText(
        financialData['previousYearAssets'],
      );
      _twoYearsBackAssetsController.text = _getValueText(
        financialData['twoYearsBackAssets'],
      );
      _currentYearLiabilitiesController.text = _getValueText(
        financialData['currentYearLiabilities'],
      );
      _previousYearLiabilitiesController.text = _getValueText(
        financialData['previousYearLiabilities'],
      );
      _twoYearsBackLiabilitiesController.text = _getValueText(
        financialData['twoYearsBackLiabilities'],
      );

      // Current ratio data
      _currentYearCurrentAssetsController.text = _getValueText(
        financialData['currentYearCurrentAssets'],
      );
      _previousYearCurrentAssetsController.text = _getValueText(
        financialData['previousYearCurrentAssets'],
      );
      _twoYearsBackCurrentAssetsController.text = _getValueText(
        financialData['twoYearsBackCurrentAssets'],
      );
      _currentYearCurrentLiabilitiesController.text = _getValueText(
        financialData['currentYearCurrentLiabilities'],
      );
      _previousYearCurrentLiabilitiesController.text = _getValueText(
        financialData['previousYearCurrentLiabilities'],
      );
      _twoYearsBackCurrentLiabilitiesController.text = _getValueText(
        financialData['twoYearsBackCurrentLiabilities'],
      );

      // Credit history data
      _currentYearLenderNameController.text =
          financialData['currentYearLenderName'] ?? '';
      _previousYearLenderNameController.text =
          financialData['previousYearLenderName'] ?? '';
      _twoYearsBackLenderNameController.text =
          financialData['twoYearsBackLenderName'] ?? '';
      _currentYearLoanAmountController.text = _getValueText(
        financialData['currentYearLoanAmount'],
      );
      _previousYearLoanAmountController.text = _getValueText(
        financialData['previousYearLoanAmount'],
      );
      _twoYearsBackLoanAmountController.text = _getValueText(
        financialData['twoYearsBackLoanAmount'],
      );

      // Other financial data
      _cashChequePercentageController.text = _getValueText(
        financialData['cashChequePercentage'],
      );
      _daysPayableReceivableDifferenceController.text = _getValueText(
        financialData['daysPayableReceivableDifference'],
      );
      _totalDebtTodayController.text = _getValueText(
        financialData['totalDebtToday'],
      );
      _targetRevenueController.text = _getValueText(
        financialData['targetRevenue'],
      );
      _institutionalLendingHistoryValue =
          financialData['institutionalLendingHistory'];

      // Credit default data
      _creditDefaultYearController.text =
          financialData['creditDefaultYear'] ?? '';
      _creditDefaultLenderController.text =
          financialData['creditDefaultLender'] ?? '';
      _creditDefaultAmountController.text = _getValueText(
        financialData['creditDefaultAmount'],
      );

      // Load loan details from JSON
      final loanDetailsJson = financialData['loanDetails'];
      if (loanDetailsJson != null && loanDetailsJson is String) {
        try {
          final loanData = json.decode(loanDetailsJson);
          if (loanData is List) {
            _loanEntries.clear();
            for (final loanJson in loanData) {
              if (loanJson is Map<String, dynamic>) {
                _loanEntries.add(LoanEntry.fromJson(loanJson));
              }
            }
            // Recalculate existing lender fields after loading loan data
            _calculateExistingLenderFields();
          }
        } catch (e) {
          debugPrint('Error parsing loanDetails JSON: $e');
        }
      }
    });

    debugPrint('Financial Details: Field population completed');
  }

  Input$FinancialDetailsSubmissionV2Input _extractFormData() {
    // Debug log product data being submitted

    // Convert loan entries to JSON
    final loanDetailsJson = json.encode(
      _loanEntries.map((entry) => entry.toJson()).toList(),
    );

    return Input$FinancialDetailsSubmissionV2Input(
      // Quantity products data
      currentYearQuantityProducts:
          _currentYearQuantityProductsController.text.trim().isEmpty
          ? null
          : _currentYearQuantityProductsController.text.trim(),
      previousYearQuantityProducts:
          _previousYearQuantityProductsController.text.trim().isEmpty
          ? null
          : _previousYearQuantityProductsController.text.trim(),
      twoYearsBackQuantityProducts:
          _twoYearsBackQuantityProductsController.text.trim().isEmpty
          ? null
          : _twoYearsBackQuantityProductsController.text.trim(),
      // Revenue data
      currentYearRevenue:
          (double.tryParse(_currentYearRevenueController.text) ?? 0).toString(),
      previousYearRevenue:
          (double.tryParse(_previousYearRevenueController.text) ?? 0)
              .toString(),
      twoYearsBackRevenue:
          (double.tryParse(_twoYearsBackRevenueController.text) ?? 0)
              .toString(),
      currentYearProducts: _currentYearProductsController.text.trim().isEmpty
          ? null
          : _currentYearProductsController.text.trim(),
      previousYearProducts: _previousYearProductsController.text.trim().isEmpty
          ? null
          : _previousYearProductsController.text.trim(),
      twoYearsBackProducts: _twoYearsBackProductsController.text.trim().isEmpty
          ? null
          : _twoYearsBackProductsController.text.trim(),

      // Quantity procured data
      currentYearQuantityProcured:
          (double.tryParse(_currentYearQuantityController.text) ?? 0)
              .toString(),
      previousYearQuantityProcured:
          (double.tryParse(_previousYearQuantityController.text) ?? 0)
              .toString(),
      twoYearsBackQuantityProcured:
          (double.tryParse(_twoYearsBackQuantityController.text) ?? 0)
              .toString(),

      // Retail buying data
      currentYearRetailRevenue:
          (double.tryParse(_currentYearRetailRevenueController.text) ?? 0)
              .toString(),
      previousYearRetailRevenue:
          (double.tryParse(_previousYearRetailRevenueController.text) ?? 0)
              .toString(),
      twoYearsBackRetailRevenue:
          (double.tryParse(_twoYearsBackRetailRevenueController.text) ?? 0)
              .toString(),
      currentYearRetailProducts:
          _currentYearRetailProductsController.text.trim().isEmpty
          ? null
          : _currentYearRetailProductsController.text.trim(),
      previousYearRetailProducts:
          _previousYearRetailProductsController.text.trim().isEmpty
          ? null
          : _previousYearRetailProductsController.text.trim(),
      twoYearsBackRetailProducts:
          _twoYearsBackRetailProductsController.text.trim().isEmpty
          ? null
          : _twoYearsBackRetailProductsController.text.trim(),

      // Wholesale buying data
      currentYearWholesaleRevenue:
          (double.tryParse(_currentYearWholesaleRevenueController.text) ?? 0)
              .toString(),
      previousYearWholesaleRevenue:
          (double.tryParse(_previousYearWholesaleRevenueController.text) ?? 0)
              .toString(),
      twoYearsBackWholesaleRevenue:
          (double.tryParse(_twoYearsBackWholesaleRevenueController.text) ?? 0)
              .toString(),
      currentYearWholesaleProducts:
          _currentYearWholesaleProductsController.text.trim().isEmpty
          ? null
          : _currentYearWholesaleProductsController.text.trim(),
      previousYearWholesaleProducts:
          _previousYearWholesaleProductsController.text.trim().isEmpty
          ? null
          : _previousYearWholesaleProductsController.text.trim(),
      twoYearsBackWholesaleProducts:
          _twoYearsBackWholesaleProductsController.text.trim().isEmpty
          ? null
          : _twoYearsBackWholesaleProductsController.text.trim(),

      // Institutional buying data
      currentYearInstitutionalRevenue:
          (double.tryParse(_currentYearInstitutionalRevenueController.text) ??
                  0)
              .toString(),
      previousYearInstitutionalRevenue:
          (double.tryParse(_previousYearInstitutionalRevenueController.text) ??
                  0)
              .toString(),
      twoYearsBackInstitutionalRevenue:
          (double.tryParse(_twoYearsBackInstitutionalRevenueController.text) ??
                  0)
              .toString(),
      currentYearInstitutionalProducts:
          _currentYearInstitutionalProductsController.text.trim().isEmpty
          ? null
          : _currentYearInstitutionalProductsController.text.trim(),
      previousYearInstitutionalProducts:
          _previousYearInstitutionalProductsController.text.trim().isEmpty
          ? null
          : _previousYearInstitutionalProductsController.text.trim(),
      twoYearsBackInstitutionalProducts:
          _twoYearsBackInstitutionalProductsController.text.trim().isEmpty
          ? null
          : _twoYearsBackInstitutionalProductsController.text.trim(),

      // Cost of goods sold data
      currentYearCogs: (double.tryParse(_currentYearCogsController.text) ?? 0)
          .toString(),
      previousYearCogs: (double.tryParse(_previousYearCogsController.text) ?? 0)
          .toString(),
      twoYearsBackCogs: (double.tryParse(_twoYearsBackCogsController.text) ?? 0)
          .toString(),

      // Profit data
      currentYearGrossProfit:
          (double.tryParse(_currentYearGrossProfitController.text) ?? 0)
              .toString(),
      previousYearGrossProfit:
          (double.tryParse(_previousYearGrossProfitController.text) ?? 0)
              .toString(),
      twoYearsBackGrossProfit:
          (double.tryParse(_twoYearsBackGrossProfitController.text) ?? 0)
              .toString(),
      currentYearNetProfit:
          (double.tryParse(_currentYearNetProfitController.text) ?? 0)
              .toString(),
      previousYearNetProfit:
          (double.tryParse(_previousYearNetProfitController.text) ?? 0)
              .toString(),
      twoYearsBackNetProfit:
          (double.tryParse(_twoYearsBackNetProfitController.text) ?? 0)
              .toString(),

      // Margin data
      operatingMarginCurrentYear:
          (double.tryParse(_operatingMarginController.text) ?? 0).toString(),
      grossNetProfitMarginDifference:
          (double.tryParse(_grossNetProfitMarginDifferenceController.text) ?? 0)
              .toString(),

      // Share capital data
      currentYearShareCapital:
          (double.tryParse(_currentYearShareCapitalController.text) ?? 0)
              .toString(),
      previousYearShareCapital:
          (double.tryParse(_previousYearShareCapitalController.text) ?? 0)
              .toString(),
      twoYearsBackShareCapital:
          (double.tryParse(_twoYearsBackShareCapitalController.text) ?? 0)
              .toString(),
      currentYearShareholders:
          int.tryParse(_currentYearShareholdersController.text) ?? 0,
      previousYearShareholders:
          int.tryParse(_previousYearShareholdersController.text) ?? 0,
      twoYearsBackShareholders:
          int.tryParse(_twoYearsBackShareholdersController.text) ?? 0,

      // Accounts payable/receivable data
      currentYearAccountsPayable:
          (double.tryParse(_currentYearAccountsPayableController.text) ?? 0)
              .toString(),
      previousYearAccountsPayable:
          (double.tryParse(_previousYearAccountsPayableController.text) ?? 0)
              .toString(),
      twoYearsBackAccountsPayable:
          (double.tryParse(_twoYearsBackAccountsPayableController.text) ?? 0)
              .toString(),
      currentYearAccountsReceivable:
          (double.tryParse(_currentYearAccountsReceivableController.text) ?? 0)
              .toString(),
      previousYearAccountsReceivable:
          (double.tryParse(_previousYearAccountsReceivableController.text) ?? 0)
              .toString(),
      twoYearsBackAccountsReceivable:
          (double.tryParse(_twoYearsBackAccountsReceivableController.text) ?? 0)
              .toString(),

      // Inventory data
      currentYearOpeningInventory:
          (double.tryParse(_currentYearOpeningInventoryController.text) ?? 0)
              .toString(),
      previousYearOpeningInventory:
          (double.tryParse(_previousYearOpeningInventoryController.text) ?? 0)
              .toString(),
      twoYearsBackOpeningInventory:
          (double.tryParse(_twoYearsBackOpeningInventoryController.text) ?? 0)
              .toString(),
      currentYearClosingInventory:
          (double.tryParse(_currentYearClosingInventoryController.text) ?? 0)
              .toString(),
      previousYearClosingInventory:
          (double.tryParse(_previousYearClosingInventoryController.text) ?? 0)
              .toString(),
      twoYearsBackClosingInventory:
          (double.tryParse(_twoYearsBackClosingInventoryController.text) ?? 0)
              .toString(),

      // Grant data
      currentYearProjectGrant:
          (double.tryParse(_currentYearProjectGrantController.text) ?? 0)
              .toString(),
      previousYearProjectGrant:
          (double.tryParse(_previousYearProjectGrantController.text) ?? 0)
              .toString(),
      twoYearsBackProjectGrant:
          (double.tryParse(_twoYearsBackProjectGrantController.text) ?? 0)
              .toString(),
      currentYearMatchingGrant:
          (double.tryParse(_currentYearMatchingGrantController.text) ?? 0)
              .toString(),
      previousYearMatchingGrant:
          (double.tryParse(_previousYearMatchingGrantController.text) ?? 0)
              .toString(),
      twoYearsBackMatchingGrant:
          (double.tryParse(_twoYearsBackMatchingGrantController.text) ?? 0)
              .toString(),

      // Net worth data
      currentYearAssets:
          (double.tryParse(_currentYearAssetsController.text) ?? 0).toString(),
      previousYearAssets:
          (double.tryParse(_previousYearAssetsController.text) ?? 0).toString(),
      twoYearsBackAssets:
          (double.tryParse(_twoYearsBackAssetsController.text) ?? 0).toString(),
      currentYearLiabilities:
          (double.tryParse(_currentYearLiabilitiesController.text) ?? 0)
              .toString(),
      previousYearLiabilities:
          (double.tryParse(_previousYearLiabilitiesController.text) ?? 0)
              .toString(),
      twoYearsBackLiabilities:
          (double.tryParse(_twoYearsBackLiabilitiesController.text) ?? 0)
              .toString(),

      // Current ratio data
      currentYearCurrentAssets:
          (double.tryParse(_currentYearCurrentAssetsController.text) ?? 0)
              .toString(),
      previousYearCurrentAssets:
          (double.tryParse(_previousYearCurrentAssetsController.text) ?? 0)
              .toString(),
      twoYearsBackCurrentAssets:
          (double.tryParse(_twoYearsBackCurrentAssetsController.text) ?? 0)
              .toString(),
      currentYearCurrentLiabilities:
          (double.tryParse(_currentYearCurrentLiabilitiesController.text) ?? 0)
              .toString(),
      previousYearCurrentLiabilities:
          (double.tryParse(_previousYearCurrentLiabilitiesController.text) ?? 0)
              .toString(),
      twoYearsBackCurrentLiabilities:
          (double.tryParse(_twoYearsBackCurrentLiabilitiesController.text) ?? 0)
              .toString(),

      // Credit history data - lender names are strings, loan amounts are decimals
      currentYearLenderName:
          _currentYearLenderNameController.text.trim().isEmpty
          ? null
          : _currentYearLenderNameController.text.trim(),
      previousYearLenderName:
          _previousYearLenderNameController.text.trim().isEmpty
          ? null
          : _previousYearLenderNameController.text.trim(),
      twoYearsBackLenderName:
          _twoYearsBackLenderNameController.text.trim().isEmpty
          ? null
          : _twoYearsBackLenderNameController.text.trim(),
      currentYearLoanAmount:
          (double.tryParse(_currentYearLoanAmountController.text) ?? 0)
              .toString(),
      previousYearLoanAmount:
          (double.tryParse(_previousYearLoanAmountController.text) ?? 0)
              .toString(),
      twoYearsBackLoanAmount:
          (double.tryParse(_twoYearsBackLoanAmountController.text) ?? 0)
              .toString(),

      // Other financial data
      cashChequePercentage:
          (double.tryParse(_cashChequePercentageController.text) ?? 0)
              .toString(),
      daysPayableReceivableDifference:
          int.tryParse(_daysPayableReceivableDifferenceController.text) ?? 0,
      totalDebtToday: (double.tryParse(_totalDebtTodayController.text) ?? 0)
          .toString(),
      targetRevenue: (double.tryParse(_targetRevenueController.text) ?? 0)
          .toString(),
      institutionalLendingHistory: _institutionalLendingHistoryValue,

      // Credit default data - year and lender are strings, amount is decimal
      creditDefaultYear: _creditDefaultYearController.text.trim().isEmpty
          ? null
          : _creditDefaultYearController.text.trim(),
      creditDefaultLender: _creditDefaultLenderController.text.trim().isEmpty
          ? null
          : _creditDefaultLenderController.text.trim(),
      creditDefaultAmount:
          (double.tryParse(_creditDefaultAmountController.text) ?? 0)
              .toString(),

      // Loan details data
      loanDetails: loanDetailsJson,
    );
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

  // Show validation warnings dialog
  Future<bool> _showValidationWarnings(List<String> warnings) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Financial Validation Warnings',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The following potential issues were detected:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...warnings
                        .map(
                          (warning) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              '• $warning',
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    const SizedBox(height: 16),
                    Text(
                      'Please review these values before proceeding.',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  child: Text('Proceed Anyway'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<bool> _submitForm() async {
    if (_isSubmitting) return false;

    // Basic validation - check required fields
    String? firstMissingField;
    String fieldName = '';

    if (_currentYearRevenueController.text.trim().isEmpty) {
      firstMissingField = 'revenue_current_year';
      fieldName = 'Current Year Revenue';
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

    // Run financial validations
    final validationWarnings = _runAllFinancialValidations();
    if (validationWarnings.isNotEmpty) {
      final proceed = await _showValidationWarnings(validationWarnings);
      if (proceed != true) {
        return false; // User chose to cancel
      }
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final financialDetailsInput = _extractFormData();
      debugPrint(
        'Financial Details: Submitting form data: $financialDetailsInput',
      );

      final result = await FormDataService.instance.submitFinancialDetails(
        financialYear: widget.formYear,
        financialDataInput: financialDetailsInput,
        fpoId: AuthService.instance.currentFpoId!,
      );

      debugPrint('Financial Details: Submit result: $result');

      if (result?.success == true) {
        debugPrint('Financial Details: Form submitted successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Financial details submitted successfully!'),
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
      debugPrint('Financial Details: Form submission error: $e');
      debugPrint('Financial Details: Stack trace: $stack');
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

  Widget _buildTextFieldWithLabel({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.number,
    bool isRequired = false,
    String? fieldKey,
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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: showVoiceInput
              ? VoiceInputWidget(
                  controller: controller,
                  hintText: hintText,
                  maxLines: 1,
                  keyboardType: keyboardType,
                  showLanguageSelector: false,
                  showMicAlways: false,
                  onTextChanged: (text) {
                    controller.text = text;
                  },
                )
              : TextField(
                  controller: controller,
                  maxLines: 1,
                  keyboardType: keyboardType,
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
                ),
        ),
      ],
    );
  }

  Widget _buildDropdownWithLabel({
    required String label,
    required String? value,
    required ValueChanged<String?> onChanged,
    required List<DropdownMenuItem<String>> items,
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
          child: DropdownButtonFormField<String>(
            value:
                items
                    .map((res) {
                      return res.value;
                    })
                    .contains(value)
                ? value
                : null,
            onChanged: onChanged,
            items: items,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialYearSection({
    required String title,
    required String firstYear,
    required String secondYear,
    required String thirdYear,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Text(
                firstYear,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Text(
                secondYear,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Text(
                thirdYear,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildThreeColumnField({
    required String label,
    required TextEditingController firstYearController,
    required TextEditingController secondYearController,
    required TextEditingController thirdYearController,
    required String hintText,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.number,
    bool showVoiceInput = true,
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
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: showVoiceInput
                    ? VoiceInputWidget(
                        controller: firstYearController,
                        hintText: hintText,
                        maxLines: 1,
                        showMicAlways: false,
                        keyboardType: keyboardType,
                        showLanguageSelector: false,
                        onTextChanged: (text) {
                          firstYearController.text = text;
                        },
                      )
                    : TextField(
                        controller: firstYearController,
                        maxLines: 1,
                        keyboardType: keyboardType,
                        inputFormatters: (keyboardType == TextInputType.number)
                            ? [SignedNumberFormatter()]
                            : [],
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: showVoiceInput
                    ? VoiceInputWidget(
                        controller: secondYearController,
                        hintText: hintText,
                        maxLines: 1,
                        showMicAlways: false,
                        keyboardType: keyboardType,
                        showLanguageSelector: false,
                        onTextChanged: (text) {
                          secondYearController.text = text;
                        },
                      )
                    : TextField(
                        controller: secondYearController,
                        maxLines: 1,
                        keyboardType: keyboardType,
                        inputFormatters: (keyboardType == TextInputType.number)
                            ? [SignedNumberFormatter()]
                            : [],
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: showVoiceInput
                    ? VoiceInputWidget(
                        controller: thirdYearController,
                        hintText: hintText,
                        maxLines: 1,
                        showMicAlways: false,
                        keyboardType: keyboardType,
                        showLanguageSelector: false,
                        onTextChanged: (text) {
                          thirdYearController.text = text;
                        },
                      )
                    : TextField(
                        controller: thirdYearController,
                        maxLines: 1,
                        keyboardType: keyboardType,
                        inputFormatters: (keyboardType == TextInputType.number)
                            ? [SignedNumberFormatter()]
                            : [],
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGrossProfitDisplayField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gross Profit (INR)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // First year (two years back)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  _twoYearsBackGrossProfitController.text.isEmpty 
                      ? 'Auto-calculated'
                      : _formatCurrency(_twoYearsBackGrossProfitController.text),
                  style: TextStyle(
                    fontSize: 15,
                    color: _twoYearsBackGrossProfitController.text.isEmpty 
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: _twoYearsBackGrossProfitController.text.isEmpty 
                        ? FontWeight.normal 
                        : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Second year (previous year)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  _previousYearGrossProfitController.text.isEmpty 
                      ? 'Auto-calculated'
                      : _formatCurrency(_previousYearGrossProfitController.text),
                  style: TextStyle(
                    fontSize: 15,
                    color: _previousYearGrossProfitController.text.isEmpty 
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: _previousYearGrossProfitController.text.isEmpty 
                        ? FontWeight.normal 
                        : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Third year (current year)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Text(
                  _currentYearGrossProfitController.text.isEmpty 
                      ? 'Auto-calculated'
                      : _formatCurrency(_currentYearGrossProfitController.text),
                  style: TextStyle(
                    fontSize: 15,
                    color: _currentYearGrossProfitController.text.isEmpty 
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: _currentYearGrossProfitController.text.isEmpty 
                        ? FontWeight.normal 
                        : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThreeColumnDisplayField({
    required String label,
    required String firstYearText,
    required String secondYearText,
    required String thirdYearText,
    required String placeholder,
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
            // First year (two years back)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  // border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                ),
                child: Text(
                  firstYearText.isEmpty ? placeholder : firstYearText,
                  style: TextStyle(
                    fontSize: 15,
                    color: firstYearText.isEmpty
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: firstYearText.isEmpty ? FontWeight.normal : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Second year (previous year)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  // border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                ),
                child: Text(
                  secondYearText.isEmpty ? placeholder : secondYearText,
                  style: TextStyle(
                    fontSize: 15,
                    color: secondYearText.isEmpty
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: secondYearText.isEmpty ? FontWeight.normal : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Third year (current year)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  // border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                ),
                child: Text(
                  thirdYearText.isEmpty ? placeholder : thirdYearText,
                  style: TextStyle(
                    fontSize: 15,
                    color: thirdYearText.isEmpty
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: thirdYearText.isEmpty ? FontWeight.normal : FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatCurrency(String value) {
    final number = double.tryParse(value) ?? 0;
    if (number >= 10000000) {
      return '₹${(number / 10000000).toStringAsFixed(1)} Cr';
    } else if (number >= 100000) {
      return '₹${(number / 100000).toStringAsFixed(1)} L';
    } else if (number >= 1000) {
      return '₹${(number / 1000).toStringAsFixed(1)} K';
    }
    return '₹${number.toStringAsFixed(0)}';
  }

  Widget _buildLoanManagementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOAN DETAILS MANAGEMENT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),

        // Add Loan Form
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Loan Entry',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),

              // Year Dropdown
              _buildDropdownWithLabel(
                label: 'Financial Year',
                value: _loanYearController.text.isEmpty ? null : _loanYearController.text,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _loanYearController.text = newValue;
                    });
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text('Select year'),
                  ),
                  ..._availableYears.map((year) {
                    final formattedYear = year.length == 4
                        ? 'FY ${year.substring(2)}-${(int.parse(year) + 1).toString().substring(2)}'
                        : year;
                    return DropdownMenuItem(
                      value: year,
                      child: Text(formattedYear),
                    );
                  }).toList(),
                ],
              ),
              const SizedBox(height: 16),

              // Lender Name
              _buildTextFieldWithLabel(
                label: 'Lender Name',
                controller: _loanLenderNameController,
                hintText: 'Enter lender name',
                keyboardType: TextInputType.text,
                showVoiceInput: false,
              ),
              const SizedBox(height: 16),

              // Loan Amount
              _buildTextFieldWithLabel(
                label: 'Loan Amount (INR)',
                controller: _loanAmountController,
                hintText: 'Enter loan amount',
                showVoiceInput: false,
              ),
              const SizedBox(height: 16),

              // Add Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addLoanEntry,
                  child: Text('Add Loan Entry'),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Existing Loans List
        if (_loanEntries.isNotEmpty) ...[
          Text(
            'Existing Loan Entries',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          ..._loanEntries.asMap().entries.map((entry) {
            final index = entry.key;
            final loan = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Year: ${loan.formattedYear}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('Lender: ${loan.lenderName}'),
                        Text('Amount: ₹${loan.amount.toStringAsFixed(0)}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                    onPressed: () => _removeLoanEntry(index),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          // Show aggregated summary
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                ..._availableYears.map((year) {
                  final loans = _loanEntries.where((entry) => entry.year == year).toList();
                  if (loans.isEmpty) return const SizedBox.shrink();

                  final totalAmount = loans.fold(0.0, (sum, loan) => sum + loan.amount);
                  final lenderNames = loans.map((loan) => loan.lenderName).where((name) => name.isNotEmpty).toList();
                  final formattedYear = year.length == 4
                      ? 'FY ${year.substring(2)}-${(int.parse(year) + 1).toString().substring(2)}'
                      : year;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '$formattedYear: ${lenderNames.join(', ')} - ₹${totalAmount.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
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
                      'Loading financial data...',
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
                                    'Financial Information',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    'Financial Details Input',
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
                              '8/9',
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
                            widthFactor: 0.888, // 8/9 = 88.8%
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
                          // Revenue Section
                          _buildFinancialYearSection(
                            title: 'REVENUE OF LAST 3 FINANCIAL YEARS (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Revenue (INR)',
                                firstYearController:
                                    _twoYearsBackRevenueController,
                                secondYearController:
                                    _previousYearRevenueController,
                                thirdYearController:
                                    _currentYearRevenueController,
                                hintText: '0',
                                isRequired: true,
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Name of the products',
                                firstYearController:
                                    _twoYearsBackProductsController,
                                secondYearController:
                                    _previousYearProductsController,
                                thirdYearController:
                                    _currentYearProductsController,
                                hintText: 'Enter product names',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Target Revenue
                          Text(
                            'TARGET FOR THE REVENUE',
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
                          _buildTextFieldWithLabel(
                            label: 'Target Revenue (INR) $_targetRevenueFY',
                            controller: _targetRevenueController,
                            hintText: 'Enter target revenue',
                          ),

                          const SizedBox(height: 32),

                          // Quantity Procured Section
                          _buildFinancialYearSection(
                            title: 'QUANTITY PROCURED (METRIC TONNE)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Quantity procured (Metric tonne)',
                                firstYearController:
                                    _twoYearsBackQuantityController,
                                secondYearController:
                                    _previousYearQuantityController,
                                thirdYearController:
                                    _currentYearQuantityController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Name of the products',
                                firstYearController:
                                    _twoYearsBackQuantityProductsController,
                                secondYearController:
                                    _previousYearQuantityProductsController,
                                thirdYearController:
                                    _currentYearQuantityProductsController,
                                hintText: 'Enter product names',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Retail Buying Section
                          _buildFinancialYearSection(
                            title:
                                'DETAILS OF RETAIL BUYING OF LAST 3 FINANCIAL YEARS',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Revenue (INR)',
                                firstYearController:
                                    _twoYearsBackRetailRevenueController,
                                secondYearController:
                                    _previousYearRetailRevenueController,
                                thirdYearController:
                                    _currentYearRetailRevenueController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Name of the products',
                                firstYearController:
                                    _twoYearsBackRetailProductsController,
                                secondYearController:
                                    _previousYearRetailProductsController,
                                thirdYearController:
                                    _currentYearRetailProductsController,
                                hintText: 'Enter product names',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Wholesale Buying Section
                          _buildFinancialYearSection(
                            title:
                                'DETAILS OF WHOLESALE BUYING OF LAST 3 FINANCIAL YEARS',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Revenue (INR)',
                                firstYearController:
                                    _twoYearsBackWholesaleRevenueController,
                                secondYearController:
                                    _previousYearWholesaleRevenueController,
                                thirdYearController:
                                    _currentYearWholesaleRevenueController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Name of the products',
                                firstYearController:
                                    _twoYearsBackWholesaleProductsController,
                                secondYearController:
                                    _previousYearWholesaleProductsController,
                                thirdYearController:
                                    _currentYearWholesaleProductsController,
                                hintText: 'Enter product names',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Institutional Buying Section
                          _buildFinancialYearSection(
                            title:
                                'DETAILS OF INSTITUTIONAL BUYING OF LAST 3 FINANCIAL YEARS (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Revenue (INR)',
                                firstYearController:
                                    _twoYearsBackInstitutionalRevenueController,
                                secondYearController:
                                    _previousYearInstitutionalRevenueController,
                                thirdYearController:
                                    _currentYearInstitutionalRevenueController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Name of the products',
                                firstYearController:
                                    _twoYearsBackInstitutionalProductsController,
                                secondYearController:
                                    _previousYearInstitutionalProductsController,
                                thirdYearController:
                                    _currentYearInstitutionalProductsController,
                                hintText: 'Enter product names',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Cost of Goods Sold Section
                          _buildFinancialYearSection(
                            title: 'COST OF GOODS SOLD (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Cost of Goods Sold (INR)',
                                firstYearController:
                                    _twoYearsBackCogsController,
                                secondYearController:
                                    _previousYearCogsController,
                                thirdYearController: _currentYearCogsController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Profit Section
                          _buildFinancialYearSection(
                            title:
                                'GROSS PROFIT/[LOSS], NET PROFIT/[LOSS] AND OPERATING PROFIT/[LOSS] OF LAST 3 FINANCIALS YEARS (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildGrossProfitDisplayField(),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Net Profit (INR)',
                                firstYearController:
                                    _twoYearsBackNetProfitController,
                                secondYearController:
                                    _previousYearNetProfitController,
                                thirdYearController:
                                    _currentYearNetProfitController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label: 'Operating Margin (Current Year)',
                            controller: _operatingMarginController,
                            hintText: 'Enter percentage',
                          ),
                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label:
                                'Difference between Gross Profit Margin and Net Profit Margin (Current Year)',
                            controller:
                                _grossNetProfitMarginDifferenceController,
                            hintText: 'Enter percentage',
                          ),

                          const SizedBox(height: 32),

                          // Share Capital Section
                          _buildFinancialYearSection(
                            title:
                                'SHARE CAPITAL AND RESERVES OF LAST 3 FINANCIAL YEARS',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Share capital (INR)',
                                firstYearController:
                                    _twoYearsBackShareCapitalController,
                                secondYearController:
                                    _previousYearShareCapitalController,
                                thirdYearController:
                                    _currentYearShareCapitalController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnDisplayField(
                                label: 'No of share holders (from Size of FPO)',
                                firstYearText: _fpoSizeFy2122?.toString() ?? '',
                                secondYearText: _fpoSizeFy2223?.toString() ?? '',
                                thirdYearText: _fpoSizeFy2324?.toString() ?? '',
                                placeholder: 'Not available',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Accounts Payable/Receivable Section
                          _buildFinancialYearSection(
                            title: 'ACCOUNTS PAYABLE/ACCOUNTS RECEIVABLE (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Accounts Payable (INR)',
                                firstYearController:
                                    _twoYearsBackAccountsPayableController,
                                secondYearController:
                                    _previousYearAccountsPayableController,
                                thirdYearController:
                                    _currentYearAccountsPayableController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Accounts Receivable (INR)',
                                firstYearController:
                                    _twoYearsBackAccountsReceivableController,
                                secondYearController:
                                    _previousYearAccountsReceivableController,
                                thirdYearController:
                                    _currentYearAccountsReceivableController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Inventory Section
                          _buildFinancialYearSection(
                            title: 'INVENTORY (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Opening Inventory (INR)',
                                firstYearController:
                                    _twoYearsBackOpeningInventoryController,
                                secondYearController:
                                    _previousYearOpeningInventoryController,
                                thirdYearController:
                                    _currentYearOpeningInventoryController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Closing Inventory (INR)',
                                firstYearController:
                                    _twoYearsBackClosingInventoryController,
                                secondYearController:
                                    _previousYearClosingInventoryController,
                                thirdYearController:
                                    _currentYearClosingInventoryController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Grant Details Section
                          _buildFinancialYearSection(
                            title: 'GRANT DETAILS',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Project Grant (INR)',
                                firstYearController:
                                    _twoYearsBackProjectGrantController,
                                secondYearController:
                                    _previousYearProjectGrantController,
                                thirdYearController:
                                    _currentYearProjectGrantController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Matching Grant (INR)',
                                firstYearController:
                                    _twoYearsBackMatchingGrantController,
                                secondYearController:
                                    _previousYearMatchingGrantController,
                                thirdYearController:
                                    _currentYearMatchingGrantController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Net Worth Section
                          _buildFinancialYearSection(
                            title: 'NET WORTH OF LAST 3 FINANCIAL YEARS (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Assets (INR)',
                                firstYearController:
                                    _twoYearsBackAssetsController,
                                secondYearController:
                                    _previousYearAssetsController,
                                thirdYearController:
                                    _currentYearAssetsController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Liability (INR)',
                                firstYearController:
                                    _twoYearsBackLiabilitiesController,
                                secondYearController:
                                    _previousYearLiabilitiesController,
                                thirdYearController:
                                    _currentYearLiabilitiesController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Current Ratio Section
                          _buildFinancialYearSection(
                            title: 'CURRENT RATIO (E)',
                            firstYear: _firstFY,
                            secondYear: _secondFY,
                            thirdYear: _thirdFY,
                            children: [
                              _buildThreeColumnField(
                                label: 'Current Assets (INR)',
                                firstYearController:
                                    _twoYearsBackCurrentAssetsController,
                                secondYearController:
                                    _previousYearCurrentAssetsController,
                                thirdYearController:
                                    _currentYearCurrentAssetsController,
                                hintText: '0',
                              ),
                              const SizedBox(height: 16),
                              _buildThreeColumnField(
                                label: 'Current Liability (INR)',
                                firstYearController:
                                    _twoYearsBackCurrentLiabilitiesController,
                                secondYearController:
                                    _previousYearCurrentLiabilitiesController,
                                thirdYearController:
                                    _currentYearCurrentLiabilitiesController,
                                hintText: '0',
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Loan Details Management Section
                          _buildLoanManagementSection(),

                          const SizedBox(height: 32),

                          // Other Financial Fields
                          Text(
                            'OTHER FINANCIAL DETAILS',
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
                          _buildTextFieldWithLabel(
                            label:
                                'Cash/Cheque dealing as a % of total revenue (E)',
                            controller: _cashChequePercentageController,
                            hintText: 'Enter percentage',
                          ),
                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label:
                                'Difference in Days Accounts Payable and Days Accounts Receivable (Current Year)',
                            controller:
                                _daysPayableReceivableDifferenceController,
                            hintText: 'Enter days',
                          ),
                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label: 'Total debt as of today (INR)',
                            controller: _totalDebtTodayController,
                            hintText: 'Enter amount',
                          ),
                          const SizedBox(height: 16),
                          _buildDropdownWithLabel(
                            label:
                                'History of Institutional Lending in last 2 financial years',
                            value:
                                [
                                  "No history of institutional lending",
                                  "atleast 1 institutional lending in last 2 financial year",
                                  "History Repeated lending from any institutional lenders in last 2 financial years",
                                ].contains(_institutionalLendingHistoryValue)
                                ? _institutionalLendingHistoryValue
                                : null,
                            onChanged: (String? newValue) {
                              setState(() {
                                _institutionalLendingHistoryValue = newValue;
                              });
                            },
                            items: const [
                              DropdownMenuItem(
                                value: null,
                                child: Text('Select lending history'),
                              ),
                              DropdownMenuItem(
                                value: 'No history of institutional lending',
                                child: Text(
                                  'No history of institutional lending',
                                ),
                              ),
                              DropdownMenuItem(
                                value:
                                    'atleast 1 institutional lending in last 2 financial year',
                                child: Text(
                                  'atleast 1 institutional lending in last 2 financial year',
                                ),
                              ),
                              DropdownMenuItem(
                                value:
                                    'History Repeated lending from any institutional lenders in last 2 financial years',
                                child: Text(
                                  'History Repeated lending from any institutional lenders in last 2 financial years',
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // Credit Default Section
                          Text(
                            'HISTORY OF CREDIT DEFAULTS, IF ANY',
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
                          _buildTextFieldWithLabel(
                            label: 'Year of credit default',
                            controller: _creditDefaultYearController,
                            hintText: 'Enter year',
                          ),
                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label: 'Name of the lender for credit default',
                            controller: _creditDefaultLenderController,
                            hintText: 'Enter lender name',
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 16),
                          _buildTextFieldWithLabel(
                            label: 'Credit default loan amount (INR)',
                            controller: _creditDefaultAmountController,
                            hintText: 'Enter amount',
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
}

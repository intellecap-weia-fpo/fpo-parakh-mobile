import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormNavigationHelper {
  static const Map<int, String> stepTitles = {
    1: 'FPO Details',
    2: 'Governance',
    3: 'CEO Profile',
    4: 'Board of Directors',
    5: 'Business Operations',
    6: 'Compliances',
    7: 'Processes & Systems',
    8: 'Financial Details',
    9: 'Sustainable Activities',
  };

  static void navigateToNextStep(
    BuildContext context,
    String formYear,
    int currentStep, {
    String? secondLineManagement,
  }) {
    if (currentStep < 9) {
      int nextStep = currentStep + 1;

      // Skip CEO Profile (step 3) if "Currently no CEO" is selected in Governance (step 2)
      if (currentStep == 2 && secondLineManagement == 'Currently no CEO') {
        nextStep = 4; // Skip to Board of Directors (step 4)
      }

      context.go('/form/$formYear/$nextStep');
    } else {
      // Show completion success - you can navigate to a success page or back to dashboard
      context.go('/home/dashboard');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All forms completed successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  static void navigateToPreviousStep(
    BuildContext context,
    String formYear,
    int currentStep,
  ) {
    if (currentStep > 1) {
      final previousStep = currentStep - 1;
      context.go('/form/$formYear/$previousStep');
    } else {
      context.go('/home/dashboard');
    }
  }

  static Widget buildNavigationButtons(
    BuildContext context,
    String formYear,
    int currentStep, {
    Future<bool> Function()? onNext,
    bool isValid = true,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (currentStep > 1)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () =>
                    navigateToPreviousStep(context, formYear, currentStep),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous'),
              ),
            ),
          if (currentStep > 1) const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isValid
                  ? () async {
                      final shouldNavigate = await onNext?.call() ?? true;
                      if (shouldNavigate && context.mounted) {
                        navigateToNextStep(context, formYear, currentStep);
                      }
                    }
                  : null,
              icon: Icon(currentStep == 9 ? Icons.check : Icons.arrow_forward),
              label: Text(currentStep == 9 ? 'Complete' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  static PreferredSizeWidget buildAppBar(
    BuildContext context,
    int currentStep,
    String formYear,
  ) {
    return AppBar(
      title: Text('Step $currentStep: ${stepTitles[currentStep] ?? ''}'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => _handleBackNavigation(context, currentStep, formYear),
      ),
    );
  }

  static void _handleBackNavigation(
    BuildContext context,
    int currentStep,
    String formYear,
  ) {
    // Always go back to dashboard when back button is pressed
    context.go('/home/dashboard');
  }

  static Widget wrapWithBackHandler({
    required BuildContext context,
    required int currentStep,
    required String formYear,
    required Widget child,
  }) {
    return PopScope(
      canPop: false, // Prevent default back behavior
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop) {
          // Handle hardware back button - always go to dashboard
          context.go('/home/dashboard');
        }
      },
      child: child,
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fpo/pages/create_fpo_screen.dart';
import 'package:fpo/pages/fpo_selector_screen.dart';
import 'package:fpo/pages/dashboard_page.dart';
import 'package:fpo/pages/forms/board_directors_screen.dart';
import 'package:fpo/pages/forms/business_operations_screen.dart';
import 'package:fpo/pages/forms/ceo_profile_screen.dart';
import 'package:fpo/pages/forms/compliances_screen.dart';
import 'package:fpo/pages/forms/financial_details_screen.dart';
import 'package:fpo/pages/forms/fpo_profile_screen.dart';
import 'package:fpo/pages/forms/governance_screen.dart';
import 'package:fpo/pages/forms/process_systems_screen.dart';
import 'package:fpo/pages/forms/sustainable_activities_screen.dart';
import 'package:fpo/pages/home_page.dart';
import 'package:fpo/pages/login_page.dart';
import 'package:fpo/pages/organisation_score_page.dart';
import 'package:fpo/pages/settings_page.dart';
import 'package:fpo/pages/signup_page.dart';
import 'package:fpo/pages/splash_page.dart';
import 'package:fpo/services/auth_service.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authService = AuthService.instance;
      final isAuthenticated = authService.isAuthenticated;
      final isAuthUnknown = authService.status == AuthStatus.unknown;
      final hasUserFpo = authService.hasUserFpo;
      final currentFPO = authService.currentFpoId;

      log('Router redirect - current location: ${state.matchedLocation}');
      log(
        'Auth status: isAuthenticated=$isAuthenticated, isAuthUnknown=$isAuthUnknown, hasUserFpo=$hasUserFpo',
      );

      // Show splash/loading while checking auth
      if (isAuthUnknown) {
        log('Redirecting to splash - auth status unknown');
        return '/splash';
      }

      // Always allow access to these routes regardless of authentication status
      final isPublicRoute =
          state.matchedLocation == '/' ||
          state.matchedLocation == '/register' ||
          state.matchedLocation == '/splash';

      // Always allow access to these routes for authenticated users
      final isFpoManagementRoute =
          state.matchedLocation == '/fpo-selector' ||
          state.matchedLocation == '/create-fpo';

      // Redirect to login if not authenticated and trying to access protected routes
      if (!isAuthenticated && !isPublicRoute) {
        log('Redirecting to login - not authenticated for protected route');
        return '/';
      }

      // If authenticated, handle FPO selection logic
      if (isAuthenticated) {
        // Always allow access to FPO management routes
        if (isFpoManagementRoute) {
          log(
            'Allowing access to FPO management route: ${state.matchedLocation}',
          );
          return null;
        }

        // If no current FPO selected, redirect to fpo-selector
        if (currentFPO == null && !isFpoManagementRoute) {
          log('Redirecting to fpo-selector - no current FPO selected');
          return '/fpo-selector';
        }

        // If authenticated and on login page with FPO selected, redirect to dashboard
        if (currentFPO != null &&
            (state.matchedLocation == '/' ||
                state.matchedLocation == '/register')) {
          log('Redirecting to dashboard - authenticated with FPO selected');
          return '/home/dashboard';
        }
      }

      log('No redirect needed');
      return null; // No redirect needed
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/create-fpo',
        builder: (context, state) => const CreateFpoScreen(),
      ),
      GoRoute(
        path: '/fpo-selector',
        builder: (context, state) => const FpoSelectorScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomePage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/reports',
                builder: (context, state) => const OrganisationScorePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/form/:submissionYear/:step',
        builder: (context, state) {
          final submissionYear = state.pathParameters['submissionYear']!;
          final stepStr = state.pathParameters['step']!;
          final step = int.tryParse(stepStr) ?? 1;

          switch (step) {
            case 1:
              return FPOProfileScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 2:
              return GovernanceScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 3:
              return CEOProfileScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 4:
              return BoardDirectorsScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 5:
              return BusinessOperationsScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 6:
              return CompliancesScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 7:
              return ProcessSystemsScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 8:
              return FinancialDetailsScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            case 9:
              return SustainableActivitiesScreen(
                formYear: submissionYear,
                currentStep: step,
              );
            default:
              throw Exception('Invalid step: $step');
          }
        },
      ),
    ],
    refreshListenable: AuthService.instance,
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.uri.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    ),
  );
}

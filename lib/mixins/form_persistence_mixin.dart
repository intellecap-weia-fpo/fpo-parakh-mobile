import 'package:flutter/material.dart';

import '../graphql/queries/form_queries.graphql.dart';
import '../services/auth_service.dart';
import '../services/form_data_service.dart';

mixin FormPersistenceMixin<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  bool isSaving = false;

  String get formYear;
  String get formStepKey; // e.g., 'basicDetails', 'governanceManagementDetails'

  @override
  void initState() {
    super.initState();
    loadExistingData();
  }

  Future<void> loadExistingData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final existingData = await FormDataService.instance.getSubmission(
        financialYear: formYear,
        fpoId: AuthService.instance.currentFpoId!,
      );

      if (existingData != null) {
        final stepData = _getStepData(existingData, formStepKey);
        if (stepData != null) {
          populateFormFromData(stepData);
        }
      }
    } catch (e) {
      print('Error loading existing data: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading data: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> saveFormData(
    Map<String, dynamic> inputData,
    Future<Map<String, dynamic>?> Function() saveFunction,
  ) async {
    if (isSaving) return;

    setState(() {
      isSaving = true;
    });

    try {
      final result = await saveFunction();
      print('GraphQL Result: $result'); // Debug logging

      if (result != null && result['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final errors = result?['errors'] as List?;
        final errorMessage = errors?.join(', ') ?? 'Failed to save data';
        print('Save failed - Result: $result'); // Debug logging
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Save error: $e'); // Debug logging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data: $e'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  // Helper method to extract step data from typed submission object
  Map<String, dynamic>? _getStepData(
    Query$GetSubmission$getSubmission data,
    String stepKey,
  ) {
    switch (stepKey) {
      case 'basicDetails':
        return data.fpoDetails?.toJson();
      case 'governanceManagementDetails':
        return data.governance?.toJson();
      case 'ceoProfile':
        return data.ceoProfile?.toJson();
      case 'boardOfDirectorsProfiles':
        return {
          'boardOfDirectorsProfiles': data.boardDirectors?.edges
              ?.map((e) => e?.node?.toJson())
              .toList(),
        };
      case 'businessOperations':
        return data.businessOperations?.toJson();
      case 'complianceDetails':
        return data.complianceDetails?.toJson();
      case 'processesAndSystems':
        return data.processesSystems?.toJson();
      case 'financialDetails':
        return data.financialDetails?.toJson();
      case 'sustainableActivities':
        return data.sustainableActivities?.toJson();
      default:
        return null;
    }
  }

  // Abstract method to be implemented by each form screen
  void populateFormFromData(Map<String, dynamic> data);

  Widget buildSaveAndNextButtons({
    required VoidCallback onNext,
    required VoidCallback onSave,
  }) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Save Button
          Expanded(
            child: ElevatedButton(
              onPressed: isSaving ? null : onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isSaving
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('Saving...'),
                      ],
                    )
                  : const Text('Save'),
            ),
          ),
          const SizedBox(width: 16),
          // Next Button
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoadingOverlay({required Widget child}) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : child;
  }
}

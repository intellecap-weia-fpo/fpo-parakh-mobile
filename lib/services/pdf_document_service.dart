import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;

class PdfDocumentService {
  static PdfDocumentService? _instance;
  static PdfDocumentService get instance =>
      _instance ??= PdfDocumentService._();

  PdfDocumentService._();

  // Set the server at build time with --dart-define=API_BASE_URL=...
  static const String _apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000',
  );
  static const String _pdfProcessEndpoint =
      '$_apiBaseUrl/fpo/api/process-document/';

  // Configuration for API timeout (increased for document processing)
  static const Duration _apiTimeout = Duration(minutes: 10);

  /// Pick a document (PDF or image) from device storage
  Future<File?> pickPdfDocument() async {
    try {
      // Request storage permission
      final permission = await _requestStoragePermission();
      if (!permission) {
        throw Exception(
          'Storage permission is required to select documents. Please grant storage permission in your device settings.',
        );
      }

      debugPrint('PDF Document Service: Starting file picker');

      // Pick document: allow PDF and common image formats
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'heic', 'webp'],
        allowMultiple: false,
        withData: false, // We only need the path, not the data
        withReadStream: false,
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        debugPrint('PDF Document Service: File selected - ${file.path}');

        // Validate if it's a supported file (PDF or image)
        if (!await _isValidSupportedFile(file)) {
          throw Exception('Unsupported file format. Please select a PDF or image file.');
        }

        debugPrint('PDF Document Service: File validated successfully');
        return file;
      }

      debugPrint('PDF Document Service: No file selected or file path is null');
      return null;
    } catch (e) {
      debugPrint('PDF Document Service: Error picking document - $e');
      rethrow;
    }
  }

  /// Send document to API for processing and extraction
  Future<PdfProcessingResponse> sendPdfToApi(
    File pdfFile, {
    required int fpoId,
    String? financialYear,
  }) async {
    try {
      final fileName = pdfFile.path.split('/').last;
      debugPrint('PDF Document Service: Sending document to API - $fileName');

      // Create multipart request
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(_pdfProcessEndpoint),
      );

      // Add file to request
      final fileBytes = await pdfFile.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'document',
        fileBytes,
        filename: fileName,
      );
      request.files.add(multipartFile);

      // Add required form fields
      request.fields['fpo_id'] = fpoId.toString();
      if (financialYear != null) {
        request.fields['financial_year'] = financialYear;
      }

      // Add headers
      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Accept'] = 'application/json';

      debugPrint('PDF Document Service: Sending request to $_pdfProcessEndpoint');
      debugPrint('PDF Document Service: Request fields - ${request.fields}');
      debugPrint(
        'PDF Document Service: Request files - ${request.files.map((f) => f.field).toList()}',
      );

      // Send request with timeout
      final streamedResponse = await request.send().timeout(_apiTimeout);
      final response = await http.Response.fromStream(streamedResponse);

      debugPrint(
        'PDF Document Service: API Response Status - ${response.statusCode}',
      );
      debugPrint('PDF Document Service: API Response Body - ${response.body}');

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        debugPrint('PDF Document Service: Successfully processed document via API');

        // Parse the full API response according to the new format
        return PdfProcessingResponse.fromJson(responseData);
      } else {
        final errorData = json.decode(response.body);
        throw Exception(
          'API Error (${response.statusCode}): ${errorData['error'] ?? 'Unknown error'}',
        );
      }
    } catch (e) {
      debugPrint('PDF Document Service: Error sending document to API - $e');
      debugPrint('PDF Document Service: Error type - ${e.runtimeType}');
      debugPrint('PDF Document Service: Error details - ${e.toString()}');

      // Fallback to local processing for development/testing
      if (e.toString().contains('SocketException') ||
          e.toString().contains('Connection') ||
          e.toString().contains('TimeoutException') ||
          e.toString().contains('timeout')) {
        debugPrint('PDF Document Service: API unavailable or timeout, falling back to local processing');
        return _fallbackLocalProcessing();
      }

      rethrow;
    }
  }

  /// Fallback local processing when API is unavailable
  Future<PdfProcessingResponse> _fallbackLocalProcessing() async {
    debugPrint('PDF Document Service: API unavailable - no fallback processing available');

    // Return empty response when API is unavailable
    return PdfProcessingResponse(
      success: false,
      results: {},
      submissionId: 0,
      summary: PdfProcessingSummary(
        successfulExtractions: [],
        noDataExtractions: [],
        errorExtractions: [],
        totalSuccessful: 0,
        totalNoData: 0,
        totalErrors: 1,
        extractedFields: {},
        textSummary: 'API unavailable - failed to process document',
      ),
      message: 'API unavailable - failed to process document',
    );
  }

  /// Process document and return processing response
  Future<PdfProcessingResponse> processDocument(
    File pdfFile, {
    required int fpoId,
    String? financialYear,
  }) async {
    try {
      debugPrint('PDF Document Service: Starting document processing via API');

      // Send document to API for processing
      final extractedData = await sendPdfToApi(
        pdfFile,
        fpoId: fpoId,
        financialYear: financialYear,
      );

      debugPrint('PDF Document Service: Successfully processed document');
      return extractedData;
    } catch (e) {
      debugPrint('PDF Document Service: Error processing document - $e');
      rethrow;
    }
  }

  // Private helper methods

  Future<bool> _requestStoragePermission() async {
    try {
      if (Platform.isAndroid) {
        // Check Android version to determine which permissions to request
        final androidInfo = await _getAndroidInfo();

        if (androidInfo >= 33) {
          // Android 13+ (API 33+) - Use granular permissions
          debugPrint(
            'PDF Document Service: Requesting Android 13+ permissions',
          );

          // For file picker, we typically don't need explicit permissions
          // as it uses the system file picker which handles permissions
          return true;
        } else if (androidInfo >= 30) {
          // Android 11+ (API 30-32) - Scoped storage
          debugPrint(
            'PDF Document Service: Requesting Android 11+ storage permission',
          );
          final permission = await Permission.storage.request();

          if (permission.isDenied) {
            // Request MANAGE_EXTERNAL_STORAGE for broader access if needed
            final managePermission = await Permission.manageExternalStorage
                .request();
            return managePermission.isGranted || permission.isGranted;
          }

          return permission.isGranted;
        } else {
          // Android 10 and below - Legacy storage permissions
          debugPrint(
            'PDF Document Service: Requesting legacy storage permission',
          );
          final permission = await Permission.storage.request();
          return permission.isGranted;
        }
      } else if (Platform.isIOS) {
        // iOS doesn't need explicit permission for file picker
        // The system handles permissions automatically
        debugPrint(
          'PDF Document Service: iOS - no explicit permissions needed',
        );
        return true;
      }

      // For other platforms (web, desktop), assume permission is granted
      return true;
    } catch (e) {
      debugPrint('PDF Document Service: Error requesting permission - $e');
      // If permission request fails, still try to proceed
      // The file picker will handle permission errors
      return true;
    }
  }

  Future<int> _getAndroidInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      debugPrint('PDF Document Service: Android SDK version - $sdkInt');
      return sdkInt;
    } catch (e) {
      debugPrint('PDF Document Service: Error getting Android info - $e');
      return 30; // Default to Android 11+ if detection fails
    }
  }

  Future<bool> _isValidPdfFile(File file) async {
    try {
      final bytes = await file.readAsBytes();
      // Check for PDF header
      if (bytes.length < 4) return false;

      final header = String.fromCharCodes(bytes.take(4));
      return header == '%PDF';
    } catch (e) {
      debugPrint('PDF Document Service: Error validating PDF - $e');
      return false;
    }
  }

  Future<bool> _isValidImageFile(File file) async {
    try {
      final bytes = await file.readAsBytes();
      if (bytes.length < 12) return false;

      // JPEG: FF D8 FF
      final isJpeg = bytes[0] == 0xFF && bytes[1] == 0xD8 && bytes[2] == 0xFF;
      // PNG: 89 50 4E 47 0D 0A 1A 0A
      final isPng = bytes.length >= 8 &&
          bytes[0] == 0x89 &&
          bytes[1] == 0x50 &&
          bytes[2] == 0x4E &&
          bytes[3] == 0x47 &&
          bytes[4] == 0x0D &&
          bytes[5] == 0x0A &&
          bytes[6] == 0x1A &&
          bytes[7] == 0x0A;
      // HEIC/HEIF: ftypheic / ftypheif / ftypmif1 / ftypmsf1 (offset 4..11)
      final isHeic = bytes.length >= 12 &&
          bytes[4] == 0x66 && // 'f'
          bytes[5] == 0x74 && // 't'
          bytes[6] == 0x79 && // 'y'
          bytes[7] == 0x70 && // 'p'
          ((bytes[8] == 0x68 && bytes[9] == 0x65 && bytes[10] == 0x69 && bytes[11] == 0x63) ||
              (bytes[8] == 0x68 && bytes[9] == 0x65 && bytes[10] == 0x69 && bytes[11] == 0x66) ||
              (bytes[8] == 0x6D && bytes[9] == 0x69 && bytes[10] == 0x66 && bytes[11] == 0x31) ||
              (bytes[8] == 0x6D && bytes[9] == 0x73 && bytes[10] == 0x66 && bytes[11] == 0x31));
      // WebP: RIFF....WEBP signature (bytes 0-3 'RIFF', bytes 8-11 'WEBP')
      final isWebp = bytes.length >= 12 &&
          bytes[0] == 0x52 && // 'R'
          bytes[1] == 0x49 && // 'I'
          bytes[2] == 0x46 && // 'F'
          bytes[3] == 0x46 && // 'F'
          bytes[8] == 0x57 && // 'W'
          bytes[9] == 0x45 && // 'E'
          bytes[10] == 0x42 && // 'B'
          bytes[11] == 0x50; // 'P'

      return isJpeg || isPng || isHeic || isWebp;
    } catch (e) {
      debugPrint('PDF Document Service: Error validating image - $e');
      return false;
    }
  }

  Future<bool> _isValidSupportedFile(File file) async {
    final path = file.path.toLowerCase();
    if (path.endsWith('.pdf')) {
      return _isValidPdfFile(file);
    }
    if (path.endsWith('.jpg') ||
        path.endsWith('.jpeg') ||
        path.endsWith('.png') ||
        path.endsWith('.heic') ||
        path.endsWith('.webp')) {
      return _isValidImageFile(file);
    }
    return false;
  }
}

/// Data model for PDF processing API response
class PdfProcessingResponse {
  final bool success;
  final Map<String, String> results;
  final int submissionId;
  final PdfProcessingSummary summary;
  final String? message;

  PdfProcessingResponse({
    required this.success,
    required this.results,
    required this.submissionId,
    required this.summary,
    this.message,
  });

  factory PdfProcessingResponse.fromJson(Map<String, dynamic> json) {
    return PdfProcessingResponse(
      success: json['success'] as bool,
      results: Map<String, String>.from(json['results'] as Map),
      submissionId: json['submission_id'] as int,
      summary: PdfProcessingSummary.fromJson(
        json['summary'] as Map<String, dynamic>,
      ),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'results': results,
      'submission_id': submissionId,
      'summary': summary.toJson(),
      'message': message,
    };
  }
}

/// Data model for PDF processing summary
class PdfProcessingSummary {
  final List<String> successfulExtractions;
  final List<String> noDataExtractions;
  final List<String> errorExtractions;
  final int totalSuccessful;
  final int totalNoData;
  final int totalErrors;
  final Map<String, dynamic> extractedFields;
  final String textSummary;

  PdfProcessingSummary({
    required this.successfulExtractions,
    required this.noDataExtractions,
    required this.errorExtractions,
    required this.totalSuccessful,
    required this.totalNoData,
    required this.totalErrors,
    required this.extractedFields,
    required this.textSummary,
  });

  factory PdfProcessingSummary.fromJson(Map<String, dynamic> json) {
    return PdfProcessingSummary(
      successfulExtractions: List<String>.from(
        json['successful_extractions'] as List,
      ),
      noDataExtractions: List<String>.from(json['no_data_extractions'] as List),
      errorExtractions: List<String>.from(json['error_extractions'] as List),
      totalSuccessful: json['total_successful'] as int,
      totalNoData: json['total_no_data'] as int,
      totalErrors: json['total_errors'] as int,
      extractedFields: Map<String, dynamic>.from(
        json['extracted_fields'] as Map,
      ),
      textSummary: json['text_summary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'successful_extractions': successfulExtractions,
      'no_data_extractions': noDataExtractions,
      'error_extractions': errorExtractions,
      'total_successful': totalSuccessful,
      'total_no_data': totalNoData,
      'total_errors': totalErrors,
      'extracted_fields': extractedFields,
      'text_summary': textSummary,
    };
  }
}

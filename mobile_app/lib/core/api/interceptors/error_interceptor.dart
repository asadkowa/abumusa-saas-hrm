import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../errors/app_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = _handleError(err);

    if (kDebugMode) {
      debugPrint('API Error: ${error.message}');
      debugPrint('Status Code: ${err.response?.statusCode}');
      debugPrint('Error Type: ${err.type}');
    }

    return handler.next(err);
  }

  AppException _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(
          message: 'Connection timeout. Please check your internet connection.',
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);

      case DioExceptionType.cancel:
        return AppException(message: 'Request cancelled');

      case DioExceptionType.connectionError:
        return NetworkException(
          message: 'No internet connection. Please check your network.',
        );

      case DioExceptionType.badCertificate:
        return AppException(message: 'Certificate verification failed');

      case DioExceptionType.unknown:
      default:
        return AppException(
          message: error.message ?? 'Something went wrong. Please try again.',
        );
    }
  }

  AppException _handleResponseError(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    switch (statusCode) {
      case 400:
        return BadRequestException(
          message: _extractErrorMessage(data) ?? 'Bad request',
        );

      case 401:
        return UnauthorizedException(
          message: _extractErrorMessage(data) ?? 'Unauthorized access',
        );

      case 403:
        return ForbiddenException(
          message: _extractErrorMessage(data) ?? 'Access forbidden',
        );

      case 404:
        return NotFoundException(
          message: _extractErrorMessage(data) ?? 'Resource not found',
        );

      case 422:
        return ValidationException(
          message: _extractErrorMessage(data) ?? 'Validation failed',
          errors: _extractValidationErrors(data),
        );

      case 500:
        return ServerException(
          message: _extractErrorMessage(data) ?? 'Internal server error',
        );

      case 503:
        return ServerException(
          message: _extractErrorMessage(data) ?? 'Service unavailable',
        );

      default:
        return AppException(
          message: _extractErrorMessage(data) ?? 'Something went wrong',
        );
    }
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      // Try common error message keys
      return data['message'] ??
          data['error'] ??
          data['msg'] ??
          data['detail'];
    }

    if (data is String) {
      return data;
    }

    return null;
  }

  Map<String, List<String>>? _extractValidationErrors(dynamic data) {
    if (data == null || data is! Map) return null;

    final errors = data['errors'];
    if (errors == null || errors is! Map) return null;

    final Map<String, List<String>> validationErrors = {};

    errors.forEach((key, value) {
      if (value is List) {
        validationErrors[key] = value.map((e) => e.toString()).toList();
      } else if (value is String) {
        validationErrors[key] = [value];
      }
    });

    return validationErrors.isEmpty ? null : validationErrors;
  }
}

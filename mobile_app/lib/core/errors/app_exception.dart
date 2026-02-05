/// Base exception class for all app exceptions
class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  AppException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => message;
}

/// Network related exceptions
class NetworkException extends AppException {
  NetworkException({required super.message, super.statusCode, super.data});
}

/// Authentication/Authorization exceptions
class UnauthorizedException extends AppException {
  UnauthorizedException({required super.message, super.statusCode, super.data});
}

class ForbiddenException extends AppException {
  ForbiddenException({required super.message, super.statusCode, super.data});
}

/// Client error exceptions
class BadRequestException extends AppException {
  BadRequestException({required super.message, super.statusCode, super.data});
}

class NotFoundException extends AppException {
  NotFoundException({required super.message, super.statusCode, super.data});
}

class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  ValidationException({
    required super.message,
    this.errors,
    super.statusCode,
    super.data,
  });

  String? getFieldError(String field) {
    if (errors == null || !errors!.containsKey(field)) return null;
    return errors![field]!.isNotEmpty ? errors![field]!.first : null;
  }

  List<String> getAllErrors() {
    if (errors == null) return [];
    return errors!.values.expand((e) => e).toList();
  }
}

/// Server error exceptions
class ServerException extends AppException {
  ServerException({required super.message, super.statusCode, super.data});
}

/// Cache exceptions
class CacheException extends AppException {
  CacheException({required super.message, super.statusCode, super.data});
}

/// Location/GPS exceptions
class LocationException extends AppException {
  LocationException({required super.message, super.statusCode, super.data});
}

/// Permission exceptions
class PermissionException extends AppException {
  PermissionException({required super.message, super.statusCode, super.data});
}

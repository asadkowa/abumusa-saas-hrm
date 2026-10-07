import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../constants/storage_keys.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from storage
    final box = await Hive.openBox(StorageKeys.userBox);
    final token = box.get(StorageKeys.accessToken);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Get company subdomain if exists
    final settingsBox = await Hive.openBox(StorageKeys.settingsBox);
    final subdomain = settingsBox.get(StorageKeys.companySubdomain);

    if (subdomain != null) {
      options.headers['X-Company-Subdomain'] = subdomain;
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401) {
      // Clear token and redirect to login
      final box = await Hive.openBox(StorageKeys.userBox);
      await box.clear();

      // You can add navigation to login page here
      // Get.offAllNamed(Routes.LOGIN);
    }

    return handler.next(err);
  }
}

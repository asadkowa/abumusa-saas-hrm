import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/api/dio_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../shared/models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(DioClient());
});

class AuthRepository {
  final DioClient _dioClient;

  AuthRepository(this._dioClient);

  /// Login with email and password
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    String? companySubdomain,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
          if (companySubdomain != null) 'company': companySubdomain,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        // Save token
        if (data['data']?['token'] != null) {
          await _saveToken(data['data']['token']);
        }

        // Save user data
        if (data['data']?['user'] != null) {
          final user = UserModel.fromJson(data['data']['user']);
          await _saveUserData(user);
        }

        return data;
      } else {
        throw AppException(message: 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw AppException(
          message: e.response!.data['message'] ?? 'Login failed',
        );
      }
      rethrow;
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _dioClient.get(ApiConstants.logout);
      await _clearLocalData();
    } catch (e) {
      // Still clear local data even if API call fails
      await _clearLocalData();
      rethrow;
    }
  }

  /// Logout from all devices
  Future<void> logoutAllDevices() async {
    try {
      await _dioClient.get(ApiConstants.logoutAllDevices);
      await _clearLocalData();
    } catch (e) {
      await _clearLocalData();
      rethrow;
    }
  }

  /// Reset password
  Future<void> resetPassword({required String email}) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.resetPassword,
        data: {'email': email},
      );

      if (response.statusCode != 200) {
        throw AppException(message: 'Failed to send reset link');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw AppException(
          message: e.response!.data['message'] ?? 'Failed to send reset link',
        );
      }
      rethrow;
    }
  }

  /// Change password
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.changePassword,
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
          'new_password_confirmation': confirmPassword,
        },
      );

      if (response.statusCode != 200) {
        throw AppException(message: 'Failed to change password');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw AppException(
          message: e.response!.data['message'] ?? 'Failed to change password',
        );
      }
      rethrow;
    }
  }

  /// Get company list
  Future<List<Map<String, dynamic>>> getCompanyList() async {
    try {
      final response = await _dioClient.get(ApiConstants.companyList);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data['data'] as List;
        return data.map((e) => e as Map<String, dynamic>).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final box = await Hive.openBox(StorageKeys.userBox);
    final token = box.get(StorageKeys.accessToken);
    return token != null;
  }

  /// Get current user
  Future<UserModel?> getCurrentUser() async {
    final box = await Hive.openBox(StorageKeys.userBox);
    final userJson = box.get(StorageKeys.userProfile);

    if (userJson != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(userJson));
    }

    return null;
  }

  /// Save token to local storage
  Future<void> _saveToken(String token) async {
    final box = await Hive.openBox(StorageKeys.userBox);
    await box.put(StorageKeys.accessToken, token);
    await box.put(StorageKeys.isLoggedIn, true);
  }

  /// Save user data to local storage
  Future<void> _saveUserData(UserModel user) async {
    final box = await Hive.openBox(StorageKeys.userBox);
    await box.put(StorageKeys.userId, user.id);
    await box.put(StorageKeys.userEmail, user.email);
    await box.put(StorageKeys.userName, user.name);
    await box.put(StorageKeys.userAvatar, user.avatar);
    await box.put(StorageKeys.userProfile, user.toJson());
  }

  /// Clear all local data
  Future<void> _clearLocalData() async {
    final userBox = await Hive.openBox(StorageKeys.userBox);
    final cacheBox = await Hive.openBox(StorageKeys.cacheBox);

    await userBox.clear();
    await cacheBox.clear();
  }
}

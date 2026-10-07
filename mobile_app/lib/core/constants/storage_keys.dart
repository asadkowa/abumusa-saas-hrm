/// Storage keys for Hive boxes and SharedPreferences
class StorageKeys {
  StorageKeys._();

  // Box names
  static const String settingsBox = 'settings_box';
  static const String userBox = 'user_box';
  static const String cacheBox = 'cache_box';

  // User data keys
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userAvatar = 'user_avatar';
  static const String userRole = 'user_role';
  static const String isLoggedIn = 'is_logged_in';
  static const String userProfile = 'user_profile';

  // Settings keys
  static const String isDarkMode = 'is_dark_mode';
  static const String languageCode = 'language_code';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String biometricEnabled = 'biometric_enabled';
  static const String fcmToken = 'fcm_token';

  // App settings
  static const String baseUrl = 'base_url';
  static const String companySubdomain = 'company_subdomain';
  static const String apiVersion = 'api_version';

  // Cache keys
  static const String cachedAttendance = 'cached_attendance';
  static const String cachedLeaves = 'cached_leaves';
  static const String cachedExpenses = 'cached_expenses';
  static const String lastSyncTime = 'last_sync_time';
}

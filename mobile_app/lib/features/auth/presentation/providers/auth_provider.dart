import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

// Auth state
class AuthState extends Equatable {
  final UserModel? user;
  final bool isLoading;
  final bool isAuthenticated;
  final String? error;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.error,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    bool? isAuthenticated,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      error: error,
    );
  }

  @override
  List<Object?> get props => [user, isLoading, isAuthenticated, error];
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState()) {
    _checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> _checkAuthStatus() async {
    try {
      final isLoggedIn = await _authRepository.isLoggedIn();
      if (isLoggedIn) {
        final user = await _authRepository.getCurrentUser();
        state = state.copyWith(
          user: user,
          isAuthenticated: true,
        );
      }
    } catch (e) {
      state = state.copyWith(isAuthenticated: false);
    }
  }

  // Login
  Future<bool> login({
    required String email,
    required String password,
    String? companySubdomain,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _authRepository.login(
        email: email,
        password: password,
        companySubdomain: companySubdomain,
      );

      final user = await _authRepository.getCurrentUser();

      state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
        error: null,
      );

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _authRepository.logout();
      state = const AuthState(isAuthenticated: false);
    } catch (e) {
      // Clear state anyway
      state = const AuthState(isAuthenticated: false);
    }
  }

  // Logout from all devices
  Future<void> logoutAllDevices() async {
    try {
      await _authRepository.logoutAllDevices();
      state = const AuthState(isAuthenticated: false);
    } catch (e) {
      state = const AuthState(isAuthenticated: false);
    }
  }

  // Reset password
  Future<bool> resetPassword({required String email}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _authRepository.resetPassword(email: email);
      state = state.copyWith(isLoading: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Change password
  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _authRepository.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      state = state.copyWith(isLoading: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Update user profile
  void updateUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  // Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Auth provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/dashboard/presentation/pages/home_page.dart';
import '../../features/attendance/presentation/pages/attendance_page.dart';
import '../../features/leave/presentation/pages/leave_page.dart';
import '../../features/expense/presentation/pages/expense_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: authState.isAuthenticated ? '/home' : '/login',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isLoginPage = state.matchedLocation == '/login';

      // Redirect to login if not authenticated and not on login page
      if (!isAuthenticated && !isLoginPage) {
        return '/login';
      }

      // Redirect to home if authenticated and on login page
      if (isAuthenticated && isLoginPage) {
        return '/home';
      }

      return null;
    },
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),

      // Main App Routes
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),

      // Attendance Routes
      GoRoute(
        path: '/attendance',
        name: 'attendance',
        builder: (context, state) => const AttendancePage(),
      ),

      // Leave Routes
      GoRoute(
        path: '/leave',
        name: 'leave',
        builder: (context, state) => const LeavePage(),
      ),

      // Expense Routes
      GoRoute(
        path: '/expense',
        name: 'expense',
        builder: (context, state) => const ExpensePage(),
      ),

      // Profile Routes
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
});

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Check-in/Check-out Card
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: AppColors.cardShadow,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 64.sp,
                    color: AppColors.white,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Not Checked In',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      // Implement check-in with GPS
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 48.w,
                        vertical: 16.h,
                      ),
                    ),
                    child: const Text('Check In'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Attendance History
            Text(
              'This Month',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16.h),

            // Statistics Cards
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: 'Present',
                    value: '18',
                    color: AppColors.success,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _StatCard(
                    title: 'Absent',
                    value: '2',
                    color: AppColors.error,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _StatCard(
                    title: 'Late',
                    value: '3',
                    color: AppColors.warning,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            // Recent Attendance List
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16.h),

            _AttendanceListItem(
              date: 'Today',
              checkIn: '09:00 AM',
              checkOut: 'In Progress',
              status: 'On Time',
              statusColor: AppColors.success,
            ),
            SizedBox(height: 12.h),
            _AttendanceListItem(
              date: 'Yesterday',
              checkIn: '09:15 AM',
              checkOut: '06:00 PM',
              status: 'Late',
              statusColor: AppColors.warning,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _AttendanceListItem extends StatelessWidget {
  final String date;
  final String checkIn;
  final String checkOut;
  final String status;
  final Color statusColor;

  const _AttendanceListItem({
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.login, size: 16.sp, color: AppColors.success),
                    SizedBox(width: 4.w),
                    Text(checkIn, style: TextStyle(fontSize: 12.sp)),
                    SizedBox(width: 16.w),
                    Icon(Icons.logout, size: 16.sp, color: AppColors.error),
                    SizedBox(width: 4.w),
                    Text(checkOut, style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

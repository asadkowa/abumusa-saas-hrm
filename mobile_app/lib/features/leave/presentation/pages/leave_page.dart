import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Management'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Leave Balance Card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: AppColors.successGradient,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: AppColors.cardShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leave Balance',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _BalanceItem(title: 'Total', value: '24'),
                      _BalanceItem(title: 'Used', value: '6'),
                      _BalanceItem(title: 'Remaining', value: '18'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Request Leave Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to request leave page
                },
                icon: const Icon(Icons.add),
                label: const Text('Request Leave'),
              ),
            ),

            SizedBox(height: 24.h),

            // Leave History
            Text(
              'Leave History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16.h),

            _LeaveItem(
              type: 'Annual Leave',
              startDate: 'Dec 20, 2024',
              endDate: 'Dec 22, 2024',
              days: 3,
              status: 'Approved',
              statusColor: AppColors.success,
            ),
            SizedBox(height: 12.h),
            _LeaveItem(
              type: 'Sick Leave',
              startDate: 'Dec 15, 2024',
              endDate: 'Dec 15, 2024',
              days: 1,
              status: 'Pending',
              statusColor: AppColors.warning,
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceItem extends StatelessWidget {
  final String title;
  final String value;

  const _BalanceItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class _LeaveItem extends StatelessWidget {
  final String type;
  final String startDate;
  final String endDate;
  final int days;
  final String status;
  final Color statusColor;

  const _LeaveItem({
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.days,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
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
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.calendar_today,
                  size: 16.sp, color: AppColors.textSecondary),
              SizedBox(width: 8.w),
              Text(
                '$startDate - $endDate',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.access_time,
                  size: 16.sp, color: AppColors.textSecondary),
              SizedBox(width: 8.w),
              Text(
                '$days day${days > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.cardBg,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          _buildLocation(),
          const Spacer(),
          _buildNotificationButton(),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: const BoxDecoration(
            color: AppConstants.primaryLight,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.location_on_rounded,
            color: AppConstants.primaryColor,
            size: 12.sp,
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery to',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppConstants.textSecondary,
              ),
            ),
            Row(
              children: [
                Text(
                  'Cairo, Egypt',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 14.sp,
                  color: AppConstants.textPrimary,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationButton() {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        color: AppConstants.primaryLight,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        Icons.notifications_outlined,
        color: AppConstants.primaryColor,
        size: 18.sp,
      ),
    );
  }
}
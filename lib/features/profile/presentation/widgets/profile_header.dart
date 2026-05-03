import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppConstants.cardBg,
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: AppConstants.primaryLight,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppConstants.primaryColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text('👤', style: TextStyle(fontSize: 36.sp)),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.edit_rounded,
                    size: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Ahmed Mohamed',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'ahmed@example.com',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppConstants.textSecondary,
            ),
          ),
          SizedBox(height: 16.h),
          _buildStats(),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: 'Orders', value: '12'),
        _buildDivider(),
        _StatItem(label: 'Wishlist', value: '5'),
        _buildDivider(),
        _StatItem(label: 'Reviews', value: '8'),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 30.h,
      color: AppConstants.borderColor,
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppConstants.primaryColor,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppConstants.textSecondary,
          ),
        ),
      ],
    );
  }
}
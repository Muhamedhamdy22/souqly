import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final num total;
  final String status;
  final List<String> emojis;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.total,
    required this.status,
    required this.emojis,
    required this.onTap,
  });

  Color get _statusColor {
    switch (status) {
      case 'Delivered':
        return AppConstants.successColor;
      case 'Shipped':
        return const Color(0xFF2196F3);
      case 'Processing':
        return const Color(0xFFFF9800);
      case 'Cancelled':
        return AppConstants.errorColor;
      default:
        return AppConstants.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppConstants.cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppConstants.borderColor),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 12.h),
            const Divider(color: AppConstants.dividerColor, height: 1),
            SizedBox(height: 12.h),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        _buildEmojis(),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppConstants.orderNumber}$orderId',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                date,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppConstants.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: _statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            status,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: _statusColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmojis() {
    return Container(
      width: 56.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          emojis.isNotEmpty ? emojis.first : '🛒',
          style: TextStyle(fontSize: 28.sp),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${emojis.length} items',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppConstants.textSecondary,
          ),
        ),
        Row(
          children: [
            Text(
              '$total ${AppConstants.currency}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppConstants.primaryColor,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12.sp,
              color: AppConstants.textSecondary,
            ),
          ],
        ),
      ],
    );
  }
}
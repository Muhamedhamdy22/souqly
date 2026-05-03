import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class OrdersAppBar extends StatelessWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.cardBg,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Text(
            AppConstants.myOrders,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
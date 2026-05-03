import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductDetailsImage extends StatelessWidget {
  final String emoji;

  const ProductDetailsImage({super.key, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(emoji, style: TextStyle(fontSize: 100.sp)),
      ),
    );
  }
}
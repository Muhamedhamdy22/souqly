import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductDetailsBottomBar extends StatelessWidget {
  final VoidCallback onAddToCart;

  const ProductDetailsBottomBar({super.key, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppConstants.cardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {/* TODO: add to wishlist */},
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: AppConstants.primaryLight,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                color: AppConstants.primaryColor,
                size: 22.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: GestureDetector(
              onTap: onAddToCart,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      AppConstants.addToCart,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
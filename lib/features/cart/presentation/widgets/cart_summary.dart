import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class CartSummary extends StatelessWidget {
  final num subtotal;
  final VoidCallback onCheckout;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.onCheckout,
  });

  num get _deliveryFee =>
      subtotal >= AppConstants.freeDeliveryThreshold
          ? 0
          : AppConstants.deliveryFeeValue;

  num get _total => subtotal + _deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppConstants.cardBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildCouponField(),
          SizedBox(height: 16.h),
          _buildSummaryRow(AppConstants.subTotal, subtotal),
          SizedBox(height: 8.h),
          _buildSummaryRow(
            AppConstants.deliveryFee,
            _deliveryFee,
            hint: subtotal >= AppConstants.freeDeliveryThreshold
                ? 'Free'
                : null,
          ),
          SizedBox(height: 12.h),
          const Divider(color: AppConstants.dividerColor),
          SizedBox(height: 12.h),
          _buildTotalRow(),
          SizedBox(height: 16.h),
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildCouponField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 44.h,
            decoration: BoxDecoration(
              color: AppConstants.scaffoldBg,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppConstants.borderColor),
            ),
            child: Row(
              children: [
                SizedBox(width: 12.w),
                Icon(
                  Icons.discount_outlined,
                  size: 16.sp,
                  color: AppConstants.textHint,
                ),
                SizedBox(width: 8.w),
                Text(
                  AppConstants.couponCode,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppConstants.textHint,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {/* TODO: apply coupon */},
          child: Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Text(
                AppConstants.applyCoupon,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, num value, {String? hint}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppConstants.textSecondary,
          ),
        ),
        Text(
          hint ?? '$value ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: hint != null
                ? AppConstants.successColor
                : AppConstants.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppConstants.totalPrice,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimary,
          ),
        ),
        Text(
          '$_total ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppConstants.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return GestureDetector(
      onTap: onCheckout,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text(
            AppConstants.checkout,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
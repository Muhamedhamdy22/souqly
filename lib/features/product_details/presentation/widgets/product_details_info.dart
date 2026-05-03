import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductDetailsInfo extends StatelessWidget {
  final String name;
  final num price;
  final num oldPrice;
  final double rating;

  const ProductDetailsInfo({
    super.key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNameAndRating(),
          SizedBox(height: 10.h),
          _buildPriceRow(),
          SizedBox(height: 16.h),
          _buildQuantityRow(),
          SizedBox(height: 16.h),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildNameAndRating() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppConstants.starColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: AppConstants.starColor,
                size: 14.sp,
              ),
              SizedBox(width: 3.w),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    final discount =
    (((oldPrice - price) / oldPrice) * 100).toStringAsFixed(0);

    return Row(
      children: [
        Text(
          '$price ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppConstants.primaryColor,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          '$oldPrice ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppConstants.textHint,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: AppConstants.errorColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            '$discount% OFF',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.errorColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityRow() {
    return Row(
      children: [
        Text(
          AppConstants.quantity,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimary,
          ),
        ),
        const Spacer(),
        _QuantityButton(
          icon: Icons.remove_rounded,
          onTap: () {/* TODO: decrease quantity */},
        ),
        SizedBox(width: 16.w),
        Text(
          '1',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimary,
          ),
        ),
        SizedBox(width: 16.w),
        _QuantityButton(
          icon: Icons.add_rounded,
          onTap: () {/* TODO: increase quantity */},
          isFilled: true,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.description,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Fresh and high quality product delivered straight to your door. '
              'Sourced from trusted local farms to ensure the best taste and nutrition.',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppConstants.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isFilled;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color:
          isFilled ? AppConstants.primaryColor : AppConstants.cardBg,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isFilled
                ? AppConstants.primaryColor
                : AppConstants.borderColor,
          ),
        ),
        child: Icon(
          icon,
          size: 16.sp,
          color: isFilled ? Colors.white : AppConstants.textPrimary,
        ),
      ),
    );
  }
}
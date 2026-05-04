import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/cart/data/models/CartResponse.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppConstants.cardBg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Row(
        children: [
          _buildImage(),
          SizedBox(width: 12.w),
          Expanded(child: _buildInfo()),
          SizedBox(width: 8.w),
          _buildQuantityControls(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    final imageUrl = item.product?.image?.toString();
    return Container(
      width: 70.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: imageUrl != null && imageUrl.isNotEmpty
            ? CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (_, __) => Center(
            child: CircularProgressIndicator(
              color: AppConstants.primaryColor,
              strokeWidth: 2,
            ),
          ),
          errorWidget: (_, __, ___) => Icon(
            Icons.image_not_supported_outlined,
            color: AppConstants.textHint,
            size: 24.sp,
          ),
        )
            : Icon(
          Icons.image_not_supported_outlined,
          color: AppConstants.textHint,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.product?.name ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppConstants.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          '${item.product?.price ?? '0'} ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppConstants.primaryColor,
          ),
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onDelete,
          child: Row(
            children: [
              Icon(Icons.delete_outline_rounded,
                  size: 14.sp, color: AppConstants.errorColor),
              SizedBox(width: 3.w),
              Text(AppConstants.delete,
                  style: TextStyle(
                      fontSize: 11.sp, color: AppConstants.errorColor)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControls() {
    return Column(
      children: [
        _QuantityBtn(icon: Icons.add_rounded, onTap: onIncrease, isFilled: true),
        SizedBox(height: 8.h),
        Text(
          '${item.quantity ?? 1}',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary),
        ),
        SizedBox(height: 8.h),
        _QuantityBtn(icon: Icons.remove_rounded, onTap: onDecrease, isFilled: false),
      ],
    );
  }
}

class _QuantityBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isFilled;

  const _QuantityBtn({
    required this.icon,
    required this.onTap,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          color: isFilled ? AppConstants.primaryColor : AppConstants.cardBg,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isFilled ? AppConstants.primaryColor : AppConstants.borderColor,
          ),
        ),
        child: Icon(icon,
            size: 14.sp,
            color: isFilled ? Colors.white : AppConstants.textPrimary),
      ),
    );
  }
}
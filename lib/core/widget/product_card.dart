import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final num price;
  final num oldPrice;
  final double rating;
  final dynamic imageUrl;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.rating,
    required this.imageUrl,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppConstants.cardBg,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppConstants.borderColor),
        ),
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(height: 8.h),
            _buildName(),
            SizedBox(height: 4.h),
            _buildPriceRow(),
            SizedBox(height: 6.h),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: imageUrl != null
            ? CachedNetworkImage(
          imageUrl: imageUrl.toString(),
          fit: BoxFit.contain,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: AppConstants.primaryColor,
              strokeWidth: 2,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppConstants.textHint,
              size: 28.sp,
            ),
          ),
        )
            : Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: AppConstants.textHint,
            size: 28.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppConstants.textPrimary,
      ),
    );
  }

  Widget _buildPriceRow() {
    return Row(
      children: [
        Text(
          '$price ${AppConstants.currency}',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.primaryColor,
          ),
        ),
        SizedBox(width: 6.w),
        if (oldPrice > price)
          Text(
            '$oldPrice ${AppConstants.currency}',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppConstants.textHint,
              decoration: TextDecoration.lineThrough,
            ),
          ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.star_rounded, color: AppConstants.starColor, size: 12.sp),
            SizedBox(width: 2.w),
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 10.sp,
                color: AppConstants.textSecondary,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onAddToCart,
          child: Container(
            width: 26.w,
            height: 26.w,
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.add_rounded, color: Colors.white, size: 16.sp),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final num price;
  final String? imageUrl;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.onTap,
    required this.onAddToCart,
    this.imageUrl,
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
            _buildPrice(),
            SizedBox(height: 6.h),
            _buildAddToCart(),
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
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: AppConstants.primaryColor,
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (_, __, ___) => Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppConstants.textHint,
              size: 30.sp,
            ),
          ),
        )
            : Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: AppConstants.textHint,
            size: 30.sp,
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

  Widget _buildPrice() {
    return Text(
      '$price \${AppConstants.currency}',
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppConstants.primaryColor,
      ),
    );
  }

  Widget _buildAddToCart() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
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
    );
  }
}
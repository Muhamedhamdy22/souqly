import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final dynamic imageUrl;
  final Color bgColor;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.bgColor,
    required this.onTap,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(),
            SizedBox(height: 10.h),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: imageUrl != null
            ? CachedNetworkImage(
          imageUrl: imageUrl.toString(),
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(
              color: AppConstants.primaryColor,
              strokeWidth: 2,
            ),
          ),
          errorWidget: (context, url, error) => Center(
            child: Icon(
              Icons.category_outlined,
              color: AppConstants.primaryColor,
              size: 28.sp,
            ),
          ),
        )
            : Center(
          child: Icon(
            Icons.category_outlined,
            color: AppConstants.primaryColor,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
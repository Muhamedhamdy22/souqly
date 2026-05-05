import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  bool get _isSvg =>
      imageUrl != null && imageUrl.toString().toLowerCase().endsWith('.svg');

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary,
                ),
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: 56.w,
      height: 56.w,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: imageUrl != null
            ? _isSvg
            ? SvgPicture.network(
          imageUrl.toString(),
          fit: BoxFit.contain,
          placeholderBuilder: (_) => Center(
            child: CircularProgressIndicator(
              color: AppConstants.primaryColor,
              strokeWidth: 2,
            ),
          ),
        )
            : Image.network(
          imageUrl.toString(),
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Center(
            child: Icon(
              Icons.category_outlined,
              color: AppConstants.primaryColor,
              size: 24.sp,
            ),
          ),
        )
            : Center(
          child: Icon(
            Icons.category_outlined,
            color: AppConstants.primaryColor,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
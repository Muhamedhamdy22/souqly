import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProductDetailsImage extends StatelessWidget {
  final dynamic imageUrl;

  const ProductDetailsImage({super.key, required this.imageUrl});

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
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
              size: 48.sp,
            ),
          ),
        )
            : Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            color: AppConstants.textHint,
            size: 48.sp,
          ),
        ),
      ),
    );
  }
}
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _activeIndex = 0;

  final List<_CarouselItem> _items = const [
    _CarouselItem(
      title: 'Fresh Vegetables',
      subtitle: 'Up to 40% off',
      emoji: '🥦',
      tag: 'Special Offer',
    ),
    _CarouselItem(
      title: 'Premium Meat',
      subtitle: 'Free delivery today',
      emoji: '🥩',
      tag: 'New Arrival',
    ),
    _CarouselItem(
      title: 'Fresh Fruits',
      subtitle: 'Buy 2 get 1 free',
      emoji: '🍎',
      tag: 'Best Deal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 130.h,
            viewportFraction: 0.9,
            autoPlay: true,
            autoPlayInterval: AppConstants.carouselAutoPlay,
            autoPlayAnimationDuration: AppConstants.animationDuration,
            enlargeCenterPage: true,
            onPageChanged: (index, _) =>
                setState(() => _activeIndex = index),
          ),
          items: _items.map((item) => _buildCarouselCard(item)).toList(),
        ),
        SizedBox(height: 10.h),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: _items.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppConstants.primaryColor,
            dotColor: AppConstants.primaryColor.withOpacity(0.3),
            dotHeight: 6.h,
            dotWidth: 6.w,
            expansionFactor: 2.5,
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselCard(_CarouselItem item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      item.tag,
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 90.w,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18.r),
                bottomRight: Radius.circular(18.r),
              ),
            ),
            child: Center(
              child: Text(item.emoji, style: TextStyle(fontSize: 48.sp)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselItem {
  final String title;
  final String subtitle;
  final String emoji;
  final String tag;

  const _CarouselItem({
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.tag,
  });
}
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_events.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  static const List<_CarouselItem> _items = [
    _CarouselItem(title: 'Fresh Vegetables', subtitle: 'Up to 40% off', emoji: '🥦', tag: 'Special Offer'),
    _CarouselItem(title: 'Premium Meat', subtitle: 'Free delivery today', emoji: '🥩', tag: 'New Arrival'),
    _CarouselItem(title: 'Fresh Fruits', subtitle: 'Buy 2 get 1 free', emoji: '🍎', tag: 'Best Deal'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final activeIndex = state.carouselIndex ?? 0;
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 150.h,
                viewportFraction: 0.9,
                autoPlay: true,
                autoPlayInterval: AppConstants.carouselAutoPlay,
                autoPlayAnimationDuration: AppConstants.animationDuration,
                enlargeCenterPage: true,
                onPageChanged: (index, _) =>
                    context.read<HomeBloc>().add(CarouselIndexChanged(index)),
              ),
              items: _items.map((item) => _buildCarouselCard(item)).toList(),
            ),
            SizedBox(height: 10.h),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
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
      },
    );
  }

  Widget _buildCarouselCard(_CarouselItem item) {
    return Builder(
      builder: (context) => Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(item.tag,
                          style: TextStyle(fontSize: 9.sp, color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 5.h),
                    Text(item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.white)),
                    SizedBox(height: 2.h),
                    Text(item.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 10.sp, color: Colors.white.withOpacity(0.85))),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
                      child: Text('Shop Now',
                          style: TextStyle(
                              fontSize: 9.sp, color: AppConstants.primaryColor, fontWeight: FontWeight.w600)),
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
              child: Center(child: Text(item.emoji, style: TextStyle(fontSize: 44.sp))),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarouselItem {
  final String title;
  final String subtitle;
  final String emoji;
  final String tag;
  const _CarouselItem({required this.title, required this.subtitle, required this.emoji, required this.tag});
}
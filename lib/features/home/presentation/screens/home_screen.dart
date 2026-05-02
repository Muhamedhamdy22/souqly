import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/home/presentation/widgets/home_app_bar.dart';
import 'package:souqly/features/home/presentation/widgets/home_carousel.dart';
import 'package:souqly/features/home/presentation/widgets/home_categories.dart';
import 'package:souqly/features/home/presentation/widgets/home_products_section.dart';
import 'package:souqly/features/home/presentation/widgets/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const HomeSearchBar(),
              SizedBox(height: 12.h),
              const HomeCarousel(),
              SizedBox(height: 14.h),
              const HomeCategories(),
              SizedBox(height: 14.h),
              const HomeProductsSection(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
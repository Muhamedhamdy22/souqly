import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  // TODO: replace with real data from CategoriesCubit
  static const List<Map<String, dynamic>> _mockCategories = [
    {'name': 'Meat', 'emoji': '🥩', 'color': 0xFFFFF0E8},
    {'name': 'Vegetables', 'emoji': '🥦', 'color': 0xFFE8F5E9},
    {'name': 'Dairy', 'emoji': '🧀', 'color': 0xFFFFF8E1},
    {'name': 'Seafood', 'emoji': '🐟', 'color': 0xFFE3F2FD},
    {'name': 'Fruits', 'emoji': '🍎', 'color': 0xFFFCE4EC},
    {'name': 'Bakery', 'emoji': '🍞', 'color': 0xFFF3E5F5},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: BlocConsumer<HomeBloc , HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return  Column(
            children: [
              _buildHeader(context),
              SizedBox(height: 10.h),
              _buildCategoryList(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppConstants.categories,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () {
              /* TODO: go to categories tab */
            },
            child: Text(
              AppConstants.seeAll,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: _mockCategories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, i) => _CategoryItem(
          name: _mockCategories[i]['name'],
          emoji: _mockCategories[i]['emoji'],
          bgColor: Color(_mockCategories[i]['color']),
          onTap: () => Navigator.pushNamed(
            context,
            Routes.productsScreenRoute,
            arguments: {
              'catId': _mockCategories[i]['name'],
              'catName': _mockCategories[i]['name'],
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String name;
  final String emoji;
  final Color bgColor;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.name,
    required this.emoji,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Center(
              child: Text(emoji, style: TextStyle(fontSize: 24.sp)),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            name,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppConstants.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

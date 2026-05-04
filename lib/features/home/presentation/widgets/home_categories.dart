import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  static const List<Color> _bgColors = [
    Color(0xFFFFF0E8),
    Color(0xFFE8F5E9),
    Color(0xFFFFF8E1),
    Color(0xFFE3F2FD),
    Color(0xFFFCE4EC),
    Color(0xFFF3E5F5),
    Color(0xFFE8F5E9),
    Color(0xFFFFF0E8),
    Color(0xFFE3F2FD),
    Color(0xFFFFF8E1),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 10.h),
            _buildCategoryList(context, state),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppConstants.categories,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppConstants.textPrimary)),
          GestureDetector(
            onTap: () {/* TODO: go to categories tab */},
            child: Text(AppConstants.seeAll,
                style: TextStyle(fontSize: 12.sp, color: AppConstants.primaryColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context, HomeState state) {
    if (state.getCategoriesRequestStatus == RequestStatus.loading) {
      return SizedBox(
        height: 80.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    final categories = state.categoriesModel?.data ?? [];

    if (categories.isEmpty) {
      return SizedBox(height: 80.h);
    }

    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, i) {
          final cat = categories[i];
          final bgColor = _bgColors[i % _bgColors.length];
          return _CategoryItem(
            name: cat.name ?? '',
            imageUrl: cat.image != null ? '${AppConstants.storageUrl}${cat.image}' : null,
            bgColor: bgColor,
            onTap: () => Navigator.pushNamed(
              context,
              Routes.productsScreenRoute,
              arguments: {
                'catId': cat.id.toString(),
                'catName': cat.name ?? '',
              },
            ),
          );
        },
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final Color bgColor;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.name,
    required this.imageUrl,
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
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(14.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.category_outlined))
                  : const Icon(Icons.category_outlined),
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 56.w,
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.sp, color: AppConstants.textSecondary, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
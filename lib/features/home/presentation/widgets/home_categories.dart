import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
      curr.getCategoriesRequestStatus != prev.getCategoriesRequestStatus,
      listener: (context, state) {
        if (state.getCategoriesRequestStatus == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Something went wrong')),
          );
        }
      },
      buildWhen: (prev, curr) =>
      curr.getCategoriesRequestStatus != prev.getCategoriesRequestStatus,
      builder: (context, state) {
        if (state.getCategoriesRequestStatus == RequestStatus.error) {
          return const SizedBox.shrink();
        }

        final categories = state.categoriesModel?.data ?? [];

        return Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 10.h),
            _buildCategoryList(context, categories),
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
          Text(
            AppConstants.categories,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () {/* TODO: go to categories tab */},
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

  Widget _buildCategoryList(BuildContext context, List<CategoryModel> categories) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (_, i) => _CategoryItem(
          category: categories[i],
          onTap: () => Navigator.pushNamed(
            context,
            Routes.productsScreenRoute,
            arguments: {
              'catId': categories[i].id,
              'catName': categories[i].name,
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const _CategoryItem({required this.category, required this.onTap});

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
              color: AppConstants.primaryLight,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.network(
                '${AppConstants.baseUrl}${category.image ?? ''}',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.category_outlined,
                  color: AppConstants.primaryColor,
                  size: 24.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            category.name ?? '',
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
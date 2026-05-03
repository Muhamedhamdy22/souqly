import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/categories/data/models/CategoryResponse.dart';
import 'package:souqly/features/categories/presentation/bloc/category_bloc.dart';
import 'package:souqly/features/categories/presentation/bloc/category_events.dart';
import 'package:souqly/features/categories/presentation/bloc/category_state.dart';
import 'package:souqly/features/categories/presentation/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const List<Color> _bgColors = [
    Color(0xFFFFF0E8),
    Color(0xFFE8F5E9),
    Color(0xFFFFF8E1),
    Color(0xFFE3F2FD),
    Color(0xFFFCE4EC),
    Color(0xFFF3E5F5),
  ];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>
        getIt<CategoryBloc>()..add(GetCategoriesEvent()),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state.getCategoriesRequestStatus == RequestStatus.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppConstants.scaffoldBg,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAppBar(),
                    _buildSearchBar(),
                    SizedBox(height: 12.h),
                    Expanded(child: _buildBody(context, state)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Text(
        AppConstants.categories,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: AppConstants.cardBg,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppConstants.borderColor),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Icon(
              Icons.search_rounded,
              color: AppConstants.textHint,
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Search categories...',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppConstants.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CategoryState state) {
    if (state.getCategoriesRequestStatus == RequestStatus.error) {
      return _buildError(state.errorMessage);
    }
    if (state.getCategoriesRequestStatus == RequestStatus.success &&
        (state.model?.data?.isEmpty ?? true)) {
      return _buildEmpty();
    }
    return _buildCategoriesGrid(context, state);
  }

  Widget _buildCategoriesGrid(BuildContext context, CategoryState state) {
    final categories = state.model?.data ?? [];
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.9,
      ),
      itemCount: categories.length,
      itemBuilder: (_, i) {
        final Data category = categories[i];
        return CategoryCard(
          name: category.name ?? '',
          imageUrl: category.image,
          bgColor: _bgColors[i % _bgColors.length],
          onTap: () => Navigator.pushNamed(
            context,
            Routes.productsScreenRoute,
            arguments: category.id.toString(),
          ),
        );
      },
    );
  }

  Widget _buildError(String? message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('⚠️', style: TextStyle(fontSize: 48.sp)),
          SizedBox(height: 12.h),
          Text(
            message ?? AppConstants.somethingWentWrong,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppConstants.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('📦', style: TextStyle(fontSize: 48.sp)),
          SizedBox(height: 12.h),
          Text(
            'No categories found',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppConstants.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
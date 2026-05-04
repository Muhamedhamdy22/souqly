import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            _buildProductGrid(context, state),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppConstants.featuredProducts,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppConstants.textPrimary)),
          GestureDetector(
            onTap: () {/* TODO: see all products */},
            child: Text(AppConstants.seeAll,
                style: TextStyle(fontSize: 12.sp, color: AppConstants.primaryColor, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, HomeState state) {
    if (state.getProductsRequestStatus == RequestStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    final products = state.productsModel?.data ?? [];

    if (products.isEmpty) {
      return Center(
        child: Text('No products found',
            style: TextStyle(fontSize: 12.sp, color: AppConstants.textSecondary)),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length > 6 ? 6 : products.length,
        itemBuilder: (_, i) {
          final product = products[i];
          return ProductCard(
            name: product.name ?? '',
            price: double.tryParse(product.price ?? '0') ?? 0,
            imageUrl: product.image?.toString(),
            onTap: () {/* TODO: navigate to product details */},
            onAddToCart: () {/* TODO: add to cart */},
          );
        },
      ),
    );
  }
}
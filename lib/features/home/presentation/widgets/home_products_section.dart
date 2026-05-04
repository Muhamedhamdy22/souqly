import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (prev, curr) =>
      curr.getProductsRequestStatus != prev.getProductsRequestStatus,
      listener: (context, state) {
        if (state.getProductsRequestStatus == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Something went wrong')),
          );
        }
      },
      buildWhen: (prev, curr) =>
      curr.getProductsRequestStatus != prev.getProductsRequestStatus,
      builder: (context, state) {
        if (state.getProductsRequestStatus == RequestStatus.error) {
          return const SizedBox.shrink();
        }

        final products = state.productsModel?.data ?? [];

        return Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10.h),
            _buildProductGrid(context, products),
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
          Text(
            AppConstants.featuredProducts,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: () {/* TODO: see all products */},
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

  Widget _buildProductGrid(BuildContext context, List<ProductModel> products) {
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
        itemCount: products.length,
        itemBuilder: (_, i) => ProductCard(
          name: products[i].name ?? '',
          price: double.tryParse(products[i].price ?? '0') ?? 0,
          oldPrice: double.tryParse(products[i].price ?? '0') ?? 0,
          rating: double.tryParse(products[i].price ?? '0') ?? 0,
          imageUrl: products[i].image != null
              ? '${AppConstants.baseUrl}${products[i].image}'
              : null,
          onTap: () {/* TODO: navigate to product details */},
          onAddToCart: () {/* TODO: add to cart */},
        ),
      ),
    );
  }
}
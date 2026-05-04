import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';
import 'package:souqly/features/products/presentation/bloc/product_bloc.dart';
import 'package:souqly/features/products/presentation/bloc/product_events.dart';
import 'package:souqly/features/products/presentation/bloc/product_state.dart';
import 'package:souqly/features/products/presentation/widgets/products_app_bar.dart';
import 'package:souqly/features/products/presentation/widgets/products_filter_bar.dart';

class ProductsScreen extends StatelessWidget {
  final String catId;

  const ProductsScreen({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) =>
        getIt<ProductBloc>()..add(GetProductsEvent(catId)),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state.productStatus == RequestStatus.loading) {
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
                  children: [
                    ProductsAppBar(categoryName: catId),
                    SizedBox(height: 12.h),
                    const ProductsFilterBar(),
                    SizedBox(height: 14.h),
                    _buildProductCount(state),
                    SizedBox(height: 10.h),
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

  Widget _buildBody(BuildContext context, ProductState state) {
    if (state.productStatus == RequestStatus.error) {
      return _buildError();
    }
    if (state.productStatus == RequestStatus.success &&
        (state.productResponse?.data?.isEmpty ?? true)) {
      return _buildEmpty();
    }
    return _buildProductGrid(context, state);
  }

  Widget _buildProductCount(ProductState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            '${state.productResponse?.data?.length ?? 0} Products',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppConstants.textSecondary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {/* TODO: open sort/filter */},
            child: Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppConstants.cardBg,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppConstants.borderColor),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.tune_rounded,
                    size: 14.sp,
                    color: AppConstants.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppConstants.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, ProductState state) {
    final products = state.productResponse?.data ?? [];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (_, i) {
          final Data product = products[i];
          return ProductCard(
            name: product.name ?? '',
            price: double.tryParse(product.price ?? '0') ?? 0,
            oldPrice: double.tryParse(product.price ?? '0') ?? 0,
            rating: 0.0,
            imageUrl: product.image,
            onTap: () => Navigator.pushNamed(
              context,
              Routes.productDetails,
              arguments: product,
            ),
            onAddToCart: () {
              // TODO: context.read<CartCubit>().addToCart(product)
            },
          );
        },
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('⚠️', style: TextStyle(fontSize: 48.sp)),
          SizedBox(height: 12.h),
          Text(
            AppConstants.somethingWentWrong,
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
            'No products found',
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
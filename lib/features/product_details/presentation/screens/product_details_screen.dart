import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/product_details/presentation/widgets/product_details_app_bar.dart';
import 'package:souqly/features/product_details/presentation/widgets/product_details_bottom_bar.dart';
import 'package:souqly/features/product_details/presentation/widgets/product_details_image.dart';
import 'package:souqly/features/product_details/presentation/widgets/product_details_info.dart';
import 'package:souqly/features/products/data/models/ProductResponse.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Data product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            const ProductDetailsAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    ProductDetailsImage(
                      imageUrl: product.image,
                    ),
                    SizedBox(height: 20.h),
                    ProductDetailsInfo(
                      name: product.name ?? '',
                      price: double.tryParse(product.price ?? '0') ?? 0,
                      oldPrice: double.tryParse(product.price ?? '0') ?? 0,
                      rating: 0.0,
                      description: product.description ?? '',
                      stock: product.stock?.quantity ?? 0,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            ProductDetailsBottomBar(
              onAddToCart: () {
                // TODO: context.read<CartCubit>().addToCart(product)
              },
            ),
          ],
        ),
      ),
    );
  }
}
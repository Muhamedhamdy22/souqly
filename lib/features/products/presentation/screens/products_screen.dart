import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/features/products/presentation/widgets/products_app_bar.dart';
import 'package:souqly/features/products/presentation/widgets/products_filter_bar.dart';

class ProductsScreen extends StatelessWidget {
  final String catId;

  const ProductsScreen({super.key, required this.catId});

  static const List<Map<String, dynamic>> _mockProducts = [
    {'name': 'Fresh Beef 500g', 'price': 85, 'oldPrice': 120, 'rating': 4.8, 'emoji': '🥩'},
    {'name': 'Fresh Milk 1L', 'price': 35, 'oldPrice': 45, 'rating': 4.5, 'emoji': '🥛'},
    {'name': 'Red Apples 1kg', 'price': 45, 'oldPrice': 60, 'rating': 4.7, 'emoji': '🍎'},
    {'name': 'Cheddar 200g', 'price': 65, 'oldPrice': 80, 'rating': 4.6, 'emoji': '🧀'},
    {'name': 'Chicken Breast', 'price': 95, 'oldPrice': 130, 'rating': 4.9, 'emoji': '🍗'},
    {'name': 'Orange Juice 1L', 'price': 40, 'oldPrice': 55, 'rating': 4.3, 'emoji': '🍊'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            ProductsAppBar(categoryName: catId),
            SizedBox(height: 12.h),
            const ProductsFilterBar(),
            SizedBox(height: 14.h),
            _buildProductCount(),
            SizedBox(height: 10.h),
            Expanded(child: _buildProductGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCount() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(
            '${_mockProducts.length} Products',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppConstants.textSecondary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {/* TODO: open sort/filter */},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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

  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.75,
        ),
        itemCount: _mockProducts.length,
        itemBuilder: (_, i) => ProductCard(
          name: _mockProducts[i]['name'],
          price: _mockProducts[i]['price'],
          oldPrice: _mockProducts[i]['oldPrice'],
          rating: _mockProducts[i]['rating'],
          emoji: _mockProducts[i]['emoji'],
          onTap: () => Navigator.pushNamed(
            context,
            Routes.productDetails,
            arguments: _mockProducts[i],
          ),
          onAddToCart: () {/* TODO: context.read<CartCubit>().addToCart(...) */},
        ),
      ),
    );
  }
}
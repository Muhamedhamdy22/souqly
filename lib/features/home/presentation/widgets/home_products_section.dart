import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/home/presentation/bloc/home_bloc.dart';
import 'package:souqly/features/home/presentation/bloc/home_events.dart';
import 'package:souqly/features/home/presentation/bloc/home_state.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({super.key});
  static const List<Map<String, dynamic>> _mockProducts = [
    {
      'name': 'Fresh Beef 500g',
      'price': 85,
      'oldPrice': 120,
      'rating': 4.8,
      'emoji': '🥩',
    },
    {
      'name': 'Fresh Milk 1L',
      'price': 35,
      'oldPrice': 45,
      'rating': 4.5,
      'emoji': '🥛',
    },
    {
      'name': 'Red Apples 1kg',
      'price': 45,
      'oldPrice': 60,
      'rating': 4.7,
      'emoji': '🍎',
    },
    {
      'name': 'Cheddar 200g',
      'price': 65,
      'oldPrice': 80,
      'rating': 4.6,
      'emoji': '🧀',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: BlocConsumer<HomeBloc , HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              _buildHeader(),
              SizedBox(height: 10.h),
              _buildProductGrid(context),
            ],
          );
        },
      ),
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

  Widget _buildProductGrid(BuildContext context) {
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
        itemCount: _mockProducts.length,
        itemBuilder: (_, i) => ProductCard(
          name: _mockProducts[i]['name'],
          price: _mockProducts[i]['price'],
          oldPrice: _mockProducts[i]['oldPrice'],
          rating: _mockProducts[i]['rating'],
          imageUrl: null,
          onTap: () {/* TODO: navigate to product details */},
          onAddToCart: () {/* TODO: context.read<CartCubit>().addToCart(...) */},
        ),
      ),
    );
  }
}
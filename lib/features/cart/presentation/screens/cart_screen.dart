import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // TODO: replace with real data from CartCubit
  static final List<Map<String, dynamic>> _mockCartItems = [
    {'name': 'Fresh Beef 500g', 'emoji': '🥩', 'price': 85, 'quantity': 2},
    {'name': 'Fresh Milk 1L', 'emoji': '🥛', 'price': 35, 'quantity': 1},
    {'name': 'Red Apples 1kg', 'emoji': '🍎', 'price': 45, 'quantity': 3},
  ];

  num get _subtotal => _mockCartItems.fold(
    0,
        (sum, item) => sum + (item['price'] as num) * (item['quantity'] as int),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            const CartAppBar(),
            Expanded(
              child: _mockCartItems.isEmpty
                  ? _buildEmptyCart()
                  : _buildCartList(),
            ),
            CartSummary(
              subtotal: _subtotal,
              onCheckout: () {
                // TODO: context.read<OrderCubit>().placeOrder(...)
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('🛒', style: TextStyle(fontSize: 64.sp)),
          SizedBox(height: 16.h),
          Text(
            AppConstants.emptyCart,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Add items to get started',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppConstants.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: _mockCartItems.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, i) => CartItemCard(
        name: _mockCartItems[i]['name'],
        emoji: _mockCartItems[i]['emoji'],
        price: _mockCartItems[i]['price'],
        quantity: _mockCartItems[i]['quantity'],
        onIncrease: () {/* TODO: CartCubit.increase() */},
        onDecrease: () {/* TODO: CartCubit.decrease() */},
        onDelete: () {/* TODO: CartCubit.remove() */},
      ),
    );
  }
}
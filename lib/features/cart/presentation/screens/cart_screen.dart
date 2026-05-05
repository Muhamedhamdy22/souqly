import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:souqly/features/cart/presentation/bloc/cart_events.dart';
import 'package:souqly/features/cart/presentation/bloc/cart_state.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:souqly/features/cart/presentation/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>()..add(GetCart()),
      child: Scaffold(
        backgroundColor: AppConstants.scaffoldBg,
        body: SafeArea(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final items = state.cartResponse?.items ?? [];
              final subtotal = double.tryParse(
                  state.cartResponse?.total ?? '0') ?? 0;

              return Column(
                children: [
                  CartAppBar(
                    onClearCart: () =>
                        context.read<CartBloc>().add(ClearCart()),
                  ),
                  Expanded(
                    child: state.getCartStatus == CartStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : items.isEmpty
                        ? _buildEmptyCart()
                        : ListView.separated(
                      padding: EdgeInsets.all(16.w),
                      itemCount: items.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (_, i) => CartItemCard(
                        item: items[i],
                        onIncrease: () => context
                            .read<CartBloc>()
                            .add(UpdateCartItem(
                          items[i].id!,
                          (items[i].quantity ?? 1) + 1,
                        )),
                        onDecrease: () {
                          final qty = items[i].quantity ?? 1;
                          if (qty > 1) {
                            context.read<CartBloc>().add(
                              UpdateCartItem(items[i].id!, qty - 1),
                            );
                          } else {
                            context
                                .read<CartBloc>()
                                .add(RemoveCartItem(items[i].id!));
                          }
                        },
                        onDelete: () => context
                            .read<CartBloc>()
                            .add(RemoveCartItem(items[i].id!)),
                      ),
                    ),
                  ),
                  if (items.isNotEmpty)
                    CartSummary(
                      subtotal: subtotal,
                      onCheckout: () {},
                    ),
                ],
              );
            },
          ),
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
          Text(AppConstants.emptyCart,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary)),
          SizedBox(height: 8.h),
          Text('Add items to get started',
              style: TextStyle(
                  fontSize: 13.sp, color: AppConstants.textSecondary)),
        ],
      ),
    );
  }
}
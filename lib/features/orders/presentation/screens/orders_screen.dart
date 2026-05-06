import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/orders/presentation/bloc/order_bloc.dart';
import 'package:souqly/features/orders/presentation/bloc/order_events.dart';
import 'package:souqly/features/orders/presentation/bloc/order_state.dart';
import 'package:souqly/features/orders/presentation/widgets/order_card.dart';
import 'package:souqly/features/orders/presentation/widgets/orders_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OrderBloc>()..add(GetOrders()),
      child: Scaffold(
        backgroundColor: AppConstants.scaffoldBg,
        body: SafeArea(
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Column(
                children: [
                  const OrdersAppBar(),
                  SizedBox(height: 8.h),
                  _buildFilterTabs(),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: state.getOrdersStatus == OrderStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : (state.ordersResponse?.data ?? []).isEmpty
                        ? _buildEmptyOrders()
                        : _buildOrdersList(state),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['All', AppConstants.statusPending,
      AppConstants.statusProcessing, AppConstants.statusDelivered];
    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (_, i) => _TabChip(
          label: tabs[i],
          isSelected: i == 0,
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildOrdersList(OrderState state) {
    final orders = state.ordersResponse?.data ?? [];
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      itemCount: orders.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, i) {
        final order = orders[i];
        return OrderCard(
          orderId: order.id.toString(),
          date: order.createdAt?.substring(0, 10) ?? '',
          total: double.tryParse(order.total ?? '0') ?? 0,
          status: order.status ?? '',
          emojis: order.items
              ?.map((e) => '🛒')
              .toList() ??
              ['🛒'],
          onTap: () {},
        );
      },
    );
  }

  Widget _buildEmptyOrders() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('📦', style: TextStyle(fontSize: 64.sp)),
          SizedBox(height: 16.h),
          Text('No orders yet',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary)),
          SizedBox(height: 8.h),
          Text('Your orders will appear here',
              style: TextStyle(
                  fontSize: 13.sp, color: AppConstants.textSecondary)),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppConstants.primaryColor : AppConstants.cardBg,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppConstants.primaryColor : AppConstants.borderColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : AppConstants.textSecondary,
          ),
        ),
      ),
    );
  }
}
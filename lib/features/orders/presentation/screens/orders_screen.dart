import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/features/orders/presentation/widgets/order_card.dart';
import 'package:souqly/features/orders/presentation/widgets/orders_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  // TODO: replace with real data from OrdersCubit
  static const List<Map<String, dynamic>> _mockOrders = [
    {
      'orderId': '10234',
      'date': 'May 1, 2026',
      'total': 265,
      'status': 'Delivered',
      'emojis': ['🥩', '🥛', '🍎'],
    },
    {
      'orderId': '10198',
      'date': 'Apr 28, 2026',
      'total': 130,
      'status': 'Shipped',
      'emojis': ['🧀', '🍗'],
    },
    {
      'orderId': '10156',
      'date': 'Apr 20, 2026',
      'total': 95,
      'status': 'Processing',
      'emojis': ['🍊'],
    },
    {
      'orderId': '10102',
      'date': 'Apr 10, 2026',
      'total': 320,
      'status': 'Cancelled',
      'emojis': ['🥩', '🥛'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            const OrdersAppBar(),
            SizedBox(height: 8.h),
            _buildFilterTabs(),
            SizedBox(height: 12.h),
            Expanded(
              child: _mockOrders.isEmpty
                  ? _buildEmptyOrders()
                  : _buildOrdersList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = [
      'All',
      AppConstants.statusPending,
      AppConstants.statusProcessing,
      AppConstants.statusDelivered,
    ];

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
          onTap: () {/* TODO: filter orders by status */},
        ),
      ),
    );
  }

  Widget _buildOrdersList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      itemCount: _mockOrders.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (_, i) => OrderCard(
        orderId: _mockOrders[i]['orderId'],
        date: _mockOrders[i]['date'],
        total: _mockOrders[i]['total'],
        status: _mockOrders[i]['status'],
        emojis: List<String>.from(_mockOrders[i]['emojis']),
        onTap: () {/* TODO: navigate to order details */},
      ),
    );
  }

  Widget _buildEmptyOrders() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('📦', style: TextStyle(fontSize: 64.sp)),
          SizedBox(height: 16.h),
          Text(
            'No orders yet',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your orders will appear here',
            style: TextStyle(
              fontSize: 13.sp,
              color: AppConstants.textSecondary,
            ),
          ),
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
            color: isSelected
                ? AppConstants.primaryColor
                : AppConstants.borderColor,
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
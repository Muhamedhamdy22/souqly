import 'package:flutter/material.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: Center(child: Text('Orders')),
    );
  }
}
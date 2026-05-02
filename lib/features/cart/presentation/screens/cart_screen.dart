import 'package:flutter/material.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: Center(child: Text('Cart')),
    );
  }
}
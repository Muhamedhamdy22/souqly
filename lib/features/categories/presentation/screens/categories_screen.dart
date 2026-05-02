import 'package:flutter/material.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: Center(child: Text('Categories')),
    );
  }
}
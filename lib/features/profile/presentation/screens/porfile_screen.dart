import 'package:flutter/material.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: Center(child: Text('Profile')),
    );
  }
}
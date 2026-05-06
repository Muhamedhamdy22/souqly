import 'dart:async';
import 'package:flutter/material.dart';
import 'package:souqly/core/cache_helper/cache_helper.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      final token = getIt<CacheHelper>().getString("token");
      Navigator.pushReplacementNamed(
        context,
        token != null ? Routes.mainRoute : Routes.signInRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
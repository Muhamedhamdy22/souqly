import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/features/profile/presentation/widgets/profile_header.dart';
import 'package:souqly/features/profile/presentation/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBar(),
              const ProfileHeader(),
              SizedBox(height: 12.h),
              _buildSection(
                title: 'Account',
                items: [
                  _MenuItem(
                    icon: Icons.person_outline_rounded,
                    label: AppConstants.editProfile,
                    onTap: () {/* TODO */},
                  ),
                  _MenuItem(
                    icon: Icons.location_on_outlined,
                    label: AppConstants.myAddresses,
                    onTap: () {/* TODO */},
                  ),
                  _MenuItem(
                    icon: Icons.payment_outlined,
                    label: AppConstants.paymentMethods,
                    onTap: () {/* TODO */},
                  ),
                  _MenuItem(
                    icon: Icons.notifications_outlined,
                    label: AppConstants.notifications,
                    onTap: () {/* TODO */},
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _buildSection(
                title: 'Support',
                items: [
                  _MenuItem(
                    icon: Icons.help_outline_rounded,
                    label: AppConstants.helpCenter,
                    onTap: () {/* TODO */},
                  ),
                  _MenuItem(
                    icon: Icons.privacy_tip_outlined,
                    label: AppConstants.privacyPolicy,
                    onTap: () {/* TODO */},
                  ),
                  _MenuItem(
                    icon: Icons.description_outlined,
                    label: AppConstants.termsConditions,
                    onTap: () {/* TODO */},
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _buildLogoutButton(context),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Text(
        AppConstants.profile,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<_MenuItem> items,
  }) {
    return Container(
      color: AppConstants.cardBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppConstants.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...items.asMap().entries.map(
                (e) => ProfileMenuItem(
              icon: e.value.icon,
              label: e.value.label,
              onTap: e.value.onTap,
              showDivider: e.key != items.length - 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      color: AppConstants.cardBg,
      child: ProfileMenuItem(
        icon: Icons.logout_rounded,
        label: AppConstants.logout,
        iconColor: AppConstants.errorColor,
        showDivider: false,
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.signInRoute);
        },
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
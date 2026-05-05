import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:souqly/features/profile/presentation/bloc/profile_event.dart';
import 'package:souqly/features/profile/presentation/bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProfileBloc>()..add(GetProfile()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.logoutStatus == ProfileStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
              context, Routes.signInRoute, (route) => false,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppConstants.scaffoldBg,
          body: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeader(context, state),
                      SizedBox(height: 24.h),
                      _buildSection('Account', [
                        _buildTile(Icons.person_outline, 'Edit Profile', () {}),
                        _buildTile(Icons.location_on_outlined, 'My Addresses', () {}),
                        _buildTile(Icons.credit_card_outlined, 'Payment Methods', () {}),
                        _buildTile(Icons.notifications_outlined, 'Notifications', () {}),
                      ]),
                      SizedBox(height: 16.h),
                      _buildSection('Support', [
                        _buildTile(Icons.help_outline, 'Help Center', () {}),
                        _buildTile(Icons.privacy_tip_outlined, 'Privacy Policy', () {}),
                        _buildTile(Icons.description_outlined, 'Terms & Conditions', () {}),
                      ]),
                      SizedBox(height: 16.h),
                      _buildLogout(context),
                      SizedBox(height: 24.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ProfileState state) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      color: AppConstants.cardBg,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.primaryLight,
                  border: Border.all(
                    color: AppConstants.primaryColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 44.sp,
                  color: AppConstants.primaryColor,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: AppConstants.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.edit, size: 12.sp, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          state.getProfileStatus == ProfileStatus.loading
              ? CircularProgressIndicator(color: AppConstants.primaryColor)
              : Column(
            children: [
              Text(
                state.user?.name ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                state.user?.email ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppConstants.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat('12', 'Orders'),
              _buildDivider(),
              _buildStat('5', 'Wishlist'),
              _buildDivider(),
              _buildStat('8', 'Reviews'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppConstants.primaryColor)),
        Text(label,
            style: TextStyle(
                fontSize: 11.sp, color: AppConstants.textSecondary)),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 30.h, width: 1, color: AppConstants.borderColor);
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(title,
              style: TextStyle(
                  fontSize: 12.sp, color: AppConstants.textSecondary)),
        ),
        Container(
          color: AppConstants.cardBg,
          child: Column(children: tiles),
        ),
      ],
    );
  }

  Widget _buildTile(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppConstants.borderColor),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: AppConstants.primaryLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: AppConstants.primaryColor, size: 18.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.textPrimary)),
            ),
            Icon(Icons.arrow_forward_ios_rounded,
                size: 14.sp, color: AppConstants.textSecondary),
          ],
        ),
      ),
    );
  }

  Widget _buildLogout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () => context.read<ProfileBloc>().add(LogoutEvent()),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppConstants.cardBg,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppConstants.borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEEEE),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.logout_rounded,
                    color: AppConstants.errorColor, size: 18.sp),
              ),
              SizedBox(width: 12.w),
              Text('Logout',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppConstants.errorColor)),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 14.sp, color: AppConstants.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
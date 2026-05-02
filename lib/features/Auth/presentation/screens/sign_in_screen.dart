import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/widget/app_button.dart';
import 'package:souqly/core/widget/app_social_button.dart';
import 'package:souqly/core/widget/app_text_field.dart';
import 'package:souqly/features/auth/presentation/widgets/auth_hero.dart';
import 'package:souqly/core/routes_managers/routes.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _obscurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHero(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeading(),
                      SizedBox(height: 20.h),
                      AppTextField(
                        label: AppConstants.email,
                        controller: _emailController,
                        hint: 'Enter your email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Email is required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 14.h),
                      ValueListenableBuilder<bool>(
                        valueListenable: _obscurePassword,
                        builder: (_, obscure, __) => AppTextField(
                          label: AppConstants.password,
                          controller: _passwordController,
                          hint: '••••••••',
                          icon: Icons.lock_outline,
                          obscureText: obscure,
                          suffixIcon: GestureDetector(
                            onTap: () =>
                            _obscurePassword.value = !_obscurePassword.value,
                            child: Icon(
                              obscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppConstants.textHint,
                              size: 18.sp,
                            ),
                          ),
                          validator: (v) {
                            if (v == null || v.isEmpty) return 'Password is required';
                            if (v.length < 6) return 'Minimum 6 characters';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _buildForgotPassword(),
                      SizedBox(height: 20.h),
                      AppButton(
                        label: AppConstants.signIn,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: context.read<AuthCubit>().signIn(...)
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      _buildDivider(),
                      SizedBox(height: 16.h),
                      _buildSocialButtons(),
                      SizedBox(height: 20.h),
                      _buildSignUpRow(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppConstants.textPrimary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Sign in to your account',
          style: TextStyle(fontSize: 13.sp, color: AppConstants.textSecondary),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {/* TODO: forgot password */},
        child: Text(
          AppConstants.forgotPassword,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppConstants.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppConstants.dividerColor)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            'or continue with',
            style: TextStyle(fontSize: 11.sp, color: AppConstants.textHint),
          ),
        ),
        const Expanded(child: Divider(color: AppConstants.dividerColor)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      children: [
        AppSocialButton(
          label: 'Google',
          color: const Color(0xFFEA4335),
          initial: 'G',
          onTap: () {/* TODO */},
        ),
        SizedBox(width: 10.w),
        AppSocialButton(
          label: 'Facebook',
          color: const Color(0xFF1877F2),
          initial: 'f',
          onTap: () {/* TODO */},
        ),
      ],
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.signUpRoute),
        child: RichText(
          text: TextSpan(
            text: AppConstants.dontHaveAccount,
            style: TextStyle(fontSize: 13.sp, color: AppConstants.textSecondary),
            children: [
              TextSpan(
                text: AppConstants.signUp,
                style: TextStyle(
                  color: AppConstants.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
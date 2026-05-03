import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/widget/app_button.dart';
import 'package:souqly/core/widget/app_text_field.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/Auth/domain/entity/signUpRequest.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_events.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _obscurePassword = ValueNotifier<bool>(true);
  final _obscureConfirm = ValueNotifier<bool>(true);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppConstants.scaffoldBg,
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildHeroBanner(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              label: AppConstants.fullName,
                              controller: nameController,
                              hint: 'Enter your name',
                              icon: Icons.person_outline,
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'Name is required';
                                return null;
                              },
                            ),
                            SizedBox(height: 14.h),
                            AppTextField(
                              label: AppConstants.email,
                              controller: emailController,
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
                            AppTextField(
                              label: AppConstants.phone,
                              controller: phoneController,
                              hint: '+20 1xx xxx xxxx',
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'Phone is required';
                                return null;
                              },
                            ),
                            SizedBox(height: 14.h),
                            ValueListenableBuilder<bool>(
                              valueListenable: _obscurePassword,
                              builder: (_, obscure, __) => AppTextField(
                                label: AppConstants.password,
                                controller: passwordController,
                                hint: 'Create password',
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
                            SizedBox(height: 14.h),
                            ValueListenableBuilder<bool>(
                              valueListenable: _obscureConfirm,
                              builder: (_, obscure, __) => AppTextField(
                                label: AppConstants.confirmPassword,
                                controller: confirmPasswordController,
                                hint: 'Repeat password',
                                icon: Icons.lock_outline,
                                obscureText: obscure,
                                suffixIcon: GestureDetector(
                                  onTap: () =>
                                  _obscureConfirm.value = !_obscureConfirm.value,
                                  child: Icon(
                                    obscure
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: AppConstants.textHint,
                                    size: 18.sp,
                                  ),
                                ),
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please confirm password';
                                  }
                                  if (v != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 24.h),
                            AppButton(
                              label: 'Create Account',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  SignUpRequest request = SignUpRequest(
                                    email: emailController.text,
                                    name: nameController.text ,
                                    password: passwordController.text,
                                    passwordConfirmation: confirmPasswordController.text,
                                    phone: phoneController.text,
                                  );
                                  context.read<AuthBloc>().add(
                                      RegisterEvent(request)
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 16.h),
                            _buildSignInRow(context),
                            SizedBox(height: 12.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppConstants.cardBg,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 14.sp,
                color: AppConstants.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            'Create Account',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      color: AppConstants.primaryColor,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      child: Text(
        'Join ${AppConstants.appName} today',
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 13.sp,
        ),
      ),
    );
  }

  Widget _buildSignInRow(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: RichText(
        text: TextSpan(
          text: AppConstants.alreadyHaveAccount,
          style: TextStyle(fontSize: 13.sp, color: AppConstants.textSecondary),
          children: [
            TextSpan(
              text: AppConstants.signIn,
              style: TextStyle(
                color: AppConstants.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
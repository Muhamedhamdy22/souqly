import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppConstants.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: TextStyle(fontSize: 13.sp, color: AppConstants.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 13.sp, color: AppConstants.textHint),
            prefixIcon: Icon(icon, color: AppConstants.primaryColor, size: 18.sp),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppConstants.cardBg,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            border: _border(AppConstants.borderColor),
            enabledBorder: _border(AppConstants.borderColor),
            focusedBorder: _border(AppConstants.primaryColor, width: 1.5),
            errorBorder: _border(AppConstants.errorColor),
            focusedErrorBorder: _border(AppConstants.errorColor, width: 1.5),
          ),
        ),
      ],
    );
  }
}
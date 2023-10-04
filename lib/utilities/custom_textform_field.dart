import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    this.isSecure = false,
    this.suffixIcon,
    this.textInputType = TextInputType.name,
    required this.focusNode,
  });

  final String? hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  final bool isSecure;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: isSecure,
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorMaxLines: 2,
        hintStyle: GoogleFonts.inter(
          color: AppColors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: AppDecorations.textFormFieldDecoration,
        disabledBorder: AppDecorations.textFormFieldDecoration,
        focusedBorder: AppDecorations.textFormFieldDecoration,
        errorBorder: AppDecorations.textFormFieldDecoration,
        border: AppDecorations.textFormFieldDecoration,
      ),
      validator: validator,
    );
  }
}

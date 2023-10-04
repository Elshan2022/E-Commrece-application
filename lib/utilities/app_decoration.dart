import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';

class AppDecorations {
  static OutlineInputBorder get textFormFieldDecoration {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.primaryDark,
      ),
      borderRadius: BorderRadius.circular(15.w),
    );
  }

  static OutlineInputBorder get productTextFormFieldDecoration {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.grey,
      ),
      borderRadius: BorderRadius.circular(15.w),
    );
  }

  static OutlineInputBorder get searchTextFieldDecoration {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.black.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(15.w),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonStyle {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
      ),
    );
  }

  static Decoration get pageDecoration => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.center,
          colors: [AppColors.gradientLight, AppColors.gradientDark],
        ),
      );
}

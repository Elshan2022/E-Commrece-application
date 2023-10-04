import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class HelperMethods {
  static showDoneDialog() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 250.w,
            height: 150.h,
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              gradient: const LinearGradient(
                end: Alignment.center,
                begin: Alignment.center,
                colors: [
                  AppColors.gradientLight,
                  AppColors.gradientDark,
                ],
              ),
            ),
            child: Center(
              child: Icon(Icons.done, color: Colors.green, size: 50.w),
            ),
          ),
        ],
      ),
    );
  }

  static showLoadingDialog() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 250,
            height: 150.h,
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              gradient: const LinearGradient(
                end: Alignment.center,
                begin: Alignment.center,
                colors: [
                  AppColors.gradientLight,
                  AppColors.gradientDark,
                ],
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            ),
          ),
        ],
      ),
    );
  }

  static showSnackBar(
      BuildContext context, String? message, Color backGroundColor) {
    Flushbar(
      duration: const Duration(seconds: 2),
      borderRadius: BorderRadius.circular(15.w),
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.all(20.w),
      backgroundColor: backGroundColor,
      messageText: Center(
        child: AppText(
          maxLines: 3,
          text: message ?? "",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ).show(context);
  }

  static showCustomDialog(
    String text1,
    String text2,
    String title,
    Function()? onPressed1,
    Function()? onPressed2,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.w)),
          gradient: const LinearGradient(
            colors: [AppColors.gradientLight, AppColors.gradientDark],
            begin: Alignment.center,
            end: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              child: AppText(
                text: title,
                maxLines: 2,
                color: AppColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 130.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white.withOpacity(0.5)),
                    onPressed: onPressed1,
                    child: AppText(
                      text: text1,
                      color: AppColors.primaryLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 130.h,
                  child: ElevatedButton(
                    onPressed: onPressed2,
                    child: AppText(
                      text: text2,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  static loadingPage() {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.pageDecoration,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
      ),
    );
  }
}

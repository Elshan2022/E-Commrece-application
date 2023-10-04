import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class UserInformation extends StatelessWidget {
  const UserInformation(
      {super.key, required this.label, required this.userInformation});
  final String label;
  final String userInformation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.w, top: 10.h, bottom: 10.h),
            child: Align(
              alignment: Alignment.topLeft,
              child: AppText(
                text: label,
                color: AppColors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryDark,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: AppText(
                  maxLines: 1,
                  text: userInformation,
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

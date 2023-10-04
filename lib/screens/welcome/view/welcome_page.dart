import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shopping_application/gen/assets.gen.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/welcome/providers/page_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/dimensions.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends ConsumerWidget {
  WelcomePage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(pageProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientLight, AppColors.gradientDark],
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                ref.read(pageProvider.notifier).changePage(value);
              },
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.welcome1.path),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      margin: EdgeInsets.only(top: Dimensions.height * 0.2),
                      width: 300.w,
                      height: 330.h,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: const AppText(
                        textAlign: TextAlign.center,
                        text: "Do shopping on the day and time you want",
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    _buildToLogin(context, 0, "Next")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.welcome2.path),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      margin: EdgeInsets.only(top: Dimensions.height * 0.2),
                      width: 300.w,
                      height: 330.h,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: const AppText(
                        textAlign: TextAlign.center,
                        text: "Daily discounts are waiting for you",
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    _buildToLogin(context, 1, "Next"),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Assets.images.welcome3.path),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      margin: EdgeInsets.only(top: Dimensions.height * 0.2),
                      width: 300.w,
                      height: 330.h,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 80.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: const AppText(
                        textAlign: TextAlign.center,
                        text: "You order, we will deliver",
                        color: AppColors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    _buildToLogin(context, 2, "Get start"),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.height * 0.95,
                left: Dimensions.width * 0.4,
              ),
              child: DotsIndicator(
                position: state.page,
                decorator: const DotsDecorator(
                  color: AppColors.grey,
                  activeColor: AppColors.primaryLight,
                ),
                dotsCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildToLogin(BuildContext context, int index, String title) {
    return InkWell(
      onTap: () {
        if (index < 2) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          context.pushReplacementNamed(RoutesName.login);
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w),
        width: double.infinity,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: AppColors.primaryLight,
        ),
        child: Center(
          child: AppText(
            text: title,
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/profile/model/user_information_model.dart';
import 'package:flutter_shopping_application/screens/profile/providers/get_user_information.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';
import 'package:flutter_shopping_application/screens/profile/view/user_information.dart';
import 'package:flutter_shopping_application/screens/registration/service/firebase_auth_service.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/dimensions.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});
  final FireBaseAuthService _authService = FireBaseAuthService();

  _logOut(BuildContext context) async {
    try {
      await _authService.logOut();
      context.pushReplacementNamed(RoutesName.welcome);
      context.pop();
    } catch (e) {
      HelperMethods.showSnackBar(context, e.toString(), Colors.red);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<UserInformationModel?>(
      future:
          ref.read(getUserInformationProvider.notifier).getUserInformation(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HelperMethods.loadingPage();
        } else if (!snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: AppDecorations.pageDecoration,
          );
        } else {
          final name = snapshot.data!.name;
          final surname = snapshot.data!.surname;
          final email = snapshot.data!.email;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: AppDecorations.pageDecoration,
            child: Column(
              children: [
                _profileImage(ref),
                UserInformation(label: "Email", userInformation: email ?? ""),
                UserInformation(label: "Name", userInformation: name ?? ""),
                UserInformation(
                    label: "Surname", userInformation: surname ?? ""),
                SizedBox(height: 20.h),
                Divider(
                  indent: 16.w,
                  endIndent: 16.w,
                  color: AppColors.grey.withOpacity(0.6),
                ),
                _logOutButton(context),
              ],
            ),
          );
        }
      }),
    );
  }

  InkWell _logOutButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return HelperMethods.showCustomDialog(
              "Cancel",
              "Confirm",
              "Do you want to log out ?",
              () => context.pop(),
              () async {
                await _logOut(context);
              },
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: AppColors.primaryDark,
        ),
        child: const Center(
          child: AppText(
            text: "Log out",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  _profileImage(WidgetRef ref) {
    var userImage = ref.watch(userImageProvider);
    return InkWell(
      onTap: () {
        ref.read(userImageProvider.notifier).setPhoto();
      },
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height * 0.15),
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              userImage.isEmpty
                  ? "https://cdn.landesa.org/wp-content/uploads/default-user-image.png"
                  : userImage,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFacebookGoogle extends StatelessWidget {
  const LoginFacebookGoogle(
      {super.key, required this.iconPath, required this.onPressed});
  final String? iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(iconPath ?? ""),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/view/categories_widget.dart';
import 'package:flutter_shopping_application/screens/home/view/products.dart';
import 'package:flutter_shopping_application/screens/home/view/search_text_field.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppDecorations.pageDecoration,
        child: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //profile image
                Container(
                  width: 45.w,
                  height: 42.w,
                  margin: EdgeInsets.only(top: 55.h),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"))),
                ),
                //constant text
                Container(
                  height: 40.h,
                  margin: EdgeInsets.only(top: 28.h),
                  child: const AppText(
                    text: "Match your style",
                    color: AppColors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10.h),
                //search textFromField
                const SearchTextFormField(),
                //categories
                const CategoriesWidget(),
                SizedBox(height: 20.h),
                const ProductsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderProductDescription extends ConsumerWidget {
  const OrderProductDescription({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(filteredProductsProvider);
    String? productDescription = filterList![index].description ?? "";
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h, left: 16.w),
            child: const AppText(
              text: "Description",
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100.h, maxHeight: 300.h),
              child: SingleChildScrollView(
                child: Text(
                  productDescription,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

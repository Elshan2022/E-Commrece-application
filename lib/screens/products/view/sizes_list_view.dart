import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/providers/sizes_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class SizesListView extends ConsumerWidget {
  const SizesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizesList = ref.watch(sizesProvider);
    final selectedSize = ref.watch(selectedSizeProvider);
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      height: 55.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizesList.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedSize.sizeIndex;
          return InkWell(
            onTap: () {
              ref
                  .read(selectedSizeProvider.notifier)
                  .setSelectedSize(sizesList[index], index);
            },
            child: Container(
              width: 50.w,
              height: 50.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryDark : null,
                border: Border.all(color: AppColors.primaryDark),
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Center(
                child: AppText(
                  text: sizesList[index],
                  color: isSelected ? Colors.white : AppColors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/home/providers/categories_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesList = ref.watch(categoriesProvider);
    final state = ref.watch(selectedCategoriesProvider);

    return Container(
      margin: EdgeInsets.only(top: 29.h),
      width: double.infinity,
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          final isSelected = index == state.categoriesIndex;

          return InkWell(
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 200), () {
                ref
                    .read(selectedCategoriesProvider.notifier)
                    .setSelectedCategories(index, categoriesList[index]);
              });

              ref.watch(filteredProductsProvider);
            },
            child: Container(
              height: 32.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryDark : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(14.w),
              ),
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(10.w),
              child: AppText(
                text: categoriesList[index],
                color: isSelected ? Colors.white : AppColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }
}

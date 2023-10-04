import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_categorie_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class ProductCategories extends ConsumerWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesList = ref.watch(productCategoriesProvider);
    final selectedCategories = ref.watch(selectedProductCategoriesProvider);

    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: double.infinity,
      height: 60.h,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = index == selectedCategories.categoriesIndex;
          return InkWell(
            onTap: () {
              ref
                  .read(selectedProductCategoriesProvider.notifier)
                  .setProductCategories(
                    categoriesList[index],
                    index,
                  );
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryDark : null,
                border: isSelected ? null : Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(20.w),
              ),
              child: Center(
                child: AppText(
                  text: categoriesList[index],
                  color: isSelected ? Colors.white : AppColors.black,
                  fontSize: 16,
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

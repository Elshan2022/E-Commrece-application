import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_detail_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class ProductDetailList extends ConsumerWidget {
  const ProductDetailList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailList = ref.watch(productDetailProvider);
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productDetailList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _productColor(ref, index),
              _productColorName(ref, index),
              _productSize(ref, index),
              _productQuantity(ref, index),
              _deleteButton(ref, index),
            ],
          ),
        );
      },
    );
  }

  AppText _productSize(WidgetRef ref, int index) {
    final productDetailList = ref.watch(productDetailProvider);

    return AppText(
      text: productDetailList[index].size,
      color: AppColors.grey,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );
  }

  AppText _productColorName(WidgetRef ref, int index) {
    final productDetailList = ref.watch(productDetailProvider);

    return AppText(
      text: productDetailList[index].colorName,
      color: AppColors.grey,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );
  }

  Container _productColor(WidgetRef ref, int index) {
    final productDetailList = ref.watch(productDetailProvider);
    final color = int.parse(productDetailList[index].colorCode);

    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Color(color)),
    );
  }

  IconButton _deleteButton(WidgetRef ref, int index) {
    return IconButton(
      onPressed: () {
        ref.read(productDetailProvider.notifier).removeProduct(index);
      },
      icon: const Icon(Icons.close, color: AppColors.grey),
    );
  }

  AppText _productQuantity(WidgetRef ref, int index) {
    final productDetailList = ref.watch(productDetailProvider);

    return AppText(
      text: productDetailList[index].quantity.toString(),
      color: AppColors.grey,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }
}

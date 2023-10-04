import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/gen/assets.gen.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_quantity_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class OrderQuantityWidget extends ConsumerWidget {
  const OrderQuantityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderedQuantity = ref.watch(quantityProvider);
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 10.h,
              left: 16.w,
            ),
            child: const AppText(
              text: "Quantity",
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: Row(
              children: [
                _quantityIcons(Assets.icons.add.path, () {
                  ref.read(quantityProvider.notifier).increment();
                }),
                Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: AppText(
                    text: orderedQuantity.quantity.toString(),
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _quantityIcons(Assets.icons.minimize.path, () {
                  ref.read(quantityProvider.notifier).decrement();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _quantityIcons(String iconPath, Function()? onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5.w),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Image.asset(iconPath, width: 25.w, height: 25.w),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/order_product_total_price.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class OrderProductTotalWidget extends ConsumerWidget {
  const OrderProductTotalWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(orderProductTotalPriceProvider(index));
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: const AppText(
              text: "Total price",
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppText(
            text: "$totalPrice (\$)",
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

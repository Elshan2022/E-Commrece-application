import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/basket/providers/grand_total_price_provider.dart';
import 'package:flutter_shopping_application/screens/basket/view/cart_products_list_view.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class BasketPage extends ConsumerWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(grandTotalProvider);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: AppDecorations.pageDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            const CartProductsListView(),
            _grandTotal(totalPrice),
            _checkOutButton(),
          ],
        ),
      ),
    );
  }

  Container _checkOutButton() {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {},
        child: const AppText(
          text: "Check out",
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  FittedBox _grandTotal(double totalPrice) {
    return FittedBox(
      child: Wrap(
        spacing: 110,
        children: [
          const AppText(
            text: "Grand total:",
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          AppText(
            text: "$totalPrice (\$)",
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }

  Align _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 45.h),
        child: const AppText(
          text: "My cart",
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

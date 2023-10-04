import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_color_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class OrderProductColorWidget extends ConsumerWidget {
  const OrderProductColorWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(filteredProductsProvider);
    final orderedColor = ref.watch(orderedColorProvider);
    final filterListLength = filterList![index].productDetailList!.length;
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: const AppText(
              text: "Color",
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ListView.builder(
              itemCount: filterListLength,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, colorIndex) {
                final colorCode =
                    filterList[index].productDetailList![colorIndex].colorCode;
                final colorName =
                    filterList[index].productDetailList![colorIndex].colorName;

                var isSelected = colorCode == orderedColor!.colorCode;
                return InkWell(
                  onTap: () {
                    ref
                        .read(orderedColorProvider.notifier)
                        .setProductColor(colorName, colorCode);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              width: 3,
                              color: const Color(0xFFB4B4B4),
                            )
                          : null,
                    ),
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(int.parse(colorCode)),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_size_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class OrderProductSizeWidget extends ConsumerWidget {
  const OrderProductSizeWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterList = ref.watch(filteredProductsProvider);
    final orderedSize = ref.watch(orderedSizeProvider);
    final filterListLength = filterList![index].productDetailList!.length;

    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: const AppText(
              text: "Size",
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
              itemBuilder: (context, sizeIndex) {
                final filterListSize =
                    filterList[index].productDetailList![sizeIndex].size;
                final isSelected =
                    filterListSize == orderedSize!.orderedSizeName;
                return InkWell(
                  onTap: () {
                    ref
                        .read(orderedSizeProvider.notifier)
                        .setOrderedSize(filterListSize, sizeIndex);
                  },
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: AppText(
                        text: filterListSize,
                        color:
                            isSelected ? AppColors.primaryDark : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

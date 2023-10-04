import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/providers/color_provider.dart';

class ColorListView extends ConsumerWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorProvider);
    final selectedColor = ref.watch(selectedColorProvider);
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      height: 55.h,
      child: ListView.builder(
        itemCount: colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected =
              colorList[index].colorCode == selectedColor.colorCode;
          return InkWell(
            onTap: () {
              ref.read(selectedColorProvider.notifier).selectedColor(
                    colorList[index].colorName.toString(),
                    colorList[index].colorCode,
                  );
            },
            child: Container(
              width: 50.w,
              height: 50.w,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: Color(int.parse(colorList[index].colorCode)),
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white)
                  : null,
            ),
          );
        },
      ),
    );
  }
}

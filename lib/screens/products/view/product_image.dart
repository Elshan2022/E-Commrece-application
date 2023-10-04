import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_image_provider.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';

class ProductImage extends ConsumerWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(productImageProvider);
    return InkWell(
      onTap: () async {
        await ref.read(productImageProvider.notifier).selectImageFromGallery();
      },
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: AppColors.grey),
        ),
        child: (image != null)
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: FileImage(image),
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 40.w),
                  const AppText(
                    text: "Add product's image",
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
      ),
    );
  }
}

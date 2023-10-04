import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/products/model/product_detail_model.dart';
import 'package:flutter_shopping_application/screens/products/providers/color_provider.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_detail_provider.dart';
import 'package:flutter_shopping_application/screens/products/providers/sizes_provider.dart';
import 'package:flutter_shopping_application/screens/products/view/color_list_view.dart';
import 'package:flutter_shopping_application/screens/products/view/sizes_list_view.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';

class ProductBottomSheet extends ConsumerWidget {
  ProductBottomSheet({super.key});
  final TextEditingController _quantity = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSize = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: bottomSize),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Container(
          margin: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _title("Size"),
              const SizesListView(),
              _title("Color"),
              const ColorListView(),
              _title("Quantity"),
              _quantityTextField(),
              _addProduct(ref, context),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Container _quantityTextField() {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: TextFormField(
        controller: _quantity,
        focusNode: _focusNode,
        cursorColor: AppColors.grey,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$'))
        ],
        decoration: InputDecoration(
          hintText: "Quantity",
          enabledBorder: AppDecorations.textFormFieldDecoration,
          disabledBorder: AppDecorations.textFormFieldDecoration,
          focusedBorder: AppDecorations.textFormFieldDecoration,
          errorBorder: AppDecorations.textFormFieldDecoration,
          border: AppDecorations.textFormFieldDecoration,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Quantity is required";
          } else {
            return null;
          }
        },
      ),
    );
  }

  SizedBox _addProduct(WidgetRef ref, BuildContext context) {
    final sizeState = ref.read(selectedSizeProvider);
    final colorState = ref.read(selectedColorProvider);
    final productNotifier = ref.read(productDetailProvider.notifier);

    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_quantity.text.isEmpty &&
              sizeState.sizeName.isEmpty &&
              colorState.colorCode.isEmpty) {
            HelperMethods.showSnackBar(
              context,
              "Please, check all fields",
              Colors.red,
            );
          } else {
            productNotifier.addProductInformation(
                ProductDetailModel(
                  colorCode: colorState.colorCode,
                  colorName: colorState.colorName.toString(),
                  size: sizeState.sizeName,
                  quantity: int.parse(_quantity.text),
                ),
                context);
          }
        },
        child: const AppText(
          text: "Add",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Container _title(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: AppText(
        text: title,
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.w),
        topRight: Radius.circular(15.w),
      ),
      gradient: const LinearGradient(
        end: Alignment.center,
        begin: Alignment.center,
        colors: [AppColors.gradientLight, AppColors.gradientDark],
      ),
    );
  }
}

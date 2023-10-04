import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/add_to_cart_button.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/order_product_color_widget.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/order_product_description.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/order_product_quantity.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/order_product_size_widget.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/order_product_total_amount.dart';
import 'package:flutter_shopping_application/screens/products/model/stored_product_model.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInformationPage extends ConsumerStatefulWidget {
  const ProductInformationPage({super.key, required this.index});

  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductInformationPageState();
}

class _ProductInformationPageState
    extends ConsumerState<ProductInformationPage> {
  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(allProductsProvider);
    final filterList = ref.watch(filteredProductsProvider);

    return Material(
      child: Container(
        decoration: AppDecorations.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productImage(filterList, productList, context),
              _productPrice(filterList, productList),
              _productName(filterList!, productList),
              OrderProductSizeWidget(index: widget.index),
              OrderProductColorWidget(index: widget.index),
              const OrderQuantityWidget(),
              OrderProductDescription(index: widget.index),
              OrderProductTotalWidget(index: widget.index),
              AddToCart(index: widget.index),
            ],
          ),
        ),
      ),
    );
  }

  Container _productImage(List<StoredProductModel>? filterList,
      List<StoredProductModel>? productList, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.w),
              bottomRight: Radius.circular(25.w),
            ),
            child: Image.network(
              filterList!.isEmpty
                  ? productList![widget.index].imageUrl.toString()
                  : filterList[widget.index].imageUrl.toString(),
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.cover,
            ),
          ),
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              margin: EdgeInsets.only(top: 40.h, left: 20.h),
              padding: EdgeInsets.only(left: 5.h),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryDark),
              child: const Center(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _productName(
    List<StoredProductModel> filterList,
    List<StoredProductModel>? productList,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 30.h),
      child: Text(
        filterList.isEmpty
            ? "${productList![widget.index].productName} (${productList[widget.index].manufacture})"
            : "${filterList[widget.index].productName} (${filterList[widget.index].manufacture})",
        style: GoogleFonts.inter(
          color: AppColors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container _productPrice(List<StoredProductModel>? filterList,
      List<StoredProductModel>? productList) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
      child: Text(
        filterList!.isEmpty
            ? "${productList![widget.index].price} \$"
            : "${filterList[widget.index].price} \$",
        style: GoogleFonts.inter(
          color: AppColors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

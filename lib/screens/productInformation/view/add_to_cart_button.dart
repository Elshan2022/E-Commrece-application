import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/cart_item_model.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/cart_item_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/order_product_total_price.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_color_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_quantity_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_size_provider.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';

class AddToCart extends ConsumerWidget {
  const AddToCart({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderedSize = ref.watch(orderedSizeProvider);
    final orderColor = ref.watch(orderedColorProvider);
    final orderedQuantity = ref.watch(quantityProvider);
    final filterList = ref.watch(filteredProductsProvider);
    return Container(
      width: double.infinity,
      height: 65.h,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      child: ElevatedButton(
        onPressed: () async {
          var totalPrice = ref.watch(orderProductTotalPriceProvider(index));
          var productId = filterList![index].uuid;
          var price = filterList[index].price;
          var productName = filterList[index].productName;
          var imageUrl = filterList[index].imageUrl;
          var quantity = orderedQuantity.quantity;
          var colorCode = orderColor!.colorCode;
          var colorName = orderColor.colorName;
          var size = orderedSize!.orderedSizeName;
          final addToCart = ref.read(cartItemProvider.notifier);
          showDialog(
            context: context,
            builder: (context) {
              return FutureBuilder(
                future: addToCart.addToCartItem(
                  CartItemModel(
                    totalPrice: totalPrice ,
                    productId: productId!,
                    quantity: quantity,
                    colorCode: colorCode,
                    colorName: colorName,
                    size: size,
                    price: price!,
                    productName: productName!,
                    imageUrl: imageUrl!,
                  ),
                ),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.done) {
                    return HelperMethods.showDoneDialog();
                  } else {
                    return HelperMethods.showLoadingDialog();
                  }
                },
              );
            },
          );
        },
        child: const AppText(
          text: "Add to cart",
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

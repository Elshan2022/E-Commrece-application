import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/products/model/product_detail_model.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';
import 'package:go_router/go_router.dart';

class ProductDetailNotifier extends StateNotifier<List<ProductDetailModel>> {
  ProductDetailNotifier() : super([]);

  addProductInformation(ProductDetailModel model, BuildContext context) {
    final isDuplicate = state.any(
      (element) {
        if (element.colorCode == model.colorCode &&
            element.size == model.size) {
          return true;
        } else {
          return false;
        }
      },
    );
    if (isDuplicate == false) {
      state = [...state, model];

     
      context.pop();
    } else {
      HelperMethods.showSnackBar(
        context,
        "You are trying to add a product in same color and size",
        Colors.red,
      );
      context.pop();
    }
  }

  removeProduct(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }
}

final productDetailProvider =
    StateNotifierProvider.autoDispose<ProductDetailNotifier, List<ProductDetailModel>>(
        (ref) {
  return ProductDetailNotifier();
});

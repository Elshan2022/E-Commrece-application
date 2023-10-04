import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/ordered_color_model.dart';

final orderedColorProvider =
    StateNotifierProvider.autoDispose<OrderedColorNotifier, OrderedColorModel?>((ref) {
  return OrderedColorNotifier();
});

class OrderedColorNotifier extends StateNotifier<OrderedColorModel?> {
  OrderedColorNotifier()
      : super(const OrderedColorModel(colorCode: "", colorName: ""));

  setProductColor(String colorName, String colorCode) {
    state = state!.copyWith(colorCode: colorCode, colorName: colorName);
  }
}

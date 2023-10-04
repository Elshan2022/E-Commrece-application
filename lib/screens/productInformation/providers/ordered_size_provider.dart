import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/ordered_size_model.dart';

final orderedSizeProvider =
    StateNotifierProvider.autoDispose<OrderedSizeNotifier, OrderedSizeModel?>(
        (ref) {
  return OrderedSizeNotifier();
});

class OrderedSizeNotifier extends StateNotifier<OrderedSizeModel?> {
  OrderedSizeNotifier()
      : super(
            const OrderedSizeModel(orderedSizeName: "", orderedSizeIndex: -1));

  setOrderedSize(String size, int index) {
    state = state!.copyWith(orderedSizeIndex: index, orderedSizeName: size);
  }
}

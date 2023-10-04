import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/ordered_quantity_model.dart';

final quantityProvider = StateNotifierProvider.autoDispose<
    OrderedQuantityNotifier, OrderedQuantityModel>((ref) {
  return OrderedQuantityNotifier();
});

class OrderedQuantityNotifier extends StateNotifier<OrderedQuantityModel> {
  OrderedQuantityNotifier() : super(const OrderedQuantityModel(quantity: 0));

  increment() {
    state = state.copyWith(quantity: state.quantity + 1);
  }

  decrement() {
    if (!(state.quantity <= 0)) {
      state = state.copyWith(quantity: state.quantity - 1);
    }
  }
}

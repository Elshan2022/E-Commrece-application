import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/basket/providers/all_cart_items_provider.dart';

final grandTotalProvider = Provider<double>((ref) {
  var totalPrice = 0.0;
  final cartList = ref.watch(allCartItemsProvider);
  cartList?.forEach((element) {
    totalPrice += double.parse(element.totalPrice);
  });

  return totalPrice;
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/productInformation/providers/ordered_quantity_provider.dart';

final orderProductTotalPriceProvider =
    Provider.family.autoDispose<String, int?>((ref, index) {
  final filterList = ref.watch(filteredProductsProvider);
  final quantity = ref.watch(quantityProvider);
  final price = int.parse(filterList?[index!].price ?? "");

  var totalPrice = (quantity.quantity * price).toDouble();
  return totalPrice.toStringAsFixed(2);
}); 



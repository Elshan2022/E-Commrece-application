import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/home/providers/all_products_provider.dart';
import 'package:flutter_shopping_application/screens/products/model/stored_product_model.dart';

final searchProvider =
    Provider.family.autoDispose<List<StoredProductModel>?, String?>((ref, searchQuery) {
  final allProductsList = ref.watch(allProductsProvider);
  final query = searchQuery!.toLowerCase();
  return allProductsList!.where((element) {
    final productName = element.productName!.toLowerCase();
    return productName.contains(query);
  }).toList();
});

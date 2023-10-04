import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/products/model/product_categorie_model.dart';

final productCategoriesProvider = Provider<List<String>>((ref) {
  return ["Shoes", "Jeans", "Jacket", "Sweaters", "Blouses", "Coats"];
});

class ProductCategoriesNotifier extends StateNotifier<ProductCategoriesModel> {
  ProductCategoriesNotifier()
      : super(const ProductCategoriesModel(
            categoriesName: "", categoriesIndex: -1));

  setProductCategories(String categoriesName, int index) {
    state = state.copyWith(
      categoriesIndex: index,
      categoriesName: categoriesName,
    );
  }
}

final selectedProductCategoriesProvider =
    StateNotifierProvider.autoDispose<ProductCategoriesNotifier, ProductCategoriesModel>(
        (ref) {
  return ProductCategoriesNotifier();
});

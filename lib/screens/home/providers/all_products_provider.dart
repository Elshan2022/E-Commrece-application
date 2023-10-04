import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/home/providers/categories_provider.dart';
import 'package:flutter_shopping_application/screens/products/model/product_detail_model.dart';
import 'package:flutter_shopping_application/screens/products/model/stored_product_model.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';

final allProductsProvider =
    StateNotifierProvider<AllProductsNotifier, List<StoredProductModel>?>(
        (ref) {
  return AllProductsNotifier(ref);
});



class AllProductsNotifier extends StateNotifier<List<StoredProductModel>?> {
  AllProductsNotifier(this.ref) : super([]);

  final Ref ref;

  fetchAllProducts() async {
    final fireStore = ref.watch(cloudFiresStoreInstance);

    final snapshot = await fireStore.collection("products").get();
    final snapshotList = snapshot.docs;

    final list = snapshotList.map((product) {
      return StoredProductModel(
        categories: product.get("categories"),
        description: product.get("description"),
        imageUrl: product.get("productImage"),
        manufacture: product.get("manufacture"),
        price: product.get("price"),
        productDetailList: (product.get("productDetails") as List)
            .map((e) => ProductDetailModel.fromJson(e))
            .toList(),
        productName: product.get("productName"),
        uuid: product.get("id"),
      );
    }).toList();

    state = [...list];
  }
}

//filtered provider

final filteredProductsProvider =
    Provider.autoDispose<List<StoredProductModel>?>((ref) {
  final allProducts = ref.watch(allProductsProvider);
  final category = ref.watch(selectedCategoriesProvider);

  if (category.categoriesName == "All") {
    return allProducts;
  } else {
    return allProducts?.where((product) {
      return product.categories?.contains(category.categoriesName) ?? false;
    }).toList();
  }
});

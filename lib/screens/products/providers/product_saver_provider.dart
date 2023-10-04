import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/exception/custom_exception.dart';
import 'package:flutter_shopping_application/screens/products/model/product_model.dart';
import 'package:flutter_shopping_application/screens/products/providers/product_image_provider.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';

final productProvider =
    StateNotifierProvider.autoDispose<ProductSaverNotifier, void>((ref) {
  return ProductSaverNotifier(ref);
});

class ProductSaverNotifier extends StateNotifier<void> {
  ProductSaverNotifier(this.ref) : super(null);

  final Ref ref;

  Future<void> saveProduct(ProductModel product) async {
    final fireStore = ref.watch(cloudFiresStoreInstance);
    final storage = ref.watch(firebaseStorageProvider);
    final productImagePro = ref.read(productImageProvider);

    try {
      Reference reference = storage
          .ref()
          .child("productsImages")
          .child("${product.productName}.jpg");

      await reference.putFile(productImagePro!);
      final productImage = await reference.getDownloadURL();

      await fireStore.collection("products").add({
        "productImage": productImage,
        "productName": product.productName,
        "manufacture": product.manufacture,
        "price": product.price,
        "categories": product.categories,
        "description": product.description,
        "id": product.uuid,
        "productDetails": product.productDetailList!.map((e) => e.toJson()),
      });
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}

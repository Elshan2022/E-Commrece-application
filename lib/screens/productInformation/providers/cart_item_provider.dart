import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/cart_item_model.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';

final cartItemProvider =
    StateNotifierProvider<CartItemNotifier, CartItemModel?>((ref) {
  return CartItemNotifier(ref);
});

class CartItemNotifier extends StateNotifier<CartItemModel?> {
  CartItemNotifier(this.ref) : super(null);

  final Ref ref;

  addToCartItem(CartItemModel model) async {
    final cloudFireStore = ref.watch(cloudFiresStoreInstance);
    FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
    final currentUser = fireBaseAuth.currentUser;
    final currentUserId = currentUser!.uid;

    await cloudFireStore
        .collection("users")
        .doc(currentUserId)
        .collection("cartItems")
        .doc(model.productId)
        .set(model.toJson());
  }
}

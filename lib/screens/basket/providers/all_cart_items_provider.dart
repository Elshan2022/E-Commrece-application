import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/productInformation/model/cart_item_model.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';

final allCartItemsProvider =
    StateNotifierProvider<AllCartItemNotifier, List<CartItemModel>?>((ref) {
  return AllCartItemNotifier(ref);
});

class AllCartItemNotifier extends StateNotifier<List<CartItemModel>?> {
  AllCartItemNotifier(this.ref) : super([]);

  final Ref ref;

  Future<List<CartItemModel>?> getAllCartItems() async {
    final cloudFireStore = ref.watch(cloudFiresStoreInstance);
    final auth = FirebaseAuth.instance;
    final currentUserId = auth.currentUser!.uid;

    QuerySnapshot snapShot = await cloudFireStore
        .collection("users")
        .doc(currentUserId)
        .collection("cartItems")
        .get();

    final snapSnapShotList = snapShot.docs;

    state = snapSnapShotList
        .map((product) =>
            CartItemModel.fromJson(product.data() as Map<String, dynamic>))
        .toList();

    return state;
  }

  deleteProduct(String uuid) async {
    final cloudFireStore = ref.watch(cloudFiresStoreInstance);
    FirebaseAuth auth = FirebaseAuth.instance;
    final userId = auth.currentUser!.uid;

    await cloudFireStore
        .collection("users")
        .doc(userId)
        .collection("cartItems")
        .doc(uuid)
        .delete();

    state!.removeWhere((element) => element.productId == uuid);

    state = [...state!];
  }
}

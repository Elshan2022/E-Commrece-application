import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/cache/cache_manager.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = Provider<ImagePicker>((ref) {
  return ImagePicker();
});

final firebaseStorageProvider = Provider<FirebaseStorage>((ref) {
  return FirebaseStorage.instance;
});
final cloudFiresStoreInstance = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final userImageProvider =
    StateNotifierProvider<UserImageNotifier, String>((ref) {
  return UserImageNotifier(ref);
});

class UserImageNotifier extends StateNotifier<String> {
  UserImageNotifier(this.ref) : super("");

  final Ref ref;

  setPhoto() async {
    final CacheManager manager = CacheManager();
    final id = await manager.getUserId();
    final picker = ref.watch(imagePickerProvider);
    final storage = ref.watch(firebaseStorageProvider);
    final cloudFireStore = ref.watch(cloudFiresStoreInstance);
    XFile? response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      final file = File(response.path);
      final snapShot = await cloudFireStore.collection("users").doc(id).get();
      if (snapShot.exists) {
        var userName = snapShot.get("name");
        final ref = storage.ref().child("userImage").child(userName + ".jpg");
        await ref.putFile(file);
        final imagePath = await ref.getDownloadURL();
        await cloudFireStore
            .collection("users")
            .doc(id)
            .update({"userImage": imagePath});

        state = imagePath;
      } else {
        debugPrint("Document does not exist.");
      }
    }
  }
}

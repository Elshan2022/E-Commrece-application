import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final productImageProvider =
    StateNotifierProvider.autoDispose<ProductImageNotifier, File?>((ref) {
  return ProductImageNotifier();
});



class ProductImageNotifier extends StateNotifier<File?> {
  ProductImageNotifier() : super(null);

  Future<void> selectImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      state = File(imageFile.path);
    }
  }
}



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/products/model/size_model.dart';

final sizesProvider = Provider<List<String>>((ref) {
  return ["S", "M", "L", "XL", "XS"];
});

final selectedSizeProvider =
    StateNotifierProvider.autoDispose<SelectedSizeNotifier, SizeModel>((ref) {
  return SelectedSizeNotifier();
});

class SelectedSizeNotifier extends StateNotifier<SizeModel> {
  SelectedSizeNotifier() : super(const SizeModel(sizeName: "", sizeIndex: -1));

  setSelectedSize(String size, int index) {
    state = state.copyWith(sizeName: size, sizeIndex: index);
  }
}

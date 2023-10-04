import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/home/model/categories_model.dart';

final categoriesProvider =
    NotifierProvider<CategoriesNotifier, List<String>>(CategoriesNotifier.new);

final selectedCategoriesProvider =
    StateNotifierProvider.autoDispose<SelectedCategoriesNotifier, CategoriesModel>((ref) {
  return SelectedCategoriesNotifier();
});

class CategoriesNotifier extends Notifier<List<String>> {
  @override
  build() {
    return ["All", "Shoes", "Jeans", "Jacket", "Sweaters", "Blouses", "Coats"];
  }
}

class SelectedCategoriesNotifier extends StateNotifier<CategoriesModel> {
  SelectedCategoriesNotifier()
      : super(const CategoriesModel(categoriesName: "All", categoriesIndex: 0));

  setSelectedCategories(int index, String categoriesName) {
    state =
        state.copyWith(categoriesIndex: index, categoriesName: categoriesName);
  }
}

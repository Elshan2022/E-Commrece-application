import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/login/model/visible_model.dart';

final visibleProvider =
    StateNotifierProvider<VisibilityNotifier, VisibleModel>((ref) {
  return VisibilityNotifier();
});

class VisibilityNotifier extends StateNotifier<VisibleModel> {
  VisibilityNotifier() : super(VisibleModel(isSecure: true));

  changeVisible() {
    state = state.copyWith(isSecure: !state.isSecure);
  }
}

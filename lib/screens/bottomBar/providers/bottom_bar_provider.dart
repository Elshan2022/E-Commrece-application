import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/bottomBar/model/bottom_bar_model.dart';

class BottomBarNotifier extends Notifier<BottomBarModel> {
  @override
  build() {
    return const BottomBarModel(index: 0);
  }

  changePage(int currentIndex) {
    state = state.copyWith(index: currentIndex);
  }
}

final bottomBarProvider =
    NotifierProvider<BottomBarNotifier, BottomBarModel>(BottomBarNotifier.new);

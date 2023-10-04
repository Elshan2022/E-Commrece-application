import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/welcome/model/page_model.dart';

final pageProvider = StateNotifierProvider<PageNotifier, PageModel>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<PageModel> {
  PageNotifier() : super(const PageModel());

  changePage(int index) {
    state = state.copyWith(page: index);
  }
}

final pageControllerProvider = Provider<PageController>((ref) {
  
  return PageController(initialPage: 0);
});

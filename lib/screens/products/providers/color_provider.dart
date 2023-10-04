import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/screens/products/model/color_model.dart';

final selectedColorProvider =
    StateNotifierProvider.autoDispose<ColorNotifier, ColorsModel>((ref) {
  return ColorNotifier();
});

final colorProvider = Provider<List<ColorsModel>>((ref) {
  return const [
    ColorsModel(
      colorName: "Red",
      colorCode: "0xFFDE3163",
    ),
    ColorsModel(
      colorName: "Blue",
      colorCode: "0xFF6495ED",
    ),
    ColorsModel(
      colorName: "Yellow",
      colorCode: "0xFFDFFF00",
    ),
    ColorsModel(
      colorName: "Purple",
      colorCode: "0xFFE104FB",
    ),
    ColorsModel(
      colorName: "Black",
      colorCode: "0xFF060606",
    ),
    ColorsModel(
      colorName: "Green",
      colorCode: "0xFF05F83D",
    ),
  ];
});

class ColorNotifier extends StateNotifier<ColorsModel> {
  ColorNotifier() : super(const ColorsModel(colorName: "", colorCode: ""));

  selectedColor(String colorName, String colorCode) {
    state = state.copyWith(colorCode: colorCode, colorName: colorName);
    debugPrint("Selected color ${state.colorCode} ${state.colorName}");
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';

part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String totalPrice,
    required String productId,
    required int quantity,
    required String colorCode,
    required String colorName,
    required String size,
    required String price,
    required String productName,
    required String imageUrl,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}

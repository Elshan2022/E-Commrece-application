import 'package:flutter_shopping_application/screens/products/model/product_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? uuid,
    String? productName,
    String? manufacture,
    String? price,
    List<ProductDetailModel>? productDetailList,
    String? categories,
    String? description,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

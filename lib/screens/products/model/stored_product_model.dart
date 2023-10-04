import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_detail_model.dart';

part 'stored_product_model.g.dart';

part 'stored_product_model.freezed.dart';


@freezed
class StoredProductModel with _$StoredProductModel{
  const factory StoredProductModel({
    String? uuid,
    String? productName,
    String? manufacture,
    String? price,
    List<ProductDetailModel>? productDetailList,
    String? categories,
    String? description,
    String? imageUrl,
  }) = _StoredProductModel;

  factory StoredProductModel.fromJson(Map<String, dynamic> json) =>
      _$StoredProductModelFromJson(json);
}
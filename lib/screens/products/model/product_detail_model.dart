import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_detail_model.g.dart';
part 'product_detail_model.freezed.dart';

@freezed
class ProductDetailModel with _$ProductDetailModel {
  const factory ProductDetailModel({
    required String colorCode,
    required String colorName,
    required String size,
    required int quantity,
  }) = _ProductDetailModel;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}

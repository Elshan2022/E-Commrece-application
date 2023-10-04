// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoredProductModel _$$_StoredProductModelFromJson(
        Map<String, dynamic> json) =>
    _$_StoredProductModel(
      uuid: json['uuid'] as String?,
      productName: json['productName'] as String?,
      manufacture: json['manufacture'] as String?,
      price: json['price'] as String?,
      productDetailList: (json['productDetailList'] as List<dynamic>?)
          ?.map((e) => ProductDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: json['categories'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_StoredProductModelToJson(
        _$_StoredProductModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productName': instance.productName,
      'manufacture': instance.manufacture,
      'price': instance.price,
      'productDetailList': instance.productDetailList,
      'categories': instance.categories,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };

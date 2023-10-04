// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      uuid: json['uuid'] as String?,
      productName: json['productName'] as String?,
      manufacture: json['manufacture'] as String?,
      price: json['price'] as String?,
      productDetailList: (json['productDetailList'] as List<dynamic>?)
          ?.map((e) => ProductDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: json['categories'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'productName': instance.productName,
      'manufacture': instance.manufacture,
      'price': instance.price,
      'productDetailList': instance.productDetailList,
      'categories': instance.categories,
      'description': instance.description,
    };

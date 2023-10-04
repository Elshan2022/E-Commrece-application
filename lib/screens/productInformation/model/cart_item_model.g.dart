// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItemModel _$$_CartItemModelFromJson(Map<String, dynamic> json) =>
    _$_CartItemModel(
      totalPrice: json['totalPrice'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      colorCode: json['colorCode'] as String,
      colorName: json['colorName'] as String,
      size: json['size'] as String,
      price: json['price'] as String,
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$_CartItemModelToJson(_$_CartItemModel instance) =>
    <String, dynamic>{
      'totalPrice': instance.totalPrice,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'colorCode': instance.colorCode,
      'colorName': instance.colorName,
      'size': instance.size,
      'price': instance.price,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
    };

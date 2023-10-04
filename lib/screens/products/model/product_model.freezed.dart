// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String? get uuid => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get manufacture => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  List<ProductDetailModel>? get productDetailList =>
      throw _privateConstructorUsedError;
  String? get categories => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String? uuid,
      String? productName,
      String? manufacture,
      String? price,
      List<ProductDetailModel>? productDetailList,
      String? categories,
      String? description});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? productName = freezed,
    Object? manufacture = freezed,
    Object? price = freezed,
    Object? productDetailList = freezed,
    Object? categories = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacture: freezed == manufacture
          ? _value.manufacture
          : manufacture // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      productDetailList: freezed == productDetailList
          ? _value.productDetailList
          : productDetailList // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailModel>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? productName,
      String? manufacture,
      String? price,
      List<ProductDetailModel>? productDetailList,
      String? categories,
      String? description});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? productName = freezed,
    Object? manufacture = freezed,
    Object? price = freezed,
    Object? productDetailList = freezed,
    Object? categories = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_ProductModel(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacture: freezed == manufacture
          ? _value.manufacture
          : manufacture // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      productDetailList: freezed == productDetailList
          ? _value._productDetailList
          : productDetailList // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailModel>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  const _$_ProductModel(
      {this.uuid,
      this.productName,
      this.manufacture,
      this.price,
      final List<ProductDetailModel>? productDetailList,
      this.categories,
      this.description})
      : _productDetailList = productDetailList;

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String? uuid;
  @override
  final String? productName;
  @override
  final String? manufacture;
  @override
  final String? price;
  final List<ProductDetailModel>? _productDetailList;
  @override
  List<ProductDetailModel>? get productDetailList {
    final value = _productDetailList;
    if (value == null) return null;
    if (_productDetailList is EqualUnmodifiableListView)
      return _productDetailList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? categories;
  @override
  final String? description;

  @override
  String toString() {
    return 'ProductModel(uuid: $uuid, productName: $productName, manufacture: $manufacture, price: $price, productDetailList: $productDetailList, categories: $categories, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.manufacture, manufacture) ||
                other.manufacture == manufacture) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._productDetailList, _productDetailList) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      productName,
      manufacture,
      price,
      const DeepCollectionEquality().hash(_productDetailList),
      categories,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {final String? uuid,
      final String? productName,
      final String? manufacture,
      final String? price,
      final List<ProductDetailModel>? productDetailList,
      final String? categories,
      final String? description}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String? get uuid;
  @override
  String? get productName;
  @override
  String? get manufacture;
  @override
  String? get price;
  @override
  List<ProductDetailModel>? get productDetailList;
  @override
  String? get categories;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

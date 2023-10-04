// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoredProductModel _$StoredProductModelFromJson(Map<String, dynamic> json) {
  return _StoredProductModel.fromJson(json);
}

/// @nodoc
mixin _$StoredProductModel {
  String? get uuid => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get manufacture => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  List<ProductDetailModel>? get productDetailList =>
      throw _privateConstructorUsedError;
  String? get categories => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoredProductModelCopyWith<StoredProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoredProductModelCopyWith<$Res> {
  factory $StoredProductModelCopyWith(
          StoredProductModel value, $Res Function(StoredProductModel) then) =
      _$StoredProductModelCopyWithImpl<$Res, StoredProductModel>;
  @useResult
  $Res call(
      {String? uuid,
      String? productName,
      String? manufacture,
      String? price,
      List<ProductDetailModel>? productDetailList,
      String? categories,
      String? description,
      String? imageUrl});
}

/// @nodoc
class _$StoredProductModelCopyWithImpl<$Res, $Val extends StoredProductModel>
    implements $StoredProductModelCopyWith<$Res> {
  _$StoredProductModelCopyWithImpl(this._value, this._then);

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
    Object? imageUrl = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoredProductModelCopyWith<$Res>
    implements $StoredProductModelCopyWith<$Res> {
  factory _$$_StoredProductModelCopyWith(_$_StoredProductModel value,
          $Res Function(_$_StoredProductModel) then) =
      __$$_StoredProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? productName,
      String? manufacture,
      String? price,
      List<ProductDetailModel>? productDetailList,
      String? categories,
      String? description,
      String? imageUrl});
}

/// @nodoc
class __$$_StoredProductModelCopyWithImpl<$Res>
    extends _$StoredProductModelCopyWithImpl<$Res, _$_StoredProductModel>
    implements _$$_StoredProductModelCopyWith<$Res> {
  __$$_StoredProductModelCopyWithImpl(
      _$_StoredProductModel _value, $Res Function(_$_StoredProductModel) _then)
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
    Object? imageUrl = freezed,
  }) {
    return _then(_$_StoredProductModel(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoredProductModel implements _StoredProductModel {
  const _$_StoredProductModel(
      {this.uuid,
      this.productName,
      this.manufacture,
      this.price,
      final List<ProductDetailModel>? productDetailList,
      this.categories,
      this.description,
      this.imageUrl})
      : _productDetailList = productDetailList;

  factory _$_StoredProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoredProductModelFromJson(json);

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
  final String? imageUrl;

  @override
  String toString() {
    return 'StoredProductModel(uuid: $uuid, productName: $productName, manufacture: $manufacture, price: $price, productDetailList: $productDetailList, categories: $categories, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoredProductModel &&
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
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
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
      description,
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoredProductModelCopyWith<_$_StoredProductModel> get copyWith =>
      __$$_StoredProductModelCopyWithImpl<_$_StoredProductModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoredProductModelToJson(
      this,
    );
  }
}

abstract class _StoredProductModel implements StoredProductModel {
  const factory _StoredProductModel(
      {final String? uuid,
      final String? productName,
      final String? manufacture,
      final String? price,
      final List<ProductDetailModel>? productDetailList,
      final String? categories,
      final String? description,
      final String? imageUrl}) = _$_StoredProductModel;

  factory _StoredProductModel.fromJson(Map<String, dynamic> json) =
      _$_StoredProductModel.fromJson;

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
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_StoredProductModelCopyWith<_$_StoredProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

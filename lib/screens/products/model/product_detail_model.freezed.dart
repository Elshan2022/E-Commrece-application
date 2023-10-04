// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) {
  return _ProductDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailModel {
  String get colorCode => throw _privateConstructorUsedError;
  String get colorName => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailModelCopyWith<ProductDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailModelCopyWith<$Res> {
  factory $ProductDetailModelCopyWith(
          ProductDetailModel value, $Res Function(ProductDetailModel) then) =
      _$ProductDetailModelCopyWithImpl<$Res, ProductDetailModel>;
  @useResult
  $Res call({String colorCode, String colorName, String size, int quantity});
}

/// @nodoc
class _$ProductDetailModelCopyWithImpl<$Res, $Val extends ProductDetailModel>
    implements $ProductDetailModelCopyWith<$Res> {
  _$ProductDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorCode = null,
    Object? colorName = null,
    Object? size = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDetailModelCopyWith<$Res>
    implements $ProductDetailModelCopyWith<$Res> {
  factory _$$_ProductDetailModelCopyWith(_$_ProductDetailModel value,
          $Res Function(_$_ProductDetailModel) then) =
      __$$_ProductDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String colorCode, String colorName, String size, int quantity});
}

/// @nodoc
class __$$_ProductDetailModelCopyWithImpl<$Res>
    extends _$ProductDetailModelCopyWithImpl<$Res, _$_ProductDetailModel>
    implements _$$_ProductDetailModelCopyWith<$Res> {
  __$$_ProductDetailModelCopyWithImpl(
      _$_ProductDetailModel _value, $Res Function(_$_ProductDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorCode = null,
    Object? colorName = null,
    Object? size = null,
    Object? quantity = null,
  }) {
    return _then(_$_ProductDetailModel(
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      colorName: null == colorName
          ? _value.colorName
          : colorName // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDetailModel implements _ProductDetailModel {
  const _$_ProductDetailModel(
      {required this.colorCode,
      required this.colorName,
      required this.size,
      required this.quantity});

  factory _$_ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDetailModelFromJson(json);

  @override
  final String colorCode;
  @override
  final String colorName;
  @override
  final String size;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductDetailModel(colorCode: $colorCode, colorName: $colorName, size: $size, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailModel &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.colorName, colorName) ||
                other.colorName == colorName) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, colorCode, colorName, size, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailModelCopyWith<_$_ProductDetailModel> get copyWith =>
      __$$_ProductDetailModelCopyWithImpl<_$_ProductDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDetailModelToJson(
      this,
    );
  }
}

abstract class _ProductDetailModel implements ProductDetailModel {
  const factory _ProductDetailModel(
      {required final String colorCode,
      required final String colorName,
      required final String size,
      required final int quantity}) = _$_ProductDetailModel;

  factory _ProductDetailModel.fromJson(Map<String, dynamic> json) =
      _$_ProductDetailModel.fromJson;

  @override
  String get colorCode;
  @override
  String get colorName;
  @override
  String get size;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailModelCopyWith<_$_ProductDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

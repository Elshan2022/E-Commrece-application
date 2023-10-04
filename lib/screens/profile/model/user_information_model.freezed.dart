// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInformationModel _$UserInformationModelFromJson(Map<String, dynamic> json) {
  return _UserInformationModel.fromJson(json);
}

/// @nodoc
mixin _$UserInformationModel {
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationModelCopyWith<UserInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationModelCopyWith<$Res> {
  factory $UserInformationModelCopyWith(UserInformationModel value,
          $Res Function(UserInformationModel) then) =
      _$UserInformationModelCopyWithImpl<$Res, UserInformationModel>;
  @useResult
  $Res call({String? name, String? surname, String? email});
}

/// @nodoc
class _$UserInformationModelCopyWithImpl<$Res,
        $Val extends UserInformationModel>
    implements $UserInformationModelCopyWith<$Res> {
  _$UserInformationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInformationModelCopyWith<$Res>
    implements $UserInformationModelCopyWith<$Res> {
  factory _$$_UserInformationModelCopyWith(_$_UserInformationModel value,
          $Res Function(_$_UserInformationModel) then) =
      __$$_UserInformationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? surname, String? email});
}

/// @nodoc
class __$$_UserInformationModelCopyWithImpl<$Res>
    extends _$UserInformationModelCopyWithImpl<$Res, _$_UserInformationModel>
    implements _$$_UserInformationModelCopyWith<$Res> {
  __$$_UserInformationModelCopyWithImpl(_$_UserInformationModel _value,
      $Res Function(_$_UserInformationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_UserInformationModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInformationModel implements _UserInformationModel {
  const _$_UserInformationModel({this.name, this.surname, this.email});

  factory _$_UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserInformationModelFromJson(json);

  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserInformationModel(name: $name, surname: $surname, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInformationModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, surname, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInformationModelCopyWith<_$_UserInformationModel> get copyWith =>
      __$$_UserInformationModelCopyWithImpl<_$_UserInformationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInformationModelToJson(
      this,
    );
  }
}

abstract class _UserInformationModel implements UserInformationModel {
  const factory _UserInformationModel(
      {final String? name,
      final String? surname,
      final String? email}) = _$_UserInformationModel;

  factory _UserInformationModel.fromJson(Map<String, dynamic> json) =
      _$_UserInformationModel.fromJson;

  @override
  String? get name;
  @override
  String? get surname;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserInformationModelCopyWith<_$_UserInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

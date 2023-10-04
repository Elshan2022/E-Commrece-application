import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user_login_model.freezed.dart';
part 'user_login_model.g.dart';

@freezed
class UserLoginModel with _$UserLoginModel {
  const factory UserLoginModel({
    required String email,
    required String password,
    required String userId,
  }) = _UserLoginModel;

  factory UserLoginModel.fromJson(Map<String, Object?> json) =>
      _$UserLoginModelFromJson(json);
}

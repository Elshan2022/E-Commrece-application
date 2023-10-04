import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information_model.g.dart';
part 'user_information_model.freezed.dart';


@freezed
class UserInformationModel with _$UserInformationModel {
  const factory UserInformationModel({
    String? name,
    String? surname,
    String? email,
  }) = _UserInformationModel;

  factory UserInformationModel.fromJson(Map<String, dynamic> json) =>
      _$UserInformationModelFromJson(json);
}

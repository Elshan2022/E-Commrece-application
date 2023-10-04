// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ColorsModel extends Equatable {
  final String? colorName;
  final String colorCode;
  const ColorsModel({
    required this.colorName,
    required this.colorCode,
  });

  @override
  List<Object?> get props => [colorCode];

  

  ColorsModel copyWith({
    String? colorName,
    String? colorCode,
  }) {
    return ColorsModel(
      colorName: colorName ?? this.colorName,
      colorCode: colorCode ?? this.colorCode,
    );
  }
}

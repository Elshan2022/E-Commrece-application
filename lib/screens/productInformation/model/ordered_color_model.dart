// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderedColorModel extends Equatable {
  final String colorCode;
  final String colorName;
  const OrderedColorModel({
    required this.colorCode,
    required this.colorName,
  });

  @override
  List<Object?> get props => [colorCode];

  OrderedColorModel copyWith({
    String? colorCode,
    String? colorName,
  }) {
    return OrderedColorModel(
      colorCode: colorCode ?? this.colorCode,
      colorName: colorName ?? this.colorName,
    );
  }
}

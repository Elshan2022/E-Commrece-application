import 'package:equatable/equatable.dart';

class SizeModel extends Equatable {
  final String sizeName;
  final int sizeIndex;
  const SizeModel({
    required this.sizeName,
    required this.sizeIndex,
  });

  @override
  List<Object> get props => [sizeName, sizeIndex];

  SizeModel copyWith({
    String? sizeName,
    int? sizeIndex,
  }) {
    return SizeModel(
      sizeName: sizeName ?? this.sizeName,
      sizeIndex: sizeIndex ?? this.sizeIndex,
    );
  }
}

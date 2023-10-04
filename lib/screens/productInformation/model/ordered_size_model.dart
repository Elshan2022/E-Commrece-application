import 'package:equatable/equatable.dart';

class OrderedSizeModel extends Equatable {
  final String orderedSizeName;
  final int orderedSizeIndex;
  const OrderedSizeModel({
    required this.orderedSizeName,
    required this.orderedSizeIndex,
  });

  @override
  List<Object> get props => [orderedSizeName, orderedSizeIndex];

  OrderedSizeModel copyWith({
    String? orderedSizeName,
    int? orderedSizeIndex,
  }) {
    return OrderedSizeModel(
      orderedSizeName: orderedSizeName ?? this.orderedSizeName,
      orderedSizeIndex: orderedSizeIndex ?? this.orderedSizeIndex,
    );
  }
}

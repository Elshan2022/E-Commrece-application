import 'package:equatable/equatable.dart';

class OrderedQuantityModel extends Equatable {
  final int quantity;
  const OrderedQuantityModel({
    required this.quantity,
  });

  @override
  List<Object> get props => [quantity];

  OrderedQuantityModel copyWith({
    int? quantity,
  }) {
    return OrderedQuantityModel(
      quantity: quantity ?? this.quantity,
    );
  }
}

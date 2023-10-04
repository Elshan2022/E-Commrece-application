import 'package:equatable/equatable.dart';

class BottomBarModel extends Equatable {
  final int index;
  const BottomBarModel({
    required this.index,
  });

  BottomBarModel copyWith({
    int? index,
  }) {
    return BottomBarModel(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}

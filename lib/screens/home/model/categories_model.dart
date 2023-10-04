import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String categoriesName;
  final int categoriesIndex;
  const CategoriesModel({
    required this.categoriesName,
    required this.categoriesIndex,
  });

  CategoriesModel copyWith({
    String? categoriesName,
    int? categoriesIndex,
  }) {
    return CategoriesModel(
      categoriesName: categoriesName ?? this.categoriesName,
      categoriesIndex: categoriesIndex ?? this.categoriesIndex,
    );
  }

  @override
  List<Object?> get props => [categoriesIndex];
}

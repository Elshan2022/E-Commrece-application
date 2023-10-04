import 'package:equatable/equatable.dart';

class ProductCategoriesModel extends Equatable {
  final String categoriesName;
  final int categoriesIndex;
  const ProductCategoriesModel({
    required this.categoriesName,
    required this.categoriesIndex,
  });
  @override
  List<Object> get props => [categoriesName, categoriesIndex];

  ProductCategoriesModel copyWith({
    String? categoriesName,
    int? categoriesIndex,
  }) {
    return ProductCategoriesModel(
      categoriesName: categoriesName ?? this.categoriesName,
      categoriesIndex: categoriesIndex ?? this.categoriesIndex,
    );
  }
}

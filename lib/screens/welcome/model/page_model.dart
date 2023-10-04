import 'package:equatable/equatable.dart';

class PageModel extends Equatable {
  final int page;
  const PageModel({
    this.page = 0,
  });

  PageModel copyWith({
    int? page,
  }) {
    return PageModel(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}

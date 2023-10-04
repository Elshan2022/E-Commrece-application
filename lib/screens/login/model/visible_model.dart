class VisibleModel {
  final bool isSecure;
  VisibleModel({
    required this.isSecure,
  });

  VisibleModel copyWith({
    bool? isSecure,
  }) {
    return VisibleModel(
      isSecure: isSecure ?? this.isSecure,
    );
  }
}

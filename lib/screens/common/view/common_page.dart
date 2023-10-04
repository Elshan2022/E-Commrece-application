import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/screens/bottomBar/view/bottom_bar_page.dart';
import 'package:flutter_shopping_application/screens/products/view/product_detail.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarPage(), const ProductDetail()],
    );
  }
}

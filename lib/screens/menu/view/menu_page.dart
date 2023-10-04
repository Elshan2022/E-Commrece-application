import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: AppDecorations.pageDecoration,
      child: Center(
        child: Text("Menu Page"),
      ),
    );
  }
}

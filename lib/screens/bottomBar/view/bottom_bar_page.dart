import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/gen/assets.gen.dart';
import 'package:flutter_shopping_application/screens/basket/view/basket_page.dart';
import 'package:flutter_shopping_application/screens/bottomBar/providers/bottom_bar_provider.dart';
import 'package:flutter_shopping_application/screens/home/view/home_page.dart';
import 'package:flutter_shopping_application/screens/menu/view/menu_page.dart';
import 'package:flutter_shopping_application/screens/profile/view/profile_page.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';

class BottomBarPage extends ConsumerWidget {
  BottomBarPage({super.key});

  final List<String> _bottomBarIcons = [
    Assets.icons.home.path,
    Assets.icons.menu.path,
    Assets.icons.basket.path,
    Assets.icons.profile.path,
  ];

  final List<Widget> _pages = [
     HomePage(),
    const MenuPage(),
    const BasketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomBarProvider);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.gradientLight, AppColors.gradientDark],
          ),
        ),
        child: _pages[state.index],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.center,
                colors: [AppColors.gradientLight, AppColors.gradientDark],
              ),
            ),
            height: 60.h,
          ),
          BottomNavigationBar(
         
              currentIndex: state.index,
              onTap: ref.read(bottomBarProvider.notifier).changePage,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme:
                  const IconThemeData(color: AppColors.primaryLight),
              unselectedIconTheme: const IconThemeData(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: _bottomBarIcons.map((iconsPath) {
                return BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(iconsPath)),
                  label: "",
                );
              }).toList()),
        ],
      ),
    );
  }
}





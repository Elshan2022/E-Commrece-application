import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/bottomBar/view/bottom_bar_page.dart';
import 'package:flutter_shopping_application/screens/common/view/common_page.dart';
import 'package:flutter_shopping_application/screens/login/view/login_page.dart';
import 'package:flutter_shopping_application/screens/productInformation/view/product_information_page.dart';
import 'package:flutter_shopping_application/screens/registration/view/registration_page.dart';
import 'package:flutter_shopping_application/screens/search/view/search_page.dart';
import 'package:flutter_shopping_application/screens/splash/view/splash_page.dart';
import 'package:flutter_shopping_application/screens/welcome/view/welcome_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: RoutesName.initial,
        path: "/",
        builder: (context, state) {
          return SplashPage();
        },
      ),
      GoRoute(
        name: RoutesName.welcome,
        path: "/welcome",
        pageBuilder: (context, state) {
          return CupertinoPage(
            child: WelcomePage(),
          );
        },
        builder: (context, state) {
          return WelcomePage();
        },
      ),
      GoRoute(
        name: RoutesName.common,
        path: "/common",
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: CommonPage(),
          );
        },
        builder: (context, state) {
          return const CommonPage();
        },
      ),
      GoRoute(
        name: RoutesName.search,
        path: "/search",
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: SearchPage(),
          );
        },
        builder: (context, state) {
          return const SearchPage();
        },
      ),
      GoRoute(
        name: RoutesName.productInformation,
        path: "/productInformation/:index",
        pageBuilder: (context, state) {
          final index = state.pathParameters["index"];
          return CupertinoPage(
            child: ProductInformationPage(
              index: int.parse(index!),
            ),
          );
        },
        builder: (context, state) {
          final index = state.pathParameters["index"];
          return ProductInformationPage(
            index: int.parse(index!),
          );
        },
      ),
      GoRoute(
        name: RoutesName.login,
        path: "/login",
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: LoginPage(),
          );
        },
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: RoutesName.register,
        path: "/register",
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: RegistrationPage(),
          );
        },
        builder: (context, state) {
          return const RegistrationPage();
        },
      ),
      GoRoute(
        name: RoutesName.bottomBar,
        path: "/bottomBar",
        pageBuilder: (context, state) {
          return CupertinoPage(
            child: BottomBarPage(),
          );
        },
        builder: (context, state) {
          return BottomBarPage();
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/authenticate/user_authenticate.dart';
import 'package:flutter_shopping_application/gen/assets.gen.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  _authenticateUser() async {
    await Future.delayed(const Duration(seconds: 4), () async {
      final isAuthenticate = await ref
          .read(isAuthenticateProvider.notifier)
          .authenticateUser(context);
      if (isAuthenticate == false) {
        if (!mounted) return;
        context.go(RoutesName.welcome);
      } else {
        if (!mounted) return;
        context.go(RoutesName.common);
      }
    });
  }

  @override
  void initState() {
    _authenticateUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: AppDecorations.pageDecoration,
      child: Lottie.asset(Assets.lottie.splashAnimation),
    );
  }
}

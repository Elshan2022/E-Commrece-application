import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/firebase_options.dart';
import 'package:flutter_shopping_application/utilities/app_decoration.dart';
import 'navigation/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7, 826.9),
      builder: (context, child) {
        return /* MaterialApp(
          theme: ThemeData(
            elevatedButtonTheme: AppDecorations.elevatedButtonStyle,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ); */
            MaterialApp.router(
          theme: ThemeData(
            elevatedButtonTheme: AppDecorations.elevatedButtonStyle,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.goRouter,
        );
      },
    );
  }
}

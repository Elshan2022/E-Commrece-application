import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/gen/assets.gen.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/login/model/user_login_model.dart';
import 'package:flutter_shopping_application/screens/login/model/visible_model.dart';
import 'package:flutter_shopping_application/screens/login/providers/visibility_provider.dart';
import 'package:flutter_shopping_application/screens/login/view/login_facebook_google.dart';
import 'package:flutter_shopping_application/screens/registration/service/firebase_auth_service.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/custom_textform_field.dart';
import 'package:flutter_shopping_application/utilities/dimensions.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final IFirebaseAuthService _authService;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authService = FireBaseAuthService();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(visibleProvider);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.gradientLight, AppColors.gradientDark])),
        child: Form(
          key: _formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _emailTextFormField(),
                SizedBox(height: 20.h),
                _passwordTextFormField(state),
                SizedBox(height: 30.h),
                _loginButton(),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _loginFacebook(),
                      _loginGoogle(),
                    ],
                  ),
                ),
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _registerButton() {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RoutesName.register);
      },
      child: Container(
        margin: EdgeInsets.only(left: 12.w, top: 40.h),
        child: const AppText(
          textDecoration: TextDecoration.underline,
          text: "You don't have a registration yet?",
          color: AppColors.primaryLight,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  LoginFacebookGoogle _loginGoogle() {
    return LoginFacebookGoogle(
      iconPath: Assets.images.googleLogo.path,
      onPressed: () async {
        try {
          await _authService.signInWithGoogle();
          if (!mounted) return;
          context.go(RoutesName.bottomBar);
        } catch (e) {
          HelperMethods.showSnackBar(context, e.toString(), Colors.red);
        }
      },
    );
  }

  LoginFacebookGoogle _loginFacebook() {
    return LoginFacebookGoogle(
      iconPath: Assets.images.facebook.path,
      onPressed: () async {
        try {
          await _authService.signInWithFacebook();
        } catch (e) {
          debugPrint("Facebook exception $e");
          HelperMethods.showSnackBar(context, e.toString(), Colors.red);
        }
      },
    );
  }

  Container _loginButton() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () async {
          if (_formState.currentState?.validate() ?? false) {
            try {
              await _authService.signIn(
                UserLoginModel(
                  email: _emailController.text,
                  password: _passwordController.text,
                  userId: Uuid().v4(),
                ),
              );

              if (!mounted) return;
              GoRouter.of(context).replace(RoutesName.common);
            } catch (e) {
              HelperMethods.showSnackBar(context, e.toString(), Colors.red);
            }
          }
        },
        child: const AppText(
          text: "Login",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Container _passwordTextFormField(VisibleModel state) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _passwordFocusNode,
        isSecure: state.isSecure,
        hintText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            ref.read(visibleProvider.notifier).changeVisible();
          },
          icon: Icon(
            state.isSecure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.grey,
          ),
        ),
        textEditingController: _passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password is required";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container _emailTextFormField() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height * 0.3, left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _emailFocusNode,
        hintText: "Email",
        textEditingController: _emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Email is required";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

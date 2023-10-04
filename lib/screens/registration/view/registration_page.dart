import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shopping_application/navigation/routes_name.dart';
import 'package:flutter_shopping_application/screens/registration/model/user_model.dart';
import 'package:flutter_shopping_application/screens/registration/service/firebase_auth_service.dart';
import 'package:flutter_shopping_application/utilities/app_colors.dart';
import 'package:flutter_shopping_application/utilities/app_text.dart';
import 'package:flutter_shopping_application/utilities/custom_textform_field.dart';
import 'package:flutter_shopping_application/utilities/dimensions.dart';
import 'package:flutter_shopping_application/utilities/helper_methods.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _emailRegX =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final _passwordRegX = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _surnameFocusNode = FocusNode();

  late final IFirebaseAuthService _authService;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isSecure = true;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authService = FireBaseAuthService();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _changeVisible() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.gradientLight, AppColors.gradientDark])),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: Dimensions.height * 0.25),
                _nameTextFormField(),
                SizedBox(height: 10.h),
                _surnameTextFromField(),
                SizedBox(height: 10.h),
                _emailTextFormField(),
                SizedBox(height: 10.h),
                _passwordTextFormField(),
                _registerButton(context),
                _loginTextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _nameTextFormField() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _nameFocusNode,
        hintText: "Name",
        textEditingController: _nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Surname is required";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container _surnameTextFromField() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _surnameFocusNode,
        hintText: "Surname",
        textEditingController: _surnameController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Surname is required";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container _emailTextFormField() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _emailFocusNode,
        hintText: "Email",
        textEditingController: _emailController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Email is required";
          } else if (!_emailRegX.hasMatch(value)) {
            return "Invalid email";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Container _passwordTextFormField() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomTextFormField(
        focusNode: _passwordFocusNode,
        isSecure: _isSecure,
        suffixIcon: IconButton(
          onPressed: () {
            _changeVisible();
          },
          icon: Icon(
            _isSecure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.grey,
          ),
        ),
        hintText: "Password",
        textEditingController: _passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password is required";
          } else if (!_passwordRegX.hasMatch(value)) {
            return 'Password should be at least 8 characters and include at least one letter and one digit';
          } else {
            return null;
          }
        },
      ),
    );
  }

  InkWell _loginTextButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: const AppText(
          textDecoration: TextDecoration.underline,
          text: "Login",
          color: AppColors.primaryLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Container _registerButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.h,
      margin: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            try {
              await _authService.signUp(
                UserModel(
                  name: _nameController.text,
                  surname: _surnameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  userId: const Uuid().v4(),
                ),
              );
              if (!mounted) return;
              GoRouter.of(context).replace(RoutesName.bottomBar);
            } catch (e) {
              HelperMethods.showSnackBar(context, e.toString(), Colors.red);
            }
          }
        },
        child: const AppText(
          text: "Register",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

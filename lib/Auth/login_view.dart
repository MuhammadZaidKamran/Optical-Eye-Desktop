import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Auth/forgot_password_view.dart';
import 'package:optical_eye_desktop/Auth/sign_up_view.dart';
import 'package:optical_eye_desktop/Controllers/auth_controller.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/LoginViewWidgets/main_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainWidget(
      isLoading: isLoading,
      formKey: formKey,
      showPassword: showPassword,
      emailController: emailController,
      passwordController: passwordController,
      onTapForgotPassword: () {
        Get.to(const ForgotPasswordView(), transition: Transition.rightToLeft);
      },
      onTapLogin: () async {
        if (formKey.currentState!.validate()) {
          isLoading = true;
          setState(() {});
          await authController
              .signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim())
              .then((value) {
            isLoading = false;
            setState(() {});
          }).catchError((error) {
            isLoading = false;
            setState(() {});
            myErrorSnackBar(context: Get.context!, message: error.toString());
          });
        }
      },
      onTapSignUp: () {
        Get.to(const SignUpView());
      },
    ));
  }
}

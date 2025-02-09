import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Auth/forgot_password_view.dart';
import 'package:optical_eye_desktop/Auth/sign_up_view.dart';
import 'package:optical_eye_desktop/Screens/home_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainWidget(
      showPassword: showPassword,
      emailController: emailController,
      passwordController: passwordController,
      onTapForgotPassword: () {
        Get.to(ForgotPasswordView());
      },
      onTapLogin: () {
        Get.to( const HomeScreen());
      },
      onTapSignUp: () {
        Get.to(const SignUpView());
      },
    ));
  }
}

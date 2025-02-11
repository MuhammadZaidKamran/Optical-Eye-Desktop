import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/LoginViewWidgets/large_size_widget.dart';
import 'package:optical_eye_desktop/Widgets/LoginViewWidgets/medium_size_widget.dart';
import 'package:optical_eye_desktop/Widgets/LoginViewWidgets/normal_size_widget.dart';
import 'package:optical_eye_desktop/Widgets/LoginViewWidgets/small_size_widget.dart';

// ignore: must_be_immutable
class MainWidget extends StatelessWidget {
  MainWidget(
      {super.key,
      required this.showPassword,
      required this.emailController,
      required this.passwordController,
      required this.onTapForgotPassword,
      required this.onTapLogin,
      required this.onTapSignUp,
      required this.formKey,
      required this.isLoading});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool showPassword;
  final VoidCallback onTapForgotPassword;
  final VoidCallback onTapLogin;
  final VoidCallback onTapSignUp;
  final Key formKey;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    return switch (screenSize) {
      (ScreenSize.large) => LargeSizeWidget(
          emailController: emailController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapForgotPassword: onTapForgotPassword,
          onTapLogin: onTapLogin,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
      (ScreenSize.medium) => MediumSizeWidget(
          emailController: emailController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapForgotPassword: onTapForgotPassword,
          onTapLogin: onTapLogin,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
      (ScreenSize.normal) => NormalSizeWidget(
          emailController: emailController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapForgotPassword: onTapForgotPassword,
          onTapLogin: onTapLogin,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
      (_) => SmallSizeWidget(
          emailController: emailController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapForgotPassword: onTapForgotPassword,
          onTapLogin: onTapLogin,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
    };
  }
}

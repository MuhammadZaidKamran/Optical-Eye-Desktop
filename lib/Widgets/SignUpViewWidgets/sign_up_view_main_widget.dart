import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/SignUpViewWidgets/sign_up_view_large_size_widget.dart';
import 'package:optical_eye_desktop/Widgets/SignUpViewWidgets/sign_up_view_small_size_widget.dart';

// ignore: must_be_immutable
class SignUpViewMainWidget extends StatelessWidget {
  SignUpViewMainWidget(
      {super.key,
      required this.showPassword,
      required this.emailController,
      required this.firstNameController,
      required this.lastNameController,
      required this.passwordController,
      required this.onTapSignUp,
      required this.formKey, required this.isLoading});
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final VoidCallback onTapSignUp;
  bool showPassword = false;
  final bool isLoading;
  final Key formKey;

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    return switch (screenSize) {
      (ScreenSize.large) => SignUpViewLargeSizeWidget(
          emailController: emailController,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
      (_) => SignUpViewSmallSizeWidget(
          emailController: emailController,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          passwordController: passwordController,
          showPassword: showPassword,
          onTapSignUp: onTapSignUp,
          formKey: formKey,
          isLoading: isLoading,
        ),
    };
  }
}

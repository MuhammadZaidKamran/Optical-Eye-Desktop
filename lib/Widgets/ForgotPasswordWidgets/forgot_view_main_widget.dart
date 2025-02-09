import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_large_size_widgets.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_medium_size_widgets.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_normal_size_widget.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_small_size_widget.dart';

class ForgotViewMainWidget extends StatelessWidget {
  const ForgotViewMainWidget({super.key, required this.emailController, required this.onTap});
  final TextEditingController emailController;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);
    return switch (screenSize) {
      (ScreenSize.large) => ForgotViewLargeSizeWidgets(
          emailController: emailController,
          onTap: onTap,
        ),
      (ScreenSize.medium) => ForgotViewMediumSizeWidgets(
          emailController: emailController,
          onTap: onTap,
        ),
      (ScreenSize.normal) => ForgotViewNormalSizeWidget(
          emailController: emailController,
          onTap: onTap,
        ),
      (_) => ForgotViewSmallSizeWidget(
          emailController: emailController,
          onTap: onTap,
        ),
    };
  }
}
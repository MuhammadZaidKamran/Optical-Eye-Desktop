import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_main_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ForgotViewMainWidget(
      emailController: emailController,
      onTap: () {},
    ));
  }
}

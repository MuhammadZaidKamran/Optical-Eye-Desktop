import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/auth_controller.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/ForgotPasswordWidgets/forgot_view_main_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();

  final authController = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ForgotViewMainWidget(
      emailController: emailController,
      formKey: formKey,
      isLoading: isLoading,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          isLoading = true;
          setState(() {});
          await authController
              .forgotPassword(email: emailController.text.trim())
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
    ));
  }
}

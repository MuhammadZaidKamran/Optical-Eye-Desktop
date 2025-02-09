import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_back_button.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class ForgotViewLargeSizeWidgets extends StatelessWidget {
  const ForgotViewLargeSizeWidgets(
      {super.key, required this.emailController, required this.onTap});
  final TextEditingController emailController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 60,
          ),
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myHeight(0.1),
              const MyBackButton(),
              myHeight(0.1),
              const Text(
                "Forget Password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              myHeight(0.015),
              const Text(
                "Enter your email account to reset your password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.045),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.015),
              MyTextField(
                  width: Get.width * 0.45,
                  controller: emailController,
                  label: "Email"),
              myHeight(0.05),
              MyButton(
                width: Get.width * 0.45,
                onTap: onTap,
                label: "Continue",
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            "assets/side_img.png",
            height: Get.height,
            width: Get.width * 0.3,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

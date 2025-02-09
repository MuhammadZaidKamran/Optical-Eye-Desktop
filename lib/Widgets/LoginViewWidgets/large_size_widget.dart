import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

// ignore: must_be_immutable
class LargeSizeWidget extends StatefulWidget {
  LargeSizeWidget({
    super.key,
    required this.showPassword,
    required this.emailController,
    required this.passwordController,
    required this.onTapForgotPassword,
    required this.onTapLogin,
    required this.onTapSignUp,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool showPassword;
  final VoidCallback onTapForgotPassword;
  final VoidCallback onTapLogin;
  final VoidCallback onTapSignUp;

  @override
  State<LargeSizeWidget> createState() => _LargeSizeWidgetState();
}

class _LargeSizeWidgetState extends State<LargeSizeWidget> {
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
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              myHeight(0.015),
              const Text(
                "Please login to access Portal",
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
                  controller: widget.emailController,
                  label: "Email"),
              myHeight(0.03),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.015),
              MyTextField(
                obscureText: widget.showPassword,
                width: Get.width * 0.45,
                controller: widget.passwordController,
                label: "Password",
                trailing: InkWell(
                    onTap: () {
                      widget.showPassword = !widget.showPassword;
                      setState(() {});
                    },
                    child: widget.showPassword == true
                        ? Image.asset(
                            "assets/eye_remove_2.png",
                            scale: 9,
                          )
                        : const Icon(Icons.remove_red_eye_outlined)),
              ),
              myHeight(0.02),
              SizedBox(
                width: Get.width * 0.44,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: widget.onTapForgotPassword,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ),
              myHeight(0.05),
              MyButton(
                width: Get.width * 0.45,
                onTap: widget.onTapLogin,
                label: "Login",
              ),
              myHeight(0.1),
              SizedBox(
                width: Get.width * 0.45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account?"),
                    myWidth(0.003),
                    InkWell(
                      onTap: widget.onTapSignUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: mainThemeColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // const Spacer(),
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

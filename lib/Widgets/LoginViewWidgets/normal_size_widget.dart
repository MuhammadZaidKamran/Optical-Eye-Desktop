import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

// ignore: must_be_immutable
class NormalSizeWidget extends StatefulWidget {
  NormalSizeWidget(
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
  State<NormalSizeWidget> createState() => _NormalSizeWidgetState();
}

class _NormalSizeWidgetState extends State<NormalSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/side_img.png",
            width: Get.width,
            height: Get.height * 0.1,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  myHeight(0.015),
                  const Text(
                    "Please login to access Portal",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myHeight(0.045),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myHeight(0.015),
                  MyTextField(
                    width: Get.width * 1,
                    controller: widget.emailController,
                    label: "Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Email";
                      }
                      return null;
                    },
                  ),
                  myHeight(0.03),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myHeight(0.015),
                  MyTextField(
                    obscureText: widget.showPassword,
                    width: Get.width * 1,
                    controller: widget.passwordController,
                    label: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Password";
                      }
                      return null;
                    },
                    trailing: InkWell(
                        onTap: () {
                          widget.showPassword = !widget.showPassword;
                          setState(() {});
                        },
                        child: widget.showPassword == true
                            ? Image.asset(
                                "assets/eye_remove_2.png",
                                scale: 11,
                              )
                            : const Icon(Icons.remove_red_eye_outlined)),
                  ),
                  myHeight(0.02),
                  SizedBox(
                    width: Get.width * 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: widget.onTapForgotPassword,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  myHeight(0.05),
                  MyButton(
                    isLoading: widget.isLoading,
                    width: Get.width * 1,
                    onTap: widget.onTapLogin,
                    label: "Login",
                  ),
                  // myHeight(0.05),
                  // SizedBox(
                  //   width: Get.width * 1,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const Text("Don't have an Account?"),
                  //       myWidth(0.003),
                  //       InkWell(
                  //         onTap: widget.onTapSignUp,
                  //         child: Text(
                  //           "Sign Up",
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w500,
                  //             color: mainThemeColor,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

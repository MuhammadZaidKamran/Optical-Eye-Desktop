import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

// ignore: must_be_immutable
class SignUpViewSmallSizeWidget extends StatefulWidget {
  SignUpViewSmallSizeWidget(
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
  State<SignUpViewSmallSizeWidget> createState() =>
      _SignUpViewSmallSizeWidgetState();
}

class _SignUpViewSmallSizeWidgetState extends State<SignUpViewSmallSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Image.asset(
            "assets/side_img.png",
            height: Get.height * 0.1,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 45,
              ),
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // myHeight(0.1),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // myHeight(0.015),
                  const Text(
                    "Sign up to create an new account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myHeight(0.01),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // myHeight(0.015),
                  MyTextField(
                    width: Get.width * 1,
                    controller: widget.emailController,
                    label: "Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      } else if (!value.contains("@")) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  myHeight(0.01),
                  const Text(
                    "First Name",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // myHeight(0.015),
                  MyTextField(
                    width: Get.width * 1,
                    controller: widget.firstNameController,
                    label: "First Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter first name";
                      }
                      return null;
                    },
                  ),
                  myHeight(0.01),
                  const Text(
                    "Last Name",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // myHeight(0.015),
                  MyTextField(
                    width: Get.width * 1,
                    controller: widget.lastNameController,
                    label: "Last Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter last name";
                      }
                      return null;
                    },
                  ),
                  myHeight(0.01),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // myHeight(0.015),
                  MyTextField(
                    obscureText: widget.showPassword,
                    width: Get.width * 1,
                    controller: widget.passwordController,
                    label: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
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
                                scale: 9,
                              )
                            : const Icon(Icons.remove_red_eye_outlined)),
                  ),
                  myHeight(0.02),
                  MyButton(
                    isLoading: widget.isLoading,
                    width: Get.width * 1,
                    onTap: widget.onTapSignUp,
                    label: "Sign Up",
                  ),
                  myHeight(0.02),
                  SizedBox(
                    width: Get.width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an Account?"),
                        myWidth(0.003),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Login",
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
          ),
        ],
      ),
    );
  }
}

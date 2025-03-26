// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:optical_eye_desktop/Controllers/auth_controller.dart';
// import 'package:optical_eye_desktop/Global/global.dart';
// import 'package:optical_eye_desktop/Widgets/SignUpViewWidgets/sign_up_view_main_widget.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   final emailController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool showPassword = false;
//   final formKey = GlobalKey<FormState>();
//   final authController = Get.put(AuthController());
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SignUpViewMainWidget(
//         isLoading: isLoading,
//         formKey: formKey,
//         emailController: emailController,
//         firstNameController: firstNameController,
//         lastNameController: lastNameController,
//         passwordController: passwordController,
//         showPassword: showPassword,
//         onTapSignUp: () async {
//           if (formKey.currentState!.validate()) {
//             isLoading = true;
//             setState(() {});
//             await authController
//                 .signUp(
//               email: emailController.text.trim(),
//               firstName: firstNameController.text.trim(),
//               lastName: lastNameController.text.trim(),
//               password: passwordController.text.trim(),
//             )
//                 .then((value) {
//               emailController.clear();
//               firstNameController.clear();
//               lastNameController.clear();
//               passwordController.clear();
//               isLoading = false;
//               setState(() {});
//             }).catchError((error) {
//               isLoading = false;
//               setState(() {});
//               myErrorSnackBar(context: Get.context!, message: error.toString());
//             });
//           }
//         },
//       ),
//     );
//   }
// }

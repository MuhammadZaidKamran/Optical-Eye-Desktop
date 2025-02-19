import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget(
      {super.key,
      required this.employeeNameController,
      required this.displayNameController,
      required this.initialController,
      required this.insuranceCodeController,
      required this.pinNumberController,
      required this.logOnNameController,
      required this.passwordController,
      required this.postCodeController,
      required this.addressController,
      required this.countryController,
      required this.phoneController,
      required this.emailController,
      required this.onTapCreateUser});
  //Identification
  final TextEditingController employeeNameController;
  final TextEditingController displayNameController;
  final TextEditingController initialController;
  final TextEditingController insuranceCodeController;
  final TextEditingController pinNumberController;

  //Security
  final TextEditingController logOnNameController;
  final TextEditingController passwordController;

  //External Address
  final TextEditingController postCodeController;
  final TextEditingController addressController;
  final TextEditingController countryController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  //On Tap Create User
  final VoidCallback onTapCreateUser;

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: myPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.64,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create User",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.close(1),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: mainThemeColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close_rounded,
                          color: whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), // myHeight(0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Identification",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    myHeight(0.01),
                    const Text(
                      "Employee Name",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.employeeNameController,
                        label: "Employee Name"),
                    myHeight(0.007),
                    const Text(
                      "Display Name",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.displayNameController,
                        label: "Display Name"),
                    myHeight(0.007),
                    const Text(
                      "Iniatials",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.initialController,
                        label: "Initials"),
                    myHeight(0.007),
                    const Text(
                      "Insurance Code",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.insuranceCodeController,
                        label: "Insurance Code"),
                    myHeight(0.007),
                    const Text(
                      "PIN Number",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.pinNumberController,
                        label: "PIN Number"),
                    // myHeight(0.01),
                  ],
                ),
                myWidth(0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Security",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    myHeight(0.01),
                    const Text(
                      "Logon Name",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.logOnNameController,
                        label: "Logon Name"),
                    myHeight(0.007),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.2,
                        controller: widget.passwordController,
                        label: "Password"),
                    // myHeight(0.01),
                  ],
                ),
                myWidth(0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "External Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    myHeight(0.01),
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.2,
                      controller: widget.emailController,
                      label: "Email",
                    ),
                    myHeight(0.007),
                    const Text(
                      "Country",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.2,
                      controller: widget.countryController,
                      label: "Country",
                    ),
                    myHeight(0.007),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.2,
                      controller: widget.phoneController,
                      label: "Phone Number",
                    ),
                    myHeight(0.007),
                    const Text(
                      "Post Code",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.2,
                      controller: widget.postCodeController,
                      label: "Post Code",
                    ),
                    myHeight(0.007),
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.2,
                      controller: widget.addressController,
                      label: "Adress",
                    ),
                  ],
                ),
              ],
            ),
            myHeight(0.045),
            SizedBox(
              width: Get.width * 0.64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyButton(
                    btnFontWeight: FontWeight.normal,
                    borderRadius: BorderRadius.circular(5),
                    secondary: true,
                    height: Get.height * 0.06,
                    width: Get.width * 0.2,
                    onTap: () {
                      Get.back();
                    },
                    label: "Cancel",
                  ),
                  myWidth(0.01),
                  MyButton(
                    btnFontWeight: FontWeight.normal,
                    borderRadius: BorderRadius.circular(5),
                    height: Get.height * 0.06,
                    width: Get.width * 0.2,
                    onTap: widget.onTapCreateUser,
                    label: "Create User",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// //Identification
//   final employeeNameController = TextEditingController();
//   final displayNameController = TextEditingController();
//   final initialController = TextEditingController();
//   final insuranceCodeController = TextEditingController();
//   final pinNumberController = TextEditingController();

//   //Security
//   final logOnNameController = TextEditingController();
//   final passwordController = TextEditingController();

//   //External Address
//   final postCodeController = TextEditingController();
//   final addressController = TextEditingController();
//   final countryController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({
    super.key,
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
    required this.onTapCreateUser,
    this.dropdownValue,
    required this.formKey,
  });
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
  final Key formKey;

  //Dropdown Value
  final String? dropdownValue;

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: myPadding,
          child: SingleChildScrollView(
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
                          label: "Employee Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter employee name";
                            }
                            return null;
                          },
                        ),
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
                          label: "Display Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter display name";
                            }
                            return null;
                          },
                        ),
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
                          label: "Initials",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter initials";
                            }
                            return null;
                          },
                        ),
                        widget.dropdownValue == "Optom"
                            ? myHeight(0.007)
                            : myHeight(0),
                        widget.dropdownValue == "Optom"
                            ? const Text(
                                "Insurance Code",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : const SizedBox(),
                        widget.dropdownValue == "Optom"
                            ? myHeight(0.004)
                            : myHeight(0),
                        widget.dropdownValue == "Optom"
                            ? MyTextField(
                                width: Get.width * 0.2,
                                controller: widget.insuranceCodeController,
                                label: "Insurance Code",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter insurance code";
                                  }
                                  return null;
                                },
                              )
                            : const SizedBox(),
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
                          label: "PIN Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter PIN number";
                            }
                            return null;
                          },
                        ),
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
                          label: "Logon Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter logon name";
                            }
                            return null;
                          },
                        ),
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
                          obscureText: true,
                          label: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email";
                            } else if (!GetUtils.isEmail(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter country";
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter phone number";
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter post code";
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter address";
                            }
                            return null;
                          },
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
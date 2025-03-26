import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/auth_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/create_user_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';

class SelectRoleWidget extends StatefulWidget {
  const SelectRoleWidget({super.key});

  @override
  State<SelectRoleWidget> createState() => _SelectRoleWidgetState();
}

class _SelectRoleWidgetState extends State<SelectRoleWidget> {
  //Identification
  final employeeNameController = TextEditingController();
  final displayNameController = TextEditingController();
  final initialController = TextEditingController();
  final insuranceCodeController = TextEditingController();
  final pinNumberController = TextEditingController();

  //Security
  final logOnNameController = TextEditingController();
  final passwordController = TextEditingController();

  //External Address
  final postCodeController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: myPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Get.width * 0.3,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Role",
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
              ),
              myHeight(0.02),
              MyDropDown(
                label: const Text("Select Role"),
                dropDownValue: dropDownValue,
                items: const [
                  "Sales Manager",
                  "Admin",
                  "Branch Manager",
                  "Optom",
                ],
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value!;
                  });
                },
              ),
              myHeight(0.02),
              MyButton(
                btnFontWeight: FontWeight.normal,
                borderRadius: BorderRadius.circular(5),
                width: Get.width * 0.3,
                label: "Continue",
                onTap: () {
                  if (dropDownValue != null) {
                    Get.close(1);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CreateUserWidget(
                            formKey: _formKey,
                            dropdownValue: dropDownValue,
                            employeeNameController: employeeNameController,
                            displayNameController: displayNameController,
                            initialController: initialController,
                            insuranceCodeController: insuranceCodeController,
                            pinNumberController: pinNumberController,
                            logOnNameController: logOnNameController,
                            passwordController: passwordController,
                            postCodeController: postCodeController,
                            addressController: addressController,
                            countryController: countryController,
                            phoneController: phoneController,
                            emailController: emailController,
                            onTapCreateUser: () async {
                              if (_formKey.currentState!.validate()) {
                                await controller.signUp(
                                  role: dropDownValue ?? "",
                                  email: emailController.text.trim(),
                                  employeeName:
                                      employeeNameController.text.trim(),
                                  displayName:
                                      displayNameController.text.trim(),
                                  initials: initialController.text.trim(),
                                  pinNumber: pinNumberController.text.trim(),
                                  insuranceCode:
                                      insuranceCodeController.text.trim(),
                                  logonName: logOnNameController.text.trim(),
                                  password: passwordController.text.trim(),
                                  country: countryController.text.trim(),
                                  phoneNumber: phoneController.text.trim(),
                                  postCode: postCodeController.text.trim(),
                                  address: addressController.text.trim(),
                                );
                              }
                            },
                          );
                        });
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

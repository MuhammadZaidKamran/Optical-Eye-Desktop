import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/customer_files_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class NewPatientDialog extends StatelessWidget {
  NewPatientDialog({super.key});

  //Column 01
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final postCodeController = TextEditingController();

  //Column 02
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();

  final customerFileController = Get.put(CustomerFilesController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerFilesController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Dialog(
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
                  width: Get.width * 0.62,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Patient",
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
                myHeight(0.005),
                const Text(
                  "Patient Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                myHeight(0.01),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: nameController,
                          label: "Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: genderController,
                          label: "Gender",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter gender";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "DOB",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: dateOfBirthController,
                          label: "e.g: 10/10/2025",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Date of birth";
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
                          width: Get.width * 0.3,
                          controller: postCodeController,
                          maxLength: 6,
                          label: "Post Code",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Post Code";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                      ],
                    ),
                    myWidth(0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: emailController,
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
                        myHeight(0.007),
                        const Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: addressController,
                          label: "Address",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter address";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Contact Number",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.3,
                          controller: phoneController,
                          label: "Contact Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Phone Number";
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
                          width: Get.width * 0.3,
                          controller: countryController,
                          label: "Country",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Country";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                      ],
                    ),
                  ],
                ),
                myHeight(0.045),
                SizedBox(
                  width: Get.width * 0.62,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      MyButton(
                        btnFontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(5),
                        secondary: true,
                        height: Get.height * 0.06,
                        width: Get.width * 0.145,
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
                        width: Get.width * 0.145,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.addPatient(
                              name: nameController.text.trim(),
                              gender: genderController.text.trim(),
                              dateOfBirth: dateOfBirthController.text.trim(),
                              postCode: postCodeController.text.trim(),
                              email: emailController.text.trim(),
                              address: addressController.text.trim(),
                              contactNumber: phoneController.text.trim(),
                              country: countryController.text.trim(),
                            );
                          }
                        },
                        label: "Add",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
                      fontSize: 18,
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
              style: TextStyle(
                fontSize: 15,
              ),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: nameController,
                        label: "Name"),
                    myHeight(0.007),
                    const Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: genderController,
                        label: "Gender"),
                    myHeight(0.007),
                    const Text(
                      "DOB",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: dateOfBirthController,
                        label: "e.g: 10/10/2025"),
                    myHeight(0.007),
                    const Text(
                      "Post Code",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: postCodeController,
                        label: "Post Code"),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: emailController,
                        label: "Email"),
                    myHeight(0.007),
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: addressController,
                        label: "Address"),
                    myHeight(0.007),
                    const Text(
                      "Contact Number",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: phoneController,
                        label: "Contact Number"),
                    myHeight(0.007),
                    const Text(
                      "Country",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.3,
                        controller: countryController,
                        label: "Country"),
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
                    height: Get.height * 0.06,
                    width: Get.width * 0.145,
                    onTap: () {},
                    label: "Add",
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

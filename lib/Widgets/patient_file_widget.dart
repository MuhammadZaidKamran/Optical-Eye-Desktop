import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class PatientFileWidget extends StatelessWidget {
  PatientFileWidget({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final postCodeController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width * 0.72,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
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
              "Patient File",
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
                        width: Get.width * 0.35,
                        controller: nameController,
                        label: "Name"),
                    myHeight(0.007),
                    const Text(
                      "DOB",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.35,
                        controller: dateOfBirthController,
                        label: "e.g: 10/10/2025"),
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
                        width: Get.width * 0.35,
                        controller: emailController,
                        label: "Email"),
                    myHeight(0.007),
                    const Text(
                      "Post Code",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                        width: Get.width * 0.35,
                        controller: postCodeController,
                        label: "Post Code"),
                  ],
                ),
              ],
            ),
            myHeight(0.045),
            SizedBox(
              width: Get.width * 0.72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Spacer(),
                  // MyButton(
                  //   btnFontWeight: FontWeight.normal,
                  //   borderRadius: BorderRadius.circular(5),
                  //   secondary: true,
                  //   height: Get.height * 0.06,
                  //   width: Get.width * 0.145,
                  //   onTap: () {
                  //     Get.back();
                  //   },
                  //   label: "Cancel",
                  // ),
                  // myWidth(0.01),
                  MyButton(
                    btnFontWeight: FontWeight.normal,
                    borderRadius: BorderRadius.circular(5),
                    height: Get.height * 0.06,
                    width: Get.width * 0.145,
                    onTap: () {},
                    label: "Apply",
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

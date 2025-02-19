import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class SecurityPinDialogWidget extends StatelessWidget {
  const SecurityPinDialogWidget({super.key, required this.pinController, required this.onTap});
  final TextEditingController pinController;
  final VoidCallback onTap;

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
            const Text(
              "PIN required for access to this Function.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.03),
            const Text(
              "Enter PIN Number",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            myHeight(0.01),
            MyTextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              width: Get.width * 0.3,
              controller: pinController,
              label: "Enter PIN Number",
            ),
            myHeight(0.03),
            SizedBox(
              width: Get.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyButton(
                    btnFontWeight: FontWeight.normal,
                    borderRadius: BorderRadius.circular(5),
                    secondary: true,
                    height: Get.height * 0.06,
                    width: Get.width * 0.14,
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
                    width: Get.width * 0.14,
                    onTap: onTap,
                    label: "Continue",
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

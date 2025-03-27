import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: myPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width * 0.2,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: Get.width * 0.02,
                  child: const CloseButtonWidget(),
                ),
              ),
            ),
            const Icon(
              Icons.warning_rounded,
              color: Colors.amberAccent,
              size: 80,
            ),
            myHeight(0.02),
            SizedBox(
              width: Get.width * 0.2,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            myHeight(0.02),
            MyButton(
              onTap: onTap ?? () {
                Get.back();
              },
              label: "Ok",
              width: Get.width * 0.2,
              height: Get.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}

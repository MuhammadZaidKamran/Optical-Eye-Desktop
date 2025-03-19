import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';

class DropdownDialogErrorWidget extends StatelessWidget {
  const DropdownDialogErrorWidget({super.key, required this.title});
  final String title;

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
          children: [
            SizedBox(
              width: Get.width * 0.25,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                    width: Get.width * 0.02, child: const CloseButtonWidget()),
              ]),
            ),
            const Icon(
              Icons.warning,
              size: 100,
              color: Colors.amber,
            ),
            myHeight(0.01),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            myHeight(0.03),
            SizedBox(
                width: Get.width * 0.25,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      height: Get.height * 0.06,
                      width: Get.width * 0.12,
                      secondary: true,
                      onTap: () {
                        Get.close(2);
                      },
                      label: "Cancel",
                    ),
                    MyButton(
                      height: Get.height * 0.06,
                      width: Get.width * 0.12,
                      onTap: () {
                        Get.back();
                      },
                      label: "Ok",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';

class DispenseItemDialog extends StatefulWidget {
  const DispenseItemDialog({super.key});

  @override
  State<DispenseItemDialog> createState() => _DispenseItemDialogState();
}

class _DispenseItemDialogState extends State<DispenseItemDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: whiteColor,
      child: Padding(
        padding: myPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Item Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
            myHeight(0.02),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: borderColor,
                  )),
              child: Column(
                children: [
                   Row(
                    children: [
                      CustomerFilesPatientDetailsWidget(
                        containerText: "Grp",
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      CustomerFilesPatientDetailsWidget(
                          containerText: "Item Type"),
                      CustomerFilesPatientDetailsWidget(containerText: "Name"),
                      CustomerFilesPatientDetailsWidget(
                          containerText: "Item Code"),
                      CustomerFilesPatientDetailsWidget(
                          containerText: "Description"),
                      CustomerFilesPatientDetailsWidget(containerText: "Qty"),
                      CustomerFilesPatientDetailsWidget(
                        containerText: "Price",
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  myHeight(0.01),
                  SizedBox(
                    height: Get.height * 0.55,
                    width: Get.width,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.012,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 15,
                      // separatorBuilder: (context, index) {
                      //   return myHeight(0.02);
                      // },
                      itemBuilder: (context, index) {
                        return DispenseWidget(
                          tabItem01: "SP",
                          tabItem02: "Frame",
                          tabItem03: "GRAND ADVANTAGE",
                          tabItem04: "SV63",
                          tabItem05: "Black Black, 55x18, 145",
                          tabItem06: "3",
                          tabItem07: "190.00",
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            myHeight(0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(width: Get.width * 0.2, onTap: () {}, label: "Refund"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

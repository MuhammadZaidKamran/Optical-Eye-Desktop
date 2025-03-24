import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_spectacles_dialog.dart';

class NewDispenseDialog extends StatefulWidget {
  const NewDispenseDialog({super.key});

  @override
  State<NewDispenseDialog> createState() => _NewDispenseDialogState();
}

class _NewDispenseDialogState extends State<NewDispenseDialog> {
  final itemController = TextEditingController();
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
              width: Get.width * 0.8,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Dispense",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  CloseButtonWidget(),
                ],
              ),
            ),
            myHeight(0.03),
            Container(
              width: Get.width * 0.8,
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
                        containerText: "Item Type",
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      CustomerFilesPatientDetailsWidget(containerText: "Name"),
                      CustomerFilesPatientDetailsWidget(
                          containerText: "Item Code"),
                      CustomerFilesPatientDetailsWidget(containerText: "Qty"),
                      CustomerFilesPatientDetailsWidget(
                        isSecondary: true,
                        width: Get.width * 0.18,
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
                          tabItem01: "Frame",
                          tabItem02: "GRAND ADVANTAGE",
                          tabItem03: "SV63",
                          tabItem04: "3",
                          tabItem06: "190.00",
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            myHeight(0.03),
            SizedBox(
              width: Get.width * 0.8,
              child: Row(
                children: [
                  MyButton(
                    height: Get.height * 0.07,
                    width: Get.width * 0.15,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const NewDispenseSpectaclesDialog();
                          });
                    },
                    label: "Spectacles",
                  ),
                  myWidth(0.01),
                  MyButton(
                    height: Get.height * 0.07,
                    width: Get.width * 0.15,
                    onTap: () {},
                    label: "Lenses",
                  ),
                  const Spacer(),
                  const Text(
                    "Total Amount: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myWidth(0.01),
                  Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Rs.360",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  myWidth(0.02),
                  MyButton(
                      height: Get.height * 0.07,
                      width: Get.width * 0.15,
                      onTap: () {},
                      label: "Send to Till")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

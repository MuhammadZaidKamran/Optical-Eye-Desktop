import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class NewDispenseSpectaclesDialog extends StatefulWidget {
  const NewDispenseSpectaclesDialog({super.key});

  @override
  State<NewDispenseSpectaclesDialog> createState() =>
      _NewDispenseSpectaclesDialogState();
}

class _NewDispenseSpectaclesDialogState
    extends State<NewDispenseSpectaclesDialog> {
  final itemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: myPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width * 0.6,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spectacles",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CloseButtonWidget(),
                ],
              ),
            ),
            myHeight(0.02),
            SizedBox(
              width: Get.width * 0.6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Frames",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      myHeight(0.02),
                      const Text(
                        "Item / Code",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      myHeight(0.01),
                      MyTextField(
                        width: Get.width * 0.2,
                        controller: itemController,
                        label: "Item / Code",
                      ),
                      myHeight(0.01),
                      const Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      myHeight(0.01),
                      MyTextField(
                        width: Get.width * 0.2,
                        controller: itemController,
                        label: "Size",
                      ),
                      myHeight(0.01),
                      const Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      myHeight(0.01),
                      MyTextField(
                        width: Get.width * 0.2,
                        controller: itemController,
                        label: "Price",
                      ),
                      myHeight(0.01),
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      myHeight(0.01),
                      MyTextField(
                        width: Get.width * 0.2,
                        controller: itemController,
                        label: "Quantity",
                      ),
                    ],
                  ),
                  myWidth(0.02),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Other Measurements",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      myHeight(0.02),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              myHeight(0.025),
                              const Text("R",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Dist PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Dist PD"),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Near PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Near PD"),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Inter PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Inter PD"),
                            ],
                          ),
                        ],
                      ),
                      myHeight(0.02),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              myHeight(0.025),
                              const Text("L",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Dist PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Dist PD"),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Near PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Near PD"),
                            ],
                          ),
                          myWidth(0.01),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Inter PD",
                              ),
                              MyTextField(
                                  width: Get.width * 0.1,
                                  controller: itemController,
                                  label: "Inter PD"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
            myHeight(0.02),
            SizedBox(
              width: Get.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                      width: Get.width * 0.15,
                      height: Get.height * 0.07,
                      onTap: () {},
                      label: "Ok")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

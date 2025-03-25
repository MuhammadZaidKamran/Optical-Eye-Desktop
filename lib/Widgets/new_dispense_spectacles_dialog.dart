import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/dispense_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class NewDispenseSpectaclesDialog extends StatefulWidget {
  const NewDispenseSpectaclesDialog({super.key, required this.patientID});
  final String patientID;

  @override
  State<NewDispenseSpectaclesDialog> createState() =>
      _NewDispenseSpectaclesDialogState();
}

class _NewDispenseSpectaclesDialogState
    extends State<NewDispenseSpectaclesDialog> {
  // Frames
  String? itemDropDownValue;
  final sizeController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final itemCodeController = TextEditingController();

  // Other Measurements
  final distPDController = TextEditingController();
  final nearPDController = TextEditingController();
  final interPDController = TextEditingController();
  final distPDController_2 = TextEditingController();
  final nearPDController_2 = TextEditingController();
  final interPDController_2 = TextEditingController();

  final dispenseController = Get.put(DispenseController());
  final _formKey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;
  List<String> items = [];

  displayItemDropDownFunc() async {
    fireStore.collection("spectaclesStock").snapshots().listen((snapshot) {
      items = snapshot.docs.map((e) => e["name"].toString()).toList();
      setState(() {});
    });
  }

  @override
  void initState() {
    displayItemDropDownFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: GetBuilder<DispenseController>(builder: (controller) {
            return Form(
              key: _formKey,
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
                              "Item",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            myHeight(0.01),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: MyDropDown(
                                label: const Text("Item"),
                                dropDownValue: itemDropDownValue,
                                items: items,
                                onChanged: (value) {
                                  itemDropDownValue = value;
                                  setState(() {});
                                },
                              ),
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
                              controller: sizeController,
                              label: "Size",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter size";
                                }
                                return null;
                              },
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
                              controller: priceController,
                              label: "Price",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter price";
                                }
                                return null;
                              },
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
                              controller: quantityController,
                              label: "Quantity",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter quantity";
                                }
                                return null;
                              },
                            ),
                            myHeight(0.01),
                            const Text(
                              "Item Code",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            myHeight(0.01),
                            MyTextField(
                              width: Get.width * 0.2,
                              controller: itemCodeController,
                              label: "Item Code",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter item code";
                                }
                                return null;
                              },
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
                                      controller: distPDController,
                                      label: "Dist PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter dist PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: nearPDController,
                                      label: "Near PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter near PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: interPDController,
                                      label: "Inter PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter inter PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: distPDController_2,
                                      label: "Dist PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter dist PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: nearPDController_2,
                                      label: "Near PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter near PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                                      controller: interPDController_2,
                                      label: "Inter PD",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter inter PD";
                                        }
                                        return null;
                                      },
                                    ),
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
                            onTap: () async {
                              if (itemDropDownValue == null ||
                                  itemDropDownValue!.isEmpty ||
                                  itemDropDownValue == "") {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const WarningDialog(
                                          title: "Please Select Item");
                                    });
                              } else if (_formKey.currentState!.validate()) {
                                await controller.addDispense(
                                  patientID: widget.patientID,
                                  type: "Spectacles",
                                  item: itemDropDownValue ?? "",
                                  size: sizeController.text.trim(),
                                  price: priceController.text.trim(),
                                  quantity: quantityController.text.trim(),
                                  itemCode: itemCodeController.text.trim(),
                                  distPD: distPDController.text.trim(),
                                  nearPD: nearPDController.text.trim(),
                                  interPD: interPDController.text.trim(),
                                  distPD_2: distPDController_2.text.trim(),
                                  nearPD_2: nearPDController_2.text.trim(),
                                  interPD_2: interPDController_2.text.trim(),
                                );
                              }
                            },
                            label: "Ok")
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

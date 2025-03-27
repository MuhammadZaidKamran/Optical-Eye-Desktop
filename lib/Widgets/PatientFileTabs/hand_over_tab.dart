import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class HandOverTab extends StatefulWidget {
  const HandOverTab({super.key});

  @override
  State<HandOverTab> createState() => _HandOverTabState();
}

class _HandOverTabState extends State<HandOverTab> {
  String myValue_1 = "Multilocal";
  String myValue_2 = "Single Vision Dist";
  String myValue_3 = "Single Vision Inter";
  String myValue_4 = "Single Vision Near";
  String? groupValue;

  String myValue_5 = "Multilocal";
  String myValue_6 = "Single Vision Dist";
  String myValue_7 = "Single Vision Inter";
  String myValue_8 = "Single Vision Near";
  String? groupValue_2;

  String myValue_9 = "Private";
  String myValue_10 = "NHS";
  String? groupValue_3;

  final examinerController = TextEditingController();
  final handOverByController = TextEditingController();
  final handOverToController = TextEditingController();
  final examController = TextEditingController();

  final dispenseNotesController = TextEditingController();
  final clinicalNotesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.65,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Glasses",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.02),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width * 0.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Multilocal",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_1,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Dist",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_2,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Inter",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_3,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Near",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                activeColor: mainThemeColor,
                                value: myValue_4,
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    myHeight(0.02),
                    const Text(
                      "Sun glasses",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.02),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width * 0.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Multilocal",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_5,
                                  groupValue: groupValue_2,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue_2 = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Dist",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_6,
                                  groupValue: groupValue_2,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue_2 = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Inter",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_7,
                                  groupValue: groupValue_2,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue_2 = value.toString();
                                    });
                                  })
                            ],
                          ),
                          myHeight(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Single Vision Near",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Radio(
                                activeColor: mainThemeColor,
                                value: myValue_8,
                                groupValue: groupValue_2,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue_2 = value.toString();
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    myHeight(0.02),
                    const Text(
                      "Clinical Notes",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.01),
                    MyTextField(
                        maxLines: 3,
                        width: Get.width * 0.37,
                        controller: clinicalNotesController,
                        label: "Clinical Notes"),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "This Visit",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.02),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width * 0.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Visit Type",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          Row(
                            children: [
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_9,
                                  groupValue: groupValue_3,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue_3 = value.toString();
                                    });
                                  }),
                              myWidth(0.01),
                              const Text("Private"),
                              const Spacer(),
                              Radio(
                                  activeColor: mainThemeColor,
                                  value: myValue_10,
                                  groupValue: groupValue_3,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue_3 = value.toString();
                                    });
                                  }),
                              myWidth(0.01),
                              const Text("NHS"),
                            ],
                          ),
                          myHeight(0.01),
                          const Text(
                            "Examiner",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            controller: examinerController,
                            label: "Examiner",
                          ),
                          myHeight(0.01),
                          const Text("Handover By",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          myHeight(0.01),
                          MyTextField(
                            controller: handOverByController,
                            label: "Handover By",
                          ),
                          myHeight(0.01),
                          const Text("Handover To",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          myHeight(0.01),
                          MyTextField(
                            controller: handOverToController,
                            label: "Handover To",
                          ),
                        ],
                      ),
                    ),
                    myHeight(0.02),
                    const Text(
                      "Dispense Notes",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.01),
                    MyTextField(
                        maxLines: 3,
                        width: Get.width * 0.37,
                        controller: dispenseNotesController,
                        label: "Dispense Notes"),
                    myHeight(0.02),
                    SizedBox(
                      width: Get.width * 0.37,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(
                            secondary: true,
                            onTap: () {},
                            label: "Cancel",
                            width: Get.width * 0.17,
                          ),
                          MyButton(
                            onTap: () {},
                            label: "Do Handover",
                            width: Get.width * 0.17,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // myHeight(0.01),
            // Row(
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [

            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

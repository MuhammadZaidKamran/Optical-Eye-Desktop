import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/calculator_number_widget.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_item_dialog.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';

class TillView extends StatefulWidget {
  const TillView({super.key});

  @override
  State<TillView> createState() => _TillViewState();
}

class _TillViewState extends State<TillView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Till",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                MyButton(
                  onTap: () {},
                  label: "Cash",
                  width: Get.width * 0.11,
                  height: Get.height * 0.06,
                ),
                myWidth(0.01),
                MyButton(
                  onTap: () {},
                  label: "Payout",
                  width: Get.width * 0.11,
                  height: Get.height * 0.06,
                ),
                myWidth(0.01),
                MyButton(
                  onTap: () {},
                  label: "Payin",
                  width: Get.width * 0.11,
                  height: Get.height * 0.06,
                ),
                myWidth(0.01),
                MyButton(
                  onTap: () {},
                  label: "Receipt",
                  width: Get.width * 0.11,
                  height: Get.height * 0.06,
                ),
              ],
            ),
            myHeight(0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.6,
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
                            containerText: "Type",
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                            ),
                          ),
                          CustomerFilesPatientDetailsWidget(
                              containerText: "Reference"),
                          CustomerFilesPatientDetailsWidget(
                              containerText: "Date"),
                          CustomerFilesPatientDetailsWidget(
                              containerText: "By"),
                          CustomerFilesPatientDetailsWidget(
                              containerText: "Total"),
                          CustomerFilesPatientDetailsWidget(
                            containerText: "Status",
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                            ),
                          ),
                        ],
                      ),
                      myHeight(0.01),
                      SizedBox(
                        height: Get.height * 0.52,
                        width: Get.width * 0.6,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.012,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: 15,
                          // separatorBuilder: (context, index) {
                          //   return myHeight(0.01);
                          // },
                          itemBuilder: (context, index) {
                            return DispenseWidget(
                              tabItem01: "type",
                              tabItem02: "reference",
                              tabItem03: "date",
                              tabItem04: "by",
                              tabItem05: "total",
                              tabItem06: "status",
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const DispenseItemDialog();
                                    });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                myWidth(0.01),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: Get.height * 0.62,
                    width: Get.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.3,
                          width: Get.width,
                        ),
                        myHeight(0.01),
                        Expanded(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    const CalculatorNumberWidget(number: "1"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "2"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "3"),
                                    myHeight(0.01),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const CalculatorNumberWidget(number: "4"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "5"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "6"),
                                    myHeight(0.01),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const CalculatorNumberWidget(number: "7"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "8"),
                                    myHeight(0.01),
                                    const CalculatorNumberWidget(number: "9"),
                                    myHeight(0.01),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            myHeight(0.03),
            SizedBox(
              width: Get.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

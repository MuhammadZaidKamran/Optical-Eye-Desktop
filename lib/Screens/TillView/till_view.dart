import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/calculator_number_widget.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_item_dialog.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';

class TillView extends StatefulWidget {
  const TillView({super.key});

  @override
  State<TillView> createState() => _TillViewState();
}

class _TillViewState extends State<TillView> {
  final fireStore = FirebaseFirestore.instance;
  List displayTillItems = [];
  var total = 0;

  displayTill() async {
    fireStore.collection("dispenseSummary").snapshots().listen((snapshots) {
      for (var e in snapshots.docs) {
        var amount = 0;
        amount = int.parse(e["total"]);
        total += amount;
      }
      // snapshots.docs.sort((a, b) => b["date"].compareTo(a["date"]));
      displayTillItems = snapshots.docs.toList();
      if (mounted) setState(() {});
    });
    return displayTillItems;
  }

  @override
  void initState() {
    displayTill();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Till",
              style: TextStyle(
                color: blackColor,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
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
                        child: StreamBuilder(
                            stream: fireStore
                                .collection("dispenseSummary")
                                .snapshots(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.012,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemCount: displayTillItems.length,
                                itemBuilder: (context, index) {
                                  QueryDocumentSnapshot data =
                                      displayTillItems[index];
                                  return DispenseWidget(
                                    tabItem01: data["type"],
                                    tabItem02: data["id"],
                                    tabItem03: data["date"],
                                    tabItem04: data["by"],
                                    tabItem05: "£${data["total"]}",
                                    tabItem06: data["status"],
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DispenseItemDialog(
                                              type: data["type"],
                                              reference: data.id,
                                              date: data["date"],
                                              by: data["by"],
                                              total: "${data["total"]}",
                                              status: data["status"],
                                              dispenseItemDetails:
                                                  data["dispenseItems"],
                                            );
                                          });
                                    },
                                  );
                                },
                              );
                            }),
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
                    child: Center(
                      child: Text(
                        "£$total",
                        style: const TextStyle(
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

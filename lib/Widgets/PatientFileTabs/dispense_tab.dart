import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_item_dialog.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_dialog.dart';

class DispenseTab extends StatefulWidget {
  const DispenseTab({super.key, required this.patientID});
  final String patientID;

  @override
  State<DispenseTab> createState() => _DispenseTabState();
}

class _DispenseTabState extends State<DispenseTab> {
  final firestore = FirebaseFirestore.instance;
  List displayDispenseSummary = [];

  displayDispense() async {
    firestore.collection("dispenseSummary").snapshots().listen((snapshots) {
      displayDispenseSummary = snapshots.docs
          .where((e) => e["patientID"] == widget.patientID)
          .toList();
      if (mounted) setState(() {});
    });
    return displayDispenseSummary;
  }

  @override
  void initState() {
    displayDispense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dispense Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            HoverButton(
              title: "New Dispense",
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NewDispenseDialog(
                        patientID: widget.patientID,
                      );
                    });
              },
            ),
          ],
        ),
        myHeight(0.03),
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
                    containerText: "Type",
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  CustomerFilesPatientDetailsWidget(containerText: "Reference"),
                  CustomerFilesPatientDetailsWidget(containerText: "Date"),
                  CustomerFilesPatientDetailsWidget(containerText: "By"),
                  CustomerFilesPatientDetailsWidget(containerText: "Total"),
                  CustomerFilesPatientDetailsWidget(
                    isSecondary: true,
                    width: Get.width * 0.15,
                    containerText: "Status",
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                ],
              ),
              myHeight(0.01),
              SizedBox(
                height: Get.height * 0.46,
                width: Get.width,
                child: displayDispenseSummary.isNotEmpty
                    ? StreamBuilder(
                        stream:
                            firestore.collection("dispenseSummary").snapshots(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.012,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: displayDispenseSummary.length,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot data =
                                  displayDispenseSummary[index];
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
                                          isDispense: true,
                                          patientID: widget.patientID,
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
                        })
                    : const Center(
                        child: Text("No dispense found!"),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

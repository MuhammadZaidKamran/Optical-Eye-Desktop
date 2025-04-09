import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key, required this.id});
  final String id;

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  List displayHistoryItems = [];
  final fireStore = FirebaseFirestore.instance;

  getAllHistory() {
    fireStore.collection("history").snapshots().listen((snapshot) {
      displayHistoryItems =
          snapshot.docs.where((e) => e["id"] == widget.id).toList();
      if (mounted) setState(() {});
    });
    return displayHistoryItems;
  }

  @override
  void initState() {
    getAllHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
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
                    containerText: "Logs",
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  CustomerFilesPatientDetailsWidget(
                    containerText: "Date",
                  ),
                  CustomerFilesPatientDetailsWidget(
                    isSecondary: true,
                    width: Get.width * 0.28,
                    containerText: "Time",
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                ],
              ),
              myHeight(0.01),
              SizedBox(
                height: Get.height * 0.49,
                width: Get.width,
                child: displayHistoryItems.isNotEmpty
                    ? StreamBuilder(
                        stream: fireStore.collection("history").snapshots(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.012,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: displayHistoryItems.length,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot data =
                                  displayHistoryItems[index];
                              return DispenseWidget(
                                tabItem01: data["log"].toString(),
                                tabItem02: data["date"].toString(),
                                tabItem03: data["time"].toString(),
                                onTap: () {},
                              );
                            },
                          );
                        })
                    : Center(
                        child: Text(
                          "No history found",
                          style: TextStyle(
                            fontSize: 16,
                            color: blackColor.withOpacity(0.5),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

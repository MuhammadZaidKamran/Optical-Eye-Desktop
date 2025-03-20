import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/add_appointment_dialog.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/add_diary_dialog.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/search_filter_dialog.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/update_dialog.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  final clinicListFireStore = FirebaseFirestore.instance.collection("diaries");
  final appointmentListFireStore =
      FirebaseFirestore.instance.collection("appointments");

  String appointmentDate = "";
  String clinicName = "";
  List displayClinics = [];
  List<String>? newDisplayClinics = [];

  List displayAppointments = [];

  int getAppointmentList() {
    appointmentListFireStore.snapshots().listen(cancelOnError: true,
        (snapshot) {
      if (appointmentDate != "") {
        displayAppointments = snapshot.docs
            .where((e) => e["date"]
                .toString()
                .toLowerCase()
                .contains(appointmentDate.toLowerCase()))
            .toList();
        if (mounted) setState(() {});
      } else if (clinicName != "") {
        displayAppointments = snapshot.docs
            .where((e) => e["clinicName"]
                .toString()
                .toLowerCase()
                .contains(clinicName.toLowerCase()))
            .toList();
        if (mounted) setState(() {});
      } else {
        displayAppointments = snapshot.docs.toList();
        if (mounted) setState(() {});
      }
    });
    return displayAppointments.length;
  }

  getClinicList() async {
    clinicListFireStore.snapshots().listen(cancelOnError: true, (snapshots) {
      displayClinics =
          snapshots.docs.map((e) => e["clinicName"].toString()).toList();
      newDisplayClinics = displayClinics as List<String>;
    });
  }

  @override
  void initState() {
    getClinicList();
    getAppointmentList();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Diary",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                const Spacer(),
                HoverButton(
                    title: "Add New Diary",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AddDiaryDialog();
                        },
                      );
                    }),
                myWidth(0.01),
                HoverButton(
                    title: "Add New Appointment",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AddAppointmentDialog(
                              displayItems: newDisplayClinics ?? [],
                            );
                          });
                    }),
                myWidth(0.01),
                InkWell(
                  onTap: () async {
                    final data = await showDialog(
                      context: context,
                      builder: (context) {
                        return SearchFilterDialog(
                          displayClinicList: newDisplayClinics ?? [],
                        );
                      },
                    );
                    if (data != null) {
                      appointmentDate = data?["appointmentDate"] ?? "";
                      clinicName = data?["clinicName"] ?? "";
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: borderColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Icon(Icons.manage_search_rounded,
                        size: 28, color: blackColor),
                  ),
                ),
              ],
            ),
            myHeight(0.035),
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
                        isSecondary: true,
                        containerText: "Name",
                        width: Get.width * 0.16,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      CustomerFilesPatientDetailsWidget(
                        containerText: "Type",
                        isSecondary: true,
                        width: Get.width * 0.16,
                      ),
                      CustomerFilesPatientDetailsWidget(
                          containerText: "Status"),
                      CustomerFilesPatientDetailsWidget(
                          isSecondary: true, containerText: "Clinic"),
                      CustomerFilesPatientDetailsWidget(
                        isSecondary: true,
                        containerText: "Date",
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                        ),
                      ),
                    ],
                  ),
                  myHeight(0.01),
                  SizedBox(
                    height: Get.height * 0.63,
                    width: Get.width,
                    child: StreamBuilder(
                        stream: appointmentListFireStore.snapshots(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.006,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: getAppointmentList(),
                            // separatorBuilder: (context, index) {
                            //   return myHeight(0.02);
                            // },
                            itemBuilder: (context, index) {
                              DocumentSnapshot data =
                                  displayAppointments[index];
                              return DispenseWidget(
                                isStatus: true,
                                containerColor: data["status"] == "Not Arrived"
                                    ? const Color.fromARGB(255, 255, 232, 147)
                                    : data["status"] == "Late"
                                        ? const Color.fromARGB(111, 255, 78, 66)
                                        : data["status"] == "Arrived"
                                            ? const Color.fromARGB(
                                                255, 169, 255, 172)
                                            : null,
                                tabItem01: data["name"].toString(),
                                tabItem02: data["type"].toString(),
                                tabItem03: data["status"].toString(),
                                tabItem04: data["clinicName"].toString(),
                                tabItem05: data["date"].toString(),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return UpdateDialog(
                                          id: data.id.toString(),
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
          ],
        ),
      ),
    );
  }
}

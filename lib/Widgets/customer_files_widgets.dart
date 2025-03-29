import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/PatientFileTabs/dispense_tab.dart';
import 'package:optical_eye_desktop/Widgets/PatientFileTabs/equipment_tab.dart';
import 'package:optical_eye_desktop/Widgets/PatientFileTabs/hand_over_tab.dart';
import 'package:optical_eye_desktop/Widgets/PatientFileTabs/history_tabs.dart';
import 'package:optical_eye_desktop/Widgets/PatientFileTabs/patient_tabs.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/new_patient_dialog.dart';
import 'package:optical_eye_desktop/Widgets/patient_file_tab_widget.dart';
import 'package:optical_eye_desktop/Widgets/patient_file_widget.dart';

class CustomerFilesWidgets extends StatefulWidget {
  const CustomerFilesWidgets({super.key});

  @override
  State<CustomerFilesWidgets> createState() => _CustomerFilesWidgetsState();
}

class _CustomerFilesWidgetsState extends State<CustomerFilesWidgets> {
  String patientId = "";
  String patientName = "";
  String patientGender = "";
  String patientDateOfBirth = "";
  String patientEmail = "";
  String patientAddress = "";
  String patientContactNumber = "";
  String patientPostCode = "";
  String patientCountry = "";

  final patientData = FirebaseFirestore.instance.collection("patients");
  int myIndex = 0;
  int tabIndex = 0;
  var displayItems = [];
  String name = "";
  String email = "";
  String dateOfBirth = "";
  String postCode = "";

  int searchFunction() {
    patientData.snapshots().listen(cancelOnError: true, (snapshot) {
      if (name != "") {
        displayItems = snapshot.docs
            .where(
              (e) => e["name"]
                  .toString()
                  .toLowerCase()
                  .contains(name.toLowerCase()),
            )
            .toList();
        if (mounted) setState(() {});
      } else if (email != "") {
        displayItems = snapshot.docs
            .where(
              (e) => e["email"]
                  .toString()
                  .toLowerCase()
                  .contains(email.toLowerCase()),
            )
            .toList();
        if (mounted) setState(() {});
      } else if (dateOfBirth != "") {
        displayItems = snapshot.docs
            .where(
              (e) => e["dateOfBirth"]
                  .toString()
                  .toLowerCase()
                  .contains(dateOfBirth.toLowerCase()),
            )
            .toList();
        if (mounted) setState(() {});
      } else if (postCode != "") {
        displayItems = snapshot.docs
            .where(
              (e) => e["postCode"]
                  .toString()
                  .toLowerCase()
                  .contains(postCode.toLowerCase()),
            )
            .toList();
        if (mounted) setState(() {});
      } else {
        displayItems = snapshot.docs.toList();
        if (mounted) setState(() {});
      }
    });
    return displayItems.length;
  }

  @override
  void initState() {
    searchFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: myPadding,
        child: myIndex == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Customer Files",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () async {
                          final data = await showDialog(
                              context: context,
                              builder: (context) {
                                return PatientFileWidget();
                              });
                          if (data != null) {
                            name = data["name"].toString();
                            email = data["email"].toString();
                            dateOfBirth = data["dateOfBirth"].toString();
                            postCode = data["postCode"].toString();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Icon(Icons.menu, color: blackColor),
                        ),
                      ),
                    ],
                  ),
                  myHeight(0.02),
                  MyButton(
                      btnFontWeight: FontWeight.normal,
                      borderRadius: BorderRadius.circular(5),
                      height: Get.height * 0.06,
                      width: Get.width * 0.12,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return NewPatientDialog();
                            });
                      },
                      label: "Add New Patient"),
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
                              containerText: "Full Name",
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                              ),
                            ),
                            CustomerFilesPatientDetailsWidget(
                                containerText: "Post Code"),
                            CustomerFilesPatientDetailsWidget(
                                containerText: "Patient ID"),
                            CustomerFilesPatientDetailsWidget(
                              containerText: "DOB",
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ],
                        ),
                        myHeight(0.01),
                        SizedBox(
                          height: Get.height * 0.52,
                          width: Get.width,
                          child: StreamBuilder(
                              stream: patientData.snapshots(),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.012,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: searchFunction(),
                                  // separatorBuilder: (context, index) {
                                  //   return myHeight(0.02);
                                  // },
                                  itemBuilder: (context, index) {
                                    final data = displayItems[index];
                                    return DispenseWidget(
                                      tabItem01: data?["name"].toString() ?? "",
                                      tabItem02:
                                          data?["postCode"].toString() ?? "",
                                      tabItem03: data?.id.toString() ?? "",
                                      tabItem04:
                                          data?["dateOfBirth"].toString() ?? "",
                                      onTap: () {
                                        myIndex = 1;
                                        patientId = data?.id.toString() ?? "";
                                        patientName =
                                            data?["name"].toString() ?? "";
                                        patientGender =
                                            data?["gender"].toString() ?? "";
                                        patientDateOfBirth =
                                            data?["dateOfBirth"].toString() ??
                                                "";
                                        patientEmail =
                                            data?["email"].toString() ?? "";
                                        patientAddress =
                                            data?["address"].toString() ?? "";
                                        patientContactNumber =
                                            data?["contactNumber"].toString() ??
                                                "";
                                        patientPostCode =
                                            data?["postCode"].toString() ?? "";
                                        patientCountry =
                                            data?["country"].toString() ?? "";
                                        setState(() {});
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
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          myIndex = 0;
                          setState(() {});
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                      myWidth(0.01),
                      Text(
                        "Patient File",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      ),
                    ],
                  ),
                  myHeight(0.04),
                  Row(
                    mainAxisAlignment: userModel?.role == "Sales Manager"
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      PatientFileTabWidget(
                        text: "Patient",
                        containerColor:
                            tabIndex == 0 ? mainThemeColor : whiteColor,
                        textColor: tabIndex == 0 ? whiteColor : mainThemeColor,
                        borderColor:
                            tabIndex == 0 ? Colors.transparent : mainThemeColor,
                        onTap: () {
                          tabIndex = 0;
                          setState(() {});
                        },
                      ),
                      userModel?.role == "Sales Manager"
                          ? const SizedBox(
                              width: 20,
                            )
                          : userModel?.role == "Optom"
                              ? const Spacer()
                              : PatientFileTabWidget(
                                  text: "History",
                                  containerColor: tabIndex == 1
                                      ? mainThemeColor
                                      : whiteColor,
                                  textColor: tabIndex == 1
                                      ? whiteColor
                                      : mainThemeColor,
                                  borderColor: tabIndex == 1
                                      ? Colors.transparent
                                      : mainThemeColor,
                                  onTap: () {
                                    tabIndex = 1;
                                    setState(() {});
                                  },
                                ),
                      userModel?.role == "Sales Manager"
                          ? const SizedBox()
                          : PatientFileTabWidget(
                              text: "Equipment",
                              containerColor:
                                  tabIndex == 2 ? mainThemeColor : whiteColor,
                              textColor:
                                  tabIndex == 2 ? whiteColor : mainThemeColor,
                              borderColor: tabIndex == 2
                                  ? Colors.transparent
                                  : mainThemeColor,
                              onTap: () {
                                tabIndex = 2;
                                setState(() {});
                              },
                            ),
                      userModel?.role == "Sales Manager"
                          ? const SizedBox()
                          : userModel?.role == "Optom"
                              ? const Spacer()
                              : const SizedBox(),
                      userModel?.role == "Sales Manager"
                          ? const SizedBox()
                          : PatientFileTabWidget(
                              text: "Handover",
                              containerColor:
                                  tabIndex == 3 ? mainThemeColor : whiteColor,
                              textColor:
                                  tabIndex == 3 ? whiteColor : mainThemeColor,
                              borderColor: tabIndex == 3
                                  ? Colors.transparent
                                  : mainThemeColor,
                              onTap: () {
                                tabIndex = 3;
                                setState(() {});
                              },
                            ),
                      userModel?.role == "Optom"
                          ? const Spacer()
                          : PatientFileTabWidget(
                              text: "Dispensing",
                              containerColor:
                                  tabIndex == 4 ? mainThemeColor : whiteColor,
                              textColor:
                                  tabIndex == 4 ? whiteColor : mainThemeColor,
                              borderColor: tabIndex == 4
                                  ? Colors.transparent
                                  : mainThemeColor,
                              onTap: () {
                                tabIndex = 4;
                                setState(() {});
                              },
                            ),
                    ],
                  ),
                  myHeight(0.03),
                  if (tabIndex == 0)
                    PatientTabs(
                      id: patientId,
                      name: patientName,
                      gender: patientGender,
                      dateOfBirth: patientDateOfBirth,
                      email: patientEmail,
                      address: patientAddress,
                      contactNumber: patientContactNumber,
                      postCode: patientPostCode,
                      country: patientCountry,
                    ),
                  if (tabIndex == 1)
                    userModel?.role == "Optom"
                        ? Container()
                        : HistoryTab(id: patientId,),
                  if (tabIndex == 2)
                    EquipmentTab(
                      patientID: patientId,
                    ),
                  if (tabIndex == 3) const HandOverTab(),
                  if (tabIndex == 4)
                    userModel?.role == "Optom"
                        ? Container()
                        : DispenseTab(
                            patientID: patientId,
                          ),
                ],
              ),
      ),
    );
  }
}

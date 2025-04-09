import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/SupportView/update_employee_dialog.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';

class AllEmployeesView extends StatefulWidget {
  const AllEmployeesView({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<AllEmployeesView> createState() => _AllEmployeesViewState();
}

class _AllEmployeesViewState extends State<AllEmployeesView> {
  List displayEmployees = [];
  final fireStore = FirebaseFirestore.instance;

  getAllEmployees() {
    fireStore.collection("users").snapshots().listen((snapshot) {
      displayEmployees = snapshot.docs.toList();
      if (mounted) setState(() {});
    });
    return displayEmployees;
  }

  @override
  void initState() {
    getAllEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
                onTap: widget.onTap, child: const Icon(Icons.arrow_back_ios)),
            myWidth(0.01),
            const Text(
              "All Employees",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
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
                    isSecondary: true,
                    containerText: "Role",
                    width: Get.width * 0.15,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  CustomerFilesPatientDetailsWidget(
                    containerText: "Name",
                    isSecondary: true,
                    width: Get.width * 0.15,
                  ),
                  CustomerFilesPatientDetailsWidget(
                    containerText: "Email",
                  ),
                  CustomerFilesPatientDetailsWidget(
                      width: Get.width * 0.19,
                      isSecondary: true,
                      containerText: "Phone Number"),
                  CustomerFilesPatientDetailsWidget(
                    isSecondary: true,
                    width: Get.width * 0.13,
                    containerText: "Actions",
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                ],
              ),
              myHeight(0.01),
              SizedBox(
                height: Get.height * 0.65,
                width: Get.width,
                child: displayEmployees.isNotEmpty
                    ? StreamBuilder(
                        stream: fireStore.collection("users").snapshots(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.006,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: displayEmployees.length,
                            itemBuilder: (context, index) {
                              QueryDocumentSnapshot data =
                                  displayEmployees[index];
                              return DispenseWidget(
                                isIcon2: true,
                                icon2: Icons.edit_outlined,
                                tabItem01: data["role"],
                                tabItem02: data["employeeName"],
                                tabItem03: data["email"],
                                tabItem04: data["phoneNumber"],
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return UpdateEmployeeDialog(
                                          employeeID: data.id,
                                          employeeName: data["employeeName"],
                                          displayName: data["displayName"],
                                          initials: data["initials"],
                                          insuranceCode: data["insuranceCode"],
                                          logonName: data["logonName"],
                                          password: data["password"],
                                          phoneNumber: data["phoneNumber"],
                                          pinNumber: data["pinNumber"],
                                          postCode: data["postCode"],
                                          role: data["role"],
                                          newRole: data["role"],
                                          country: data["country"],
                                          address: data["address"],
                                          email: data["email"],
                                        );
                                      });
                                },
                              );
                            },
                          );
                        })
                    : const Center(
                        child: Text(
                          "No employees found",
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

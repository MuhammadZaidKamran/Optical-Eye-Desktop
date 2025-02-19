import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/CustomerFiles/search_customer.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/patient_file_widget.dart';
import 'package:optical_eye_desktop/Widgets/select_role_widget.dart';

class CustomerFilesWidgets extends StatefulWidget {
  const CustomerFilesWidgets({super.key});

  @override
  State<CustomerFilesWidgets> createState() => _CustomerFilesWidgetsState();
}

class _CustomerFilesWidgetsState extends State<CustomerFilesWidgets> {
  int myIndex = 0;
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
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PatientFileWidget();
                              });
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
                        // NewPatientDialog()
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const SelectRoleWidget();
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
                        const Row(
                          children: [
                            CustomerFilesPatientDetailsWidget(
                              containerText: "Full Name",
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                              ),
                            ),
                            CustomerFilesPatientDetailsWidget(
                                containerText: "Post Code"),
                            CustomerFilesPatientDetailsWidget(
                                containerText: "Patient ID"),
                            CustomerFilesPatientDetailsWidget(
                              containerText: "Last Visit",
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                              ),
                            ),
                          ],
                        ),
                        myHeight(0.01),
                        SizedBox(
                          height: Get.height * 0.52,
                          width: Get.width,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 15,
                            separatorBuilder: (context, index) {
                              return myHeight(0.03);
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  myIndex = 1;

                                  setState(() {});
                                },
                                child: const SearchCustomerList(
                                  fullName: "Isa Khan",
                                  postCode: "SA-345",
                                  patientId: "#206",
                                  lastVisit: "14/02/2023",
                                ),
                              );
                            },
                          ),
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
                        child: const Icon(Icons.arrow_back),
                      ),
                      myWidth(0.02),
                      Text(
                        "Patient File",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      ),
                    ],
                  ),
                  myHeight(0.07),
                  const Row(
                    children: [
                      Text(
                        "Name : Isa Khan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

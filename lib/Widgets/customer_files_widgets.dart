import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/CustomerFiles/search_customer.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/new_patient_dialog.dart';
import 'package:optical_eye_desktop/Widgets/patient_file_widget.dart';

class CustomerFilesWidgets extends StatefulWidget {
  const CustomerFilesWidgets({super.key});

  @override
  State<CustomerFilesWidgets> createState() => _CustomerFilesWidgetsState();
}

class _CustomerFilesWidgetsState extends State<CustomerFilesWidgets> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: myPadding,
        child: Column(
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
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.4),
                            // border: Border(
                            //     right: BorderSide(
                            //   color: blackColor,
                            // )),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            // border: Border(
                            //     right: BorderSide(
                            //   color: blackColor,
                            // )),
                            color: borderColor.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Text(
                              "Post Code",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.4),
                            // border: Border(
                            //     right: BorderSide(
                            //   color: blackColor,
                            // )),
                          ),
                          child: Center(
                            child: Text(
                              "Patient ID",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              "Last Visit",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                          ),
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
                        return const SearchCustomerList(
                          fullName: "Isa Khan",
                          postCode: "SA-345",
                          patientId: "#206",
                          lastVisit: "14/02/2023",
                        );
                      },
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/CustomerFiles/patient_file.dart';
import 'package:optical_eye_desktop/Widgets/my_app_bar.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';
import 'package:optical_eye_desktop/Widgets/new_patient_dialog.dart';

class SearchCustomer extends StatefulWidget {
  const SearchCustomer({super.key});

  @override
  State<SearchCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCustomer> {
  final idController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final postCodeController = TextEditingController();
  final addressController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
          secondary: true,
          name: "${userModel!.firstName} ${userModel!.lastName}",
          email: userModel!.email.toString(),
          onTapLogOut: () {
            Get.back();
          }),
      body: Padding(
        padding: myPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search Patient",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            myHeight(0.015),
            SearchPatientContainerWidget(
                idController: idController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                postCodeController: postCodeController,
                addressController: addressController,
                dateOfBirthController: dateOfBirthController,
                genderController: genderController),
            myHeight(0.02),
            Text("Patient Results",
                style: TextStyle(
                    color: blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            myHeight(0.015),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: mainThemeColor,
                            border: Border(
                                right: BorderSide(
                              color: whiteColor,
                            )),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                              color: whiteColor,
                            )),
                            color: mainThemeColor,
                          ),
                          child: Center(
                            child: Text(
                              "Post Code",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: mainThemeColor,
                            border: Border(
                                right: BorderSide(
                              color: whiteColor,
                            )),
                          ),
                          child: Center(
                            child: Text(
                              "Patient ID",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: mainThemeColor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              "Last Visit",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  myHeight(0.01),
                  SizedBox(
                    height: Get.height * 0.3,
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
            // myHeight(0.015),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  height: Get.height * 0.06,
                  onTap: () {
                    Get.to(() => const PatientFile());
                  },
                  label: "Search",
                  width: Get.width * 0.15,
                ),
                myWidth(0.01),
                MyButton(
                  height: Get.height * 0.06,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return NewPatientDialog();
                        });
                  },
                  label: "New Patient",
                  width: Get.width * 0.15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SearchCustomerList extends StatelessWidget {
  const SearchCustomerList(
      {super.key,
      required this.fullName,
      required this.postCode,
      required this.patientId,
      required this.lastVisit});
  final String fullName;
  final String postCode;
  final String patientId;
  final String lastVisit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Center(
              child: Text(
                fullName,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Center(
              child: Text(
                postCode,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Center(
              child: Text(
                patientId,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Center(
              child: Text(
                lastVisit,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchPatientContainerWidget extends StatelessWidget {
  const SearchPatientContainerWidget(
      {super.key,
      required this.idController,
      required this.firstNameController,
      required this.lastNameController,
      required this.postCodeController,
      required this.addressController,
      required this.dateOfBirthController,
      required this.genderController});
  final TextEditingController idController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController postCodeController;
  final TextEditingController addressController;
  final TextEditingController dateOfBirthController;
  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: myPadding,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient ID",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: idController,
                label: "Patient ID",
                width: Get.width * 0.23,
              ),
              myHeight(0.01),
              Text(
                "First Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: firstNameController,
                label: "First Name",
                width: Get.width * 0.23,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: lastNameController,
                label: "Last Name",
                width: Get.width * 0.23,
              ),
              myHeight(0.01),
              Text(
                "Post Code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: postCodeController,
                label: "Post Code",
                width: Get.width * 0.23,
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Address",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            myHeight(0.006),
            MyTextField(
              controller: addressController,
              label: "Address",
              width: Get.width * 0.23,
            ),
            myHeight(0.01),
            Text(
              "DOB",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            myHeight(0.006),
            MyTextField(
              controller: dateOfBirthController,
              label: "e.g: 14/02/2026",
              width: Get.width * 0.23,
            ),
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
            myHeight(0.006),
            MyTextField(
              controller: genderController,
              label: "Gender",
              width: Get.width * 0.23,
            ),
          ]),
        ],
      ),
    );
  }
}

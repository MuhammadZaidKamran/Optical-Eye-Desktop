import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class PatientTabs extends StatefulWidget {
  const PatientTabs(
      {super.key,
      required this.name,
      required this.gender,
      required this.dateOfBirth,
      required this.email,
      required this.address,
      required this.contactNumber,
      required this.postCode,
      required this.country});
  final String name;
  final String gender;
  final String dateOfBirth;
  final String email;
  final String address;
  final String contactNumber;
  final String postCode;
  final String country;

  @override
  State<PatientTabs> createState() => _PatientTabsState();
}

class _PatientTabsState extends State<PatientTabs> {
  //Column 01
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  //Column 02
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();

  //Column 03
  final postCodeController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    genderController.text = widget.gender;
    dateOfBirthController.text = widget.dateOfBirth;
    emailController.text = widget.email;
    addressController.text = widget.address;
    contactNumberController.text = widget.contactNumber;
    postCodeController.text = widget.postCode;
    countryController.text = widget.country;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account Information",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        myHeight(0.03),
        Container(
          padding: myPadding,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: nameController,
                    label: "Name",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                  Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: genderController,
                    label: "Gender",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                  Text(
                    "DOB",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: dateOfBirthController,
                    label: "e.g: 14/03/2001",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: emailController,
                    label: "Email",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: addressController,
                    label: "Address",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                  Text(
                    "Contact Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: contactNumberController,
                    label: "Contact Number",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Post Code",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: postCodeController,
                    label: "Post Code",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                  Text(
                    "Country",
                    style: TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.01),
                  MyTextField(
                    width: Get.width * 0.23,
                    controller: countryController,
                    label: "Country",
                    readOnly: true,
                  ),
                  myHeight(0.02),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Row(
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Text(
    //           "Name : Isa Khan",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Gender : Male",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Date Of Birth : 14/03/2001",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Post Code : SA-345",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //     myWidth(0.2),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Text(
    //           "Email : isakhan@gmail.com",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Address : Saudia Arabia, Riyadh",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Contact Number : 1234567890",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //         myHeight(0.04),
    //         const Text(
    //           "Country : Saudi Arabia",
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // )
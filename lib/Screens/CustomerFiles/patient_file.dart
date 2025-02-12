import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_app_bar.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class PatientFile extends StatefulWidget {
  const PatientFile({super.key});

  @override
  State<PatientFile> createState() => _PatientFileState();
}

class _PatientFileState extends State<PatientFile> {
  //Column 01
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  //Column 02
  final genderController = TextEditingController();
  final contactController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  //Column 03
  final postCodeController = TextEditingController();
  final registeredDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
          name: "${userModel!.firstName} ${userModel!.lastName}",
          email: userModel!.email.toString()),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            height: Get.height,
            width: Get.width * 0.18,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                myHeight(0.035),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: hoverColor,
                      border: Border(
                          left: BorderSide(color: whiteColor, width: 2))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/user.png",
                        scale: 3,
                      ),
                      myWidth(0.02),
                      Text(
                        "Customer Files",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ListTile(
                  onTap: () => Get.back(),
                  leading: Icon(
                    Icons.logout,
                    color: whiteColor,
                  ),
                  title: Text(
                    "Go to Menu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: myPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Patient File",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  Text(
                    "Patient details",
                    style: TextStyle(
                      fontSize: 16,
                      color: blackColor,
                    ),
                  ),
                  myHeight(0.02),
                  PatientFileContainerWidget(
                    name: "${userModel!.firstName} ${userModel!.lastName}",
                    email: userModel!.email.toString(),
                    nameController: nameController,
                    emailController: emailController,
                    addressController: addressController,
                    genderController: genderController,
                    contactController: contactController,
                    dateOfBirthController: dateOfBirthController,
                    postCodeController: postCodeController,
                    registeredDateController: registeredDateController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PatientFileContainerWidget extends StatelessWidget {
  const PatientFileContainerWidget(
      {super.key,
      required this.name,
      required this.email,
      required this.nameController,
      required this.emailController,
      required this.addressController,
      required this.genderController,
      required this.contactController,
      required this.dateOfBirthController,
      required this.postCodeController,
      required this.registeredDateController});

  final String name;
  final String email;

  //Column 01
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;

  //Column 02
  final TextEditingController genderController;
  final TextEditingController contactController;
  final TextEditingController dateOfBirthController;

  //Column 03
  final TextEditingController postCodeController;
  final TextEditingController registeredDateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: myPadding,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myHeight(0.05),
              const Icon(
                Icons.account_circle_outlined,
                size: 100,
              ),
              Text(
                name.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              // myHeight(0.01),
              SizedBox(
                width: Get.width * 0.1,
                child: Text(
                  email.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          myWidth(0.025),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: nameController,
                label: "Name",
                width: Get.width * 0.2,
              ),
              myHeight(0.01),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: emailController,
                label: "Email",
                width: Get.width * 0.2,
              ),
              myHeight(0.01),
              const Text(
                "Address",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: addressController,
                label: "Address",
                width: Get.width * 0.2,
              ),
            ],
          ),
          myWidth(0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gender",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: genderController,
                label: "Gender",
                width: Get.width * 0.2,
              ),
              myHeight(0.01),
              const Text(
                "Contact",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: contactController,
                label: "Contact Number",
                width: Get.width * 0.2,
              ),
              myHeight(0.01),
              const Text(
                "DOB",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: dateOfBirthController,
                label: "Date of Birth",
                width: Get.width * 0.2,
              ),
            ],
          ),
          myWidth(0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Post Code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: postCodeController,
                label: "Post Code",
                width: Get.width * 0.2,
              ),
              myHeight(0.01),
              const Text(
                "Registered Date",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              myHeight(0.006),
              MyTextField(
                controller: registeredDateController,
                label: "e.g: 14/01/2025",
                width: Get.width * 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

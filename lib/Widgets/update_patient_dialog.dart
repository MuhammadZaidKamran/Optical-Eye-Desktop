import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:optical_eye_desktop/Controllers/customer_files_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class UpdatePatientDialog extends StatefulWidget {
  const UpdatePatientDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.postCode,
      required this.gender,
      required this.address,
      required this.country,
      required this.dateOfBirth,
      required this.contactNumber});
  final String id;
  final String name;
  final String email;
  final String postCode;
  final String gender;
  final String address;
  final String country;
  final String dateOfBirth;
  final String contactNumber;

  @override
  State<UpdatePatientDialog> createState() => _UpdatePatientDialogState();
}

class _UpdatePatientDialogState extends State<UpdatePatientDialog> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final postCodeController = TextEditingController();
  final genderController = TextEditingController();

  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final patientController = Get.put(CustomerFilesController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.name;
    emailController.text = widget.email;
    postCodeController.text = widget.postCode;
    genderController.text = widget.gender;
    addressController.text = widget.address;
    countryController.text = widget.country;
    dateOfBirthController.text = widget.dateOfBirth;
    phoneNumberController.text = widget.contactNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerFilesController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: whiteColor,
          child: Padding(
            padding: myPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Get.width * 0.6,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Update Patient",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      CloseButtonWidget(),
                    ],
                  ),
                ),
                myHeight(0.02),
                SizedBox(
                  width: Get.width * 0.6,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: nameController,
                            label: "Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter name";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: emailController,
                            label: "Email",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "Post Code",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: postCodeController,
                            label: "Post Code",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter post code";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: genderController,
                            label: "Gender",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter gender";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: addressController,
                            label: "Address",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter address";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "Country",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: countryController,
                            label: "Country",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter country";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "DOB",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: dateOfBirthController,
                            label: "e.g: 12/12/2021",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Date of birth is required";
                              }
                              return null;
                            },
                          ),
                          myHeight(0.02),
                          const Text(
                            "Contact Number",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          myHeight(0.01),
                          MyTextField(
                            width: Get.width * 0.25,
                            controller: phoneNumberController,
                            label: "Contact Number",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter contact number";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                myHeight(0.04),
                SizedBox(
                  width: Get.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                          height: Get.height * 0.07,
                          width: Get.width * 0.25,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              myLoadingDialog(Get.context!);
                              await FirebaseFirestore.instance
                                  .collection("patients")
                                  .doc(widget.id)
                                  .set({
                                "name": nameController.text.trim(),
                                "email": emailController.text.trim(),
                                "postCode": postCodeController.text.trim(),
                                "gender": genderController.text.trim(),
                                "address": addressController.text.trim(),
                                "country": countryController.text.trim(),
                                "dateOfBirth":
                                    dateOfBirthController.text.trim(),
                                "contactNumber":
                                    phoneNumberController.text.trim(),
                              }).then((value) {
                                Get.close(1);
                                if (mounted) setState(() {});
                                mySuccessSnackBar(
                                    context: Get.context!,
                                    message: "Patient Successfully Updated!");
                                Get.back(result: {
                                  "name": nameController.text.trim(),
                                  "email": emailController.text.trim(),
                                  "postCode": postCodeController.text.trim(),
                                  "gender": genderController.text.trim(),
                                  "address": addressController.text.trim(),
                                  "country": countryController.text.trim(),
                                  "dateOfBirth":
                                      dateOfBirthController.text.trim(),
                                  "contactNumber":
                                      phoneNumberController.text.trim(),
                                });
                                if (mounted) setState(() {});
                              }).catchError((error) {
                                Get.close(1);
                                if (mounted) setState(() {});
                                myErrorSnackBar(
                                    context: Get.context!, message: "$error");
                              }).then((value) async {
                                await FirebaseFirestore.instance
                                    .collection("history")
                                    .add({
                                  "id": widget.id.toString(),
                                  "log": "Patient File Updated!",
                                  "date":
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                  "time": DateFormat('KK:mm:ss a')
                                      .format(DateTime.now()),
                                });
                              });
                            }
                          },
                          label: "Update"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

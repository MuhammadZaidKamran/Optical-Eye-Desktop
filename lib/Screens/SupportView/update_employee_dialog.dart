import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class UpdateEmployeeDialog extends StatefulWidget {
  const UpdateEmployeeDialog(
      {super.key,
      required this.employeeName,
      required this.displayName,
      required this.initials,
      required this.insuranceCode,
      required this.pinNumber,
      required this.logonName,
      required this.password,
      required this.country,
      required this.phoneNumber,
      required this.postCode,
      required this.address,
      required this.role,
      required this.email,
      required this.newRole,
      required this.employeeID});
  final String employeeID;
  final String employeeName;
  final String displayName;
  final String initials;
  final String insuranceCode;
  final String pinNumber;
  final String logonName;
  final String password;
  final String country;
  final String phoneNumber;
  final String postCode;
  final String address;
  final String role;
  final String email;
  final String newRole;

  @override
  State<UpdateEmployeeDialog> createState() => _UpdateEmployeeDialogState();
}

class _UpdateEmployeeDialogState extends State<UpdateEmployeeDialog> {
  //Identification
  final employeeNameController = TextEditingController();
  final displayNameController = TextEditingController();
  final initialController = TextEditingController();
  final insuranceCodeController = TextEditingController();
  final pinNumberController = TextEditingController();

  //Security
  final logOnNameController = TextEditingController();
  final passwordController = TextEditingController();

  //External Address
  final postCodeController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  String? dropdownValue2;
  final _formKey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    employeeNameController.text = widget.employeeName;
    displayNameController.text = widget.displayName;
    initialController.text = widget.initials;
    insuranceCodeController.text = widget.insuranceCode;
    pinNumberController.text = widget.pinNumber;
    logOnNameController.text = widget.logonName;
    passwordController.text = widget.password;
    postCodeController.text = widget.postCode;
    addressController.text = widget.address;
    countryController.text = widget.country;
    phoneController.text = widget.phoneNumber;
    emailController.text = widget.email;
    dropdownValue2 = widget.newRole;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Dialog(
        backgroundColor: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          padding: myPadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.64,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Update Employee",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.close(1),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: mainThemeColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close_rounded,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), // myHeight(0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Identification",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        myHeight(0.01),
                        const Text(
                          "Employee Name",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: employeeNameController,
                          label: "Employee Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter employee name";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Display Name",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: displayNameController,
                          label: "Display Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter display name";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Initials",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: initialController,
                          label: "Initials",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter initials";
                            }
                            return null;
                          },
                        ),
                        widget.role == "Optom" ? myHeight(0.007) : myHeight(0),
                        widget.role == "Optom"
                            ? const Text(
                                "Insurance Code",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : const SizedBox(),
                        widget.role == "Optom" ? myHeight(0.004) : myHeight(0),
                        widget.role == "Optom"
                            ? MyTextField(
                                width: Get.width * 0.2,
                                controller: insuranceCodeController,
                                label: "Insurance Code",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter insurance code";
                                  }
                                  return null;
                                },
                              )
                            : const SizedBox(),
                        myHeight(0.007),
                        const Text(
                          "PIN Number",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: pinNumberController,
                          label: "PIN Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter PIN number";
                            }
                            return null;
                          },
                        ),
                        // myHeight(0.01),
                      ],
                    ),
                    myWidth(0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Security",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        myHeight(0.01),
                        const Text(
                          "Logon Name",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: logOnNameController,
                          label: "Logon Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter logon name";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: passwordController,
                          label: "Password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            } else if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Role",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        SizedBox(
                          width: Get.width * 0.2,
                          child: MyDropDown(
                            label: const Text("Select Role"),
                            dropDownValue: dropdownValue2,
                            items: const [
                              "Sales Manager",
                              "Admin",
                              "Branch Manager",
                              "Optom",
                            ],
                            onChanged: (value) {
                              dropdownValue2 = value;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    myWidth(0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "External Address",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        myHeight(0.01),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: emailController,
                          label: "Email",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email";
                            } else if (!GetUtils.isEmail(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Country",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: countryController,
                          label: "Country",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter country";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: phoneController,
                          label: "Phone Number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter phone number";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Post Code",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: postCodeController,
                          label: "Post Code",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter post code";
                            }
                            return null;
                          },
                        ),
                        myHeight(0.007),
                        const Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        myHeight(0.004),
                        MyTextField(
                          width: Get.width * 0.2,
                          controller: addressController,
                          label: "Adress",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter address";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                myHeight(0.045),
                SizedBox(
                  width: Get.width * 0.64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyButton(
                        btnFontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(5),
                        secondary: true,
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        onTap: () {
                          Get.back();
                        },
                        label: "Cancel",
                      ),
                      myWidth(0.01),
                      MyButton(
                        btnFontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(5),
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        onTap: () async {
                          if (dropdownValue2 == null || dropdownValue2 == "") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "Please select employee role");
                                });
                          } else if (_formKey.currentState!.validate()) {
                            myLoadingDialog(Get.context!);
                            await fireStore
                                .collection("users")
                                .doc(widget.employeeID)
                                .update({
                              "employeeName":
                                  employeeNameController.text.trim(),
                              "displayName": displayNameController.text.trim(),
                              "email": emailController.text.trim(),
                              "initials": initialController.text.trim(),
                              "insuranceCode":
                                  insuranceCodeController.text.trim(),
                              "logonName": logOnNameController.text.trim(),
                              "password": passwordController.text.trim(),
                              "phoneNumber": phoneController.text.trim(),
                              "pinNumber": pinNumberController.text.trim(),
                              "postCode": postCodeController.text.trim(),
                              "role": dropdownValue2,
                              "address": addressController.text.trim(),
                              "country": countryController.text.trim(),
                            }).then((value) {
                              Get.close(2);
                              if (mounted) setState(() {});
                              mySuccessSnackBar(
                                  context: Get.context!,
                                  message:
                                      "Employee File Updated Successfully!");
                            }).catchError((error) {
                              Get.back();
                              if (mounted) setState(() {});
                              myErrorSnackBar(
                                  context: Get.context!, message: "$error");
                            });
                          }
                        },
                        label: "Update",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

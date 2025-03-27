import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/diary_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/diary_dropdown_widget.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class AddAppointmentDialog extends StatefulWidget {
  const AddAppointmentDialog({super.key, required this.displayItems});
  final List<String> displayItems;

  @override
  State<AddAppointmentDialog> createState() => _AddAppointmentDialogState();
}

class _AddAppointmentDialogState extends State<AddAppointmentDialog> {
  final dateController = TextEditingController();
  // final diaryController = TextEditingController();
  final durationController = TextEditingController();
  final typeController = TextEditingController();
  // final lastAppTimeController = TextEditingController();
  final statusController = TextEditingController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final postCodeController = TextEditingController();

  String? clinicNameDropdownValue;

  final _formKey = GlobalKey<FormState>();
  final addAppointmentController = Get.put(DiaryController());
  final fireStore = FirebaseFirestore.instance;
  List displayItems = [];

  getSuggestion(String input) async {
    QuerySnapshot querySnapshot =
        await fireStore.collection("appointments").get();

    List<Map<String, dynamic>> items = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    displayItems = items
        .where((e) =>
            e["name"].toString().toLowerCase().contains(input.toLowerCase()))
        .map((e) => e["name"].toString()) // Extract actual name
        .toList();

    if (mounted) setState(() {});
  }

  @override
  void initState() {
    statusController.text = "Not Arrived";
    super.initState();
    nameController.addListener(() {
      getSuggestion(nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiaryController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Dialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: myPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.width * 0.72,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Appointment",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        const CloseButtonWidget(),
                      ],
                    ),
                  ),
                  myHeight(0.01),
                  const Text("New Appointment",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  myHeight(0.008),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: dateController,
                            label: "Date",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter date";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      myWidth(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Type",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: typeController,
                            label: "Type",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter type";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       "Status",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //     myHeight(0.004),
                      //     MyTextField(
                      //       readOnly: true,
                      //       width: Get.width * 0.35,
                      //       controller: statusController,
                      //       label: "Status",
                      //     ),
                      //   ],
                      // ),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       "Diary",
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //     myHeight(0.004),
                      //     MyTextField(
                      //       width: Get.width * 0.35,
                      //       controller: diaryController,
                      //       label: "Diary",
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return "Please enter diary name";
                      //         }
                      //         return null;
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  myHeight(0.015),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Duration",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: durationController,
                            label: "e.g: 15 Mins",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter duration / time";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      myWidth(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Select Clinic",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: MyDropDown(
                              items: widget.displayItems,
                              label: const Text("Clinic / Branch"),
                              dropDownValue: clinicNameDropdownValue,
                              onChanged: (value) {
                                clinicNameDropdownValue = value;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  myHeight(0.015),
                  const Text("Patient Information",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  myHeight(0.008),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: nameController,
                            label: "Name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter name";
                              }
                              return null;
                            },
                          ),
                          displayItems.isEmpty
                              ? const SizedBox()
                              : myHeight(0.01),
                          displayItems.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.35,
                                  child: ListView.builder(
                                      itemCount: displayItems.length,
                                      itemBuilder: (context, index) {
                                        final item = displayItems[index];
                                        return ListTile(
                                          onTap: () async {
                                            QuerySnapshot snapshot =
                                                await fireStore
                                                    .collection("appointments")
                                                    .get();
                                            for (QueryDocumentSnapshot doc
                                                in snapshot.docs) {
                                              if (doc["name"] == item) {
                                                nameController.text =
                                                    doc["name"];
                                                emailController.text =
                                                    doc["email"];
                                                postCodeController.text =
                                                    doc["postCode"];
                                                dateOfBirthController.text =
                                                    doc["dateOfBirth"];
                                              }
                                            }
                                          },
                                          title: Text("$item"),
                                        );
                                      }),
                                )
                        ],
                      ),
                      myWidth(0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: emailController,
                            label: "Email",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              } else if (!value.contains("@")) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  myHeight(0.015),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "DOB",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: dateOfBirthController,
                            label: "e.g: 14/02/2006",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter date of birth";
                              }
                              return null;
                            },
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
                            ),
                          ),
                          myHeight(0.004),
                          MyTextField(
                            width: Get.width * 0.35,
                            controller: postCodeController,
                            label: "Post Code",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter post code";
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
                    width: Get.width * 0.72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        MyButton(
                          btnFontWeight: FontWeight.normal,
                          borderRadius: BorderRadius.circular(5),
                          secondary: true,
                          height: Get.height * 0.06,
                          width: Get.width * 0.145,
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
                          width: Get.width * 0.145,
                          onTap: () async {
                            if (clinicNameDropdownValue == "" ||
                                clinicNameDropdownValue == null) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const DropdownDialogErrorWidget(
                                        title: "Please Select Clinic");
                                  });
                            } else if (_formKey.currentState!.validate()) {
                              await controller.addNewAppointment(
                                date: dateController.text.trim(),
                                duration: durationController.text.trim(),
                                status: statusController.text.trim(),
                                type: typeController.text.trim(),
                                clinicName: clinicNameDropdownValue ?? "",
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                dateOfBirth: dateOfBirthController.text.trim(),
                                postCode: postCodeController.text.trim(),
                              );
                            }
                          },
                          label: "Add",
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
    });
  }
}

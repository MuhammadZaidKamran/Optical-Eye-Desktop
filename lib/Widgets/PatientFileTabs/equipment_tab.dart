import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:optical_eye_desktop/Controllers/customer_files_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/DiaryWidgets/diary_dropdown_widget.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class EquipmentTab extends StatefulWidget {
  const EquipmentTab({super.key, required this.patientID});
  final String patientID;

  @override
  State<EquipmentTab> createState() => _EquipmentTabState();
}

class _EquipmentTabState extends State<EquipmentTab> {
  List displayItems = [];
  final patientEquipmentFirestore =
      FirebaseFirestore.instance.collection("patientEquipments");
  final fireStore = FirebaseFirestore.instance;

  int displayItemsFunction() {
    patientEquipmentFirestore.snapshots().listen((snapshot) {
      displayItems = snapshot.docs
          .where((e) => e["patientID"] == widget.patientID)
          .toList();
      if (mounted) setState(() {});
    });

    return displayItems.length;
  }

  @override
  void initState() {
    displayItemsFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Equipment",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            HoverButton(
              title: "New",
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NewEquipmentDialog(
                        patientID: widget.patientID,
                      );
                    });
              },
            ),
          ],
        ),
        myHeight(0.03),
        SizedBox(
          height: Get.height * 0.57,
          width: Get.width,
          child: displayItems.isNotEmpty
              ? StreamBuilder(
                  stream: patientEquipmentFirestore.snapshots(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                      itemCount: displayItemsFunction(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              // childAspectRatio: 0,
                              childAspectRatio: 3 / 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final data = displayItems[index];
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return EquipmentDetailDialog(
                                  date: data["date"].toString(),
                                  lenseType: data["lenseType"] == "Left lense"
                                      ? "L"
                                      : "R",
                                  networkImage: data["imageLink"].toString(),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: whiteColor,
                              border: Border.all(color: mainThemeColor),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                data["imageLink"]
                                        .toString()
                                        .contains("https://")
                                    ? Image.network(
                                        data["imageLink"].toString(),
                                        height: Get.height * 0.18,
                                      )
                                    : Image.asset(
                                        "assets/img_not_found.jpg",
                                        height: Get.height * 0.2,
                                      ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data["lenseType"] == "Left lense"
                                          ? "L"
                                          : "R",
                                      style: TextStyle(
                                        color: redColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      data["date"].toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Equipment Not Found",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class EquipmentDetailDialog extends StatelessWidget {
  const EquipmentDetailDialog(
      {super.key,
      required this.date,
      required this.networkImage,
      required this.lenseType});
  final String date;
  final String networkImage;
  final String lenseType;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: myPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Equipment Detail",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: networkImage.toString().contains("https://")
                  ? Image.network(
                      networkImage.toString(),
                      height: Get.height * 0.18,
                    )
                  : Image.asset(
                      "assets/img_not_found.jpg",
                      height: Get.height * 0.2,
                    ),
            ),
            myHeight(0.02),
            SizedBox(
              width: Get.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lenseType.toString(),
                    style: TextStyle(
                      color: redColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myWidth(0.01),
                  Text(
                    date.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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

// ignore: must_be_immutable
class NewEquipmentDialog extends StatefulWidget {
  const NewEquipmentDialog({
    super.key,
    required this.patientID,
  });
  final String patientID;

  @override
  State<NewEquipmentDialog> createState() => _NewEquipmentDialogState();
}

class _NewEquipmentDialogState extends State<NewEquipmentDialog> {
  final imageLinkController = TextEditingController();
  String? dropDownValue2;

  final equipmentController = Get.put(CustomerFilesController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerFilesController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Dialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: myPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Add New Equipment",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    )),
                myHeight(0.03),
                const Text(
                  "Image Link",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                myHeight(0.01),
                MyTextField(
                  width: Get.width * 0.3,
                  controller: imageLinkController,
                  label: "image link",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please insert image link";
                    }
                    return null;
                  },
                ),
                myHeight(0.02),
                const Text(
                  "Left lense/Right lense",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                myHeight(0.01),
                MyDropDown(
                  label: const Text("Select lense type"),
                  dropDownValue: dropDownValue2,
                  items: const ["Left lense", "Right lense"],
                  onChanged: (value) {
                    setState(() {
                      dropDownValue2 = value!;
                    });
                  },
                ),
                myHeight(0.02),
                SizedBox(
                  width: Get.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyButton(
                        secondary: true,
                        height: Get.height * 0.06,
                        width: Get.width * 0.14,
                        label: "Cancel",
                        onTap: () {
                          Get.back();
                        },
                      ),
                      MyButton(
                        height: Get.height * 0.06,
                        width: Get.width * 0.14,
                        label: "Add",
                        onTap: () async {
                          if (dropDownValue2 == null || dropDownValue2 == "") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const DropdownDialogErrorWidget(
                                      title: "Please select lense type");
                                });
                          } else if (_formKey.currentState!.validate()) {
                            await myLoadingDialog(Get.context!);
                            await FirebaseFirestore.instance
                                .collection("patientEquipments")
                                .add({
                              "patientID": widget.patientID,
                              "imageLink": imageLinkController.text.trim(),
                              "lenseType": dropDownValue2,
                              "date":
                                  "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                            }).then((value) async {
                              Get.close(2);
                              if (mounted) setState(() {});
                              mySuccessSnackBar(
                                  context: Get.context!,
                                  message: "Equipment successfully added!");
                              await FirebaseFirestore.instance
                                  .collection("history")
                                  .add({
                                "id": widget.patientID.toString(),
                                "log": "New Equipment Added!",
                                "date":
                                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                "time": DateFormat('KK:mm:ss a')
                                    .format(DateTime.now()),
                              });
                            }).catchError((error) {
                              Get.close(1);
                              if (mounted) setState(() {});
                              myErrorSnackBar(
                                  context: Get.context!, message: "$error");
                            });
                          }
                        },
                      ),
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

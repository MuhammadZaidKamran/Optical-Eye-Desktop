import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:optical_eye_desktop/Controllers/dispense_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_lense_dialog.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_spectacles_dialog.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class NewDispenseDialog extends StatefulWidget {
  const NewDispenseDialog({super.key, required this.patientID});
  final String patientID;

  @override
  State<NewDispenseDialog> createState() => _NewDispenseDialogState();
}

class _NewDispenseDialogState extends State<NewDispenseDialog> {
  final itemController = TextEditingController();
  final fireStore = FirebaseFirestore.instance;
  final dispenseController = Get.put(DispenseController());
  List dispenseItems = [];
  var totalAmount = 0;

  displayDispenseItems() {
    fireStore.collection("dispense").snapshots().listen((snapshots) {
      dispenseItems = snapshots.docs.toList();
      for (var e in snapshots.docs) {
        totalAmount += int.parse(e["price"].toString()) *
            int.parse(e["quantity"].toString());
      }
      if (mounted) setState(() {});
    });
  }

  List<Map<String, dynamic>> displayItems = [];

  displayList_2() async {
    QuerySnapshot querySnapshot = await fireStore.collection("dispense").get();

    List<Map<String, dynamic>> items = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
    displayItems = items;
    // print(displayItems);
    return items;
  }

  Future<void> clearCollection(String collectionPath) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionRef = firestore.collection(collectionPath);

    try {
      QuerySnapshot snapshot = await collectionRef.get();

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      debugPrint("Error deleting documents: $e");
    }
  }

  @override
  void initState() {
    displayList_2();
    displayDispenseItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: myPadding,
        child: GetBuilder<DispenseController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Get.width * 0.8,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Dispense",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    CloseButtonWidget(),
                  ],
                ),
              ),
              myHeight(0.03),
              Container(
                width: Get.width * 0.8,
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
                          containerText: "Item Type",
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                          ),
                        ),
                        CustomerFilesPatientDetailsWidget(
                            containerText: "Name"),
                        CustomerFilesPatientDetailsWidget(
                            containerText: "Item Code"),
                        CustomerFilesPatientDetailsWidget(containerText: "Qty"),
                        CustomerFilesPatientDetailsWidget(
                          isSecondary: true,
                          width: Get.width * 0.18,
                          containerText: "Price",
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    myHeight(0.01),
                    SizedBox(
                      height: Get.height * 0.55,
                      width: Get.width,
                      child: dispenseItems.isNotEmpty
                          ? StreamBuilder(
                              stream:
                                  fireStore.collection("dispense").snapshots(),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.012,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: dispenseItems.length,
                                  itemBuilder: (context, index) {
                                    final data = dispenseItems[index];
                                    double total = double.parse(
                                            data["quantity"].toString()) *
                                        double.parse(data["price"].toString());
                                    // total = totalAmount;
                                    return DispenseWidget(
                                      tabItem01: data["type"],
                                      tabItem02: data["item"],
                                      tabItem03: data["itemCode"],
                                      tabItem04: data["quantity"],
                                      tabItem06: total.toString(),
                                      onTap: () {},
                                    );
                                  },
                                );
                              })
                          : const Center(
                              child: Text(
                                "No Dispense Items",
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              myHeight(0.03),
              SizedBox(
                width: Get.width * 0.8,
                child: Row(
                  children: [
                    MyButton(
                      height: Get.height * 0.07,
                      width: Get.width * 0.15,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return NewDispenseSpectaclesDialog(
                                patientID: widget.patientID,
                              );
                            });
                      },
                      label: "Spectacles",
                    ),
                    myWidth(0.01),
                    MyButton(
                      height: Get.height * 0.07,
                      width: Get.width * 0.15,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return NewDispenseLenseDialog(
                                patientID: widget.patientID,
                              );
                            });
                      },
                      label: "Lenses",
                    ),
                    const Spacer(),
                    const Text(
                      "Total Amount: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myWidth(0.01),
                    Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "£$totalAmount",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    myWidth(0.02),
                    MyButton(
                        height: Get.height * 0.07,
                        width: Get.width * 0.15,
                        onTap: () async {
                          if (displayItems.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "No item found!");
                                });
                          } else {
                            myLoadingDialog(Get.context!);
                            await fireStore.collection("dispenseSummary").add({
                              "patientID": widget.patientID,
                              "id": fireStore
                                  .collection("dispenseSummary")
                                  .doc()
                                  .id,
                              "type": "Dispense",
                              "date":
                                  "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              "by": "by",
                              "total": totalAmount.toString(),
                              "status": "Collected",
                              "dispenseItems": displayItems,
                            }).then((value) async {
                              await clearCollection("dispense");
                              Get.close(2);
                              if (mounted) setState(() {});
                              mySuccessSnackBar(
                                  context: Get.context!,
                                  message:
                                      "Added Dispense Summary / Till Successfully!");
                            }).catchError((error) {
                              Get.back();
                              if (mounted) setState(() {});
                              myErrorSnackBar(
                                  context: Get.context!, message: "$error");
                            }).then((value) async {
                              await FirebaseFirestore.instance
                                  .collection("history")
                                  .add({
                                "id": widget.patientID.toString(),
                                "log": "New Dispense Created!",
                                "date":
                                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                "time": DateFormat('KK:mm:ss a')
                                    .format(DateTime.now()),
                              });
                            });
                          }
                          // await controller
                          //     .sendToTill(
                          //   patientID: widget.patientID.toString(),
                          //   type: "Dispense",
                          //   date:
                          //       "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          //   by: "by",
                          //   total: totalAmount.toString(),
                          //   status: "Collected",
                          //   dispenseItems: dispenseItems.toSet().toList(),
                          // );
                          //     .then((value) async {
                          //   print("done");
                          //   //   await FirebaseFirestore.instance
                          //   //       .collection("dispense")
                          //   //       .snapshots()
                          //   //       .listen((snapshots) {
                          //   //     var data = [];
                          //   //     snapshots.docs.clear();
                          //   //     data = snapshots.docs.toList();
                          //   //     setState(() {});
                          //   //     print(snapshots.docs.toList().toString());
                          //   //   });
                          // });
                        },
                        label: "Send to Till")
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

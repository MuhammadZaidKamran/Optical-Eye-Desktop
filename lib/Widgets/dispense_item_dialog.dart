import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/dispense_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

// ignore: must_be_immutable
class DispenseItemDialog extends StatefulWidget {
  DispenseItemDialog({
    super.key,
    required this.type,
    required this.reference,
    required this.date,
    required this.by,
    required this.total,
    required this.dispenseItemDetails,
    this.patientID,
    required this.status,
    this.isDispense = false,
  });
  final String type;
  String? patientID;
  final String reference;
  final String date;
  final String by;
  final String total;
  final String status;
  final List dispenseItemDetails;
  bool? isDispense = false;

  @override
  State<DispenseItemDialog> createState() => _DispenseItemDialogState();
}

class _DispenseItemDialogState extends State<DispenseItemDialog> {
  final dispenseController = Get.put(DispenseController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: whiteColor,
      child: Padding(
        padding: myPadding,
        child: GetBuilder<DispenseController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Item Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
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
              myHeight(0.02),
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
                          width: Get.width * 0.2,
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
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.012,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.dispenseItemDetails.length,
                        itemBuilder: (context, index) {
                          final data = widget.dispenseItemDetails[index];
                          return DispenseWidget(
                            tabItem01: data["type"],
                            tabItem02: data["item"],
                            tabItem03: data["itemCode"],
                            tabItem04: data["quantity"],
                            tabItem05: "£${data["price"]}",
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              myHeight(0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.isDispense == true
                      ? const SizedBox()
                      : MyButton(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "Waiting for external system");
                                });
                          },
                          label: "Receipt",
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                        ),
                  widget.isDispense == true ? const SizedBox() : myWidth(0.01),
                  widget.isDispense == true
                      ? const SizedBox()
                      : MyButton(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "Waiting for external system");
                                });
                          },
                          label: "Cash",
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                        ),
                  widget.isDispense == true ? const SizedBox() : myWidth(0.01),
                  widget.isDispense == true
                      ? const SizedBox()
                      : MyButton(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "Waiting for external system");
                                });
                          },
                          label: "PDQ",
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                        ),
                  widget.isDispense == true ? const SizedBox() : myWidth(0.01),
                  widget.isDispense == true
                      ? const SizedBox()
                      : MyButton(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title: "Waiting for external system");
                                });
                          },
                          label: "Voucher",
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                        ),
                  widget.isDispense == true ? const SizedBox() : myWidth(0.01),
                  widget.status == "Refund"
                      ? Container(
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(
                            color: borderColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Refunded",
                              style:
                                  TextStyle(color: blackColor.withOpacity(0.6)),
                            ),
                          ),
                        )
                      : MyButton(
                          width: Get.width * 0.11,
                          height: Get.height * 0.06,
                          onTap: () async {
                            await controller
                                .refundDispenseItems(
                              patientID: widget.patientID ?? "Not available",
                              type: widget.type,
                              date: widget.date,
                              by: widget.by,
                              total: "-${widget.total}",
                              status: "Refund",
                              dispenseItems: widget.dispenseItemDetails,
                            )
                                .then((value) async {
                              await FirebaseFirestore.instance
                                  .collection("dispenseSummary")
                                  .doc(widget.reference.toString())
                                  .update({
                                "status": "Refund",
                              });
                            });
                          },
                          label: "Refund"),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

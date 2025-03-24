import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_item_dialog.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_dialog.dart';

class DispenseTab extends StatefulWidget {
  const DispenseTab({super.key});

  @override
  State<DispenseTab> createState() => _DispenseTabState();
}

class _DispenseTabState extends State<DispenseTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dispense Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            HoverButton(
              title: "New Dispense",
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const NewDispenseDialog();
                    });
              },
            ),
          ],
        ),
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
                  CustomerFilesPatientDetailsWidget(
                    containerText: "Type",
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  CustomerFilesPatientDetailsWidget(containerText: "Reference"),
                  CustomerFilesPatientDetailsWidget(containerText: "Date"),
                  CustomerFilesPatientDetailsWidget(containerText: "By"),
                  CustomerFilesPatientDetailsWidget(containerText: "Total"),
                  CustomerFilesPatientDetailsWidget(
                    containerText: "Status",
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                    ),
                  ),
                ],
              ),
              myHeight(0.01),
              SizedBox(
                height: Get.height * 0.46,
                width: Get.width,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.012,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 15,
                  // separatorBuilder: (context, index) {
                  //   return myHeight(0.01);
                  // },
                  itemBuilder: (context, index) {
                    return DispenseWidget(
                      tabItem01: "type",
                      tabItem02: "reference",
                      tabItem03: "date",
                      tabItem04: "by",
                      tabItem05: "total",
                      tabItem06: "status",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const DispenseItemDialog();
                            });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

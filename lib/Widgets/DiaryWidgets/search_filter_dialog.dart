import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class SearchFilterDialog extends StatefulWidget {
  const SearchFilterDialog({super.key, required this.displayClinicList});
  final List<String> displayClinicList;

  @override
  State<SearchFilterDialog> createState() => _SearchFilterDialogState();
}

class _SearchFilterDialogState extends State<SearchFilterDialog> {
  final appointmentDateController = TextEditingController();
  String? clinicValueDropdown;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width * 0.4,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
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
            myHeight(0.02),
            Text(
              "Appointment Date",
              style: TextStyle(
                fontSize: 14,
                color: blackColor,
              ),
            ),
            myHeight(0.01),
            MyTextField(
              width: Get.width * 0.4,
              controller: appointmentDateController,
              label: "Appointment Date",
            ),
            myHeight(0.015),
            Text(
              "Clinic / Branch",
              style: TextStyle(
                fontSize: 14,
                color: blackColor,
              ),
            ),
            myHeight(0.01),
            SizedBox(
              width: Get.width * 0.4,
              child: MyDropDown(
                label: const Text("Clinic / Branch"),
                dropDownValue: clinicValueDropdown,
                items: widget.displayClinicList,
                onChanged: (value) {
                  clinicValueDropdown = value;
                  setState(() {});
                },
              ),
            ),
            myHeight(0.03),
            SizedBox(
              width: Get.width * 0.4,
              child: Align(
                alignment: Alignment.centerRight,
                child: MyButton(
                  btnFontWeight: FontWeight.normal,
                  borderRadius: BorderRadius.circular(5),
                  height: Get.height * 0.06,
                  width: Get.width * 0.19,
                  onTap: () {
                    Get.back(result: {
                      "appointmentDate": appointmentDateController.text.trim(),
                      "clinicName": clinicValueDropdown,
                    });
                  },
                  label: "Apply",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

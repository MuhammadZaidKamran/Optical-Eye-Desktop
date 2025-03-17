import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/diary_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class AddDiaryDialog extends StatefulWidget {
  const AddDiaryDialog({super.key});

  @override
  State<AddDiaryDialog> createState() => _AddDiaryDialogState();
}

class _AddDiaryDialogState extends State<AddDiaryDialog> {
  final addDiaryController = Get.put(DiaryController());
  final clinicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                        "New Diary",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Clinic Name",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    myHeight(0.004),
                    MyTextField(
                      width: Get.width * 0.4,
                      controller: clinicController,
                      label: "Clinic Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter clinic name";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                myHeight(0.03),
                SizedBox(
                  width: Get.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      MyButton(
                        btnFontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(5),
                        secondary: true,
                        height: Get.height * 0.06,
                        width: Get.width * 0.19,
                        onTap: () {
                          Get.back();
                        },
                        label: "Cancel",
                      ),
                      // myWidth(0.01),
                      MyButton(
                        btnFontWeight: FontWeight.normal,
                        borderRadius: BorderRadius.circular(5),
                        height: Get.height * 0.06,
                        width: Get.width * 0.19,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.addNewDiary(
                                clinicName: clinicController.text.trim());
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
      );
    });
  }
}

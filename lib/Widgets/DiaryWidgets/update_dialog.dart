import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/diary_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';

class UpdateDialog extends StatefulWidget {
  const UpdateDialog({
    super.key,
    required this.id,
  });
  final String id;
  // final VoidCallback onTap;

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  String selectStatus = "Not Arrived";
  final diaryController = Get.put(DiaryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiaryController>(builder: (controller) {
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
                width: Get.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                    const CloseButtonWidget(),
                  ],
                ),
              ),
              myHeight(0.03),
              MyDropDown(
                label: const Text("Status"),
                dropDownValue: selectStatus,
                items: const [
                  "Not Arrived",
                  "Late",
                  "Arrived",
                ],
                onChanged: (value) {
                  selectStatus = value!;
                  setState(() {});
                },
              ),
              myHeight(0.03),
              SizedBox(
                width: Get.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    MyButton(
                      btnFontWeight: FontWeight.normal,
                      borderRadius: BorderRadius.circular(5),
                      secondary: true,
                      height: Get.height * 0.06,
                      width: Get.width * 0.14,
                      onTap: () {
                        Get.back();
                      },
                      label: "Cancel",
                    ),
                    MyButton(
                      btnFontWeight: FontWeight.normal,
                      borderRadius: BorderRadius.circular(5),
                      height: Get.height * 0.06,
                      width: Get.width * 0.14,
                      onTap: () async {
                        myLoadingDialog(Get.context!);
                        await FirebaseFirestore.instance
                            .collection("appointments")
                            .doc(widget.id)
                            .update({
                          "status": selectStatus,
                        }).then((value) {
                          if (mounted) setState(() {});
                          Get.close(2);
                          mySuccessSnackBar(
                              context: Get.context!,
                              message: "Status Updated Successfully!");
                        }).catchError((error) {
                          if (mounted) setState(() {});
                          Get.close(1);
                          myErrorSnackBar(
                              context: Get.context!, message: "$error");
                        });
                      },
                      label: "Update",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_drop_down.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class EquipmentTab extends StatefulWidget {
  const EquipmentTab({super.key});

  @override
  State<EquipmentTab> createState() => _EquipmentTabState();
}

class _EquipmentTabState extends State<EquipmentTab> {
  final imageLinkController = TextEditingController();
  String? dropDownValue2;
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
                        imageLinkController: imageLinkController,
                        dropDownValue2: dropDownValue2,
                        onTap: () {},
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
          child: GridView.builder(
            itemCount: 12,
            // shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                // childAspectRatio: 0,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const EquipmentDetailDialog();
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
                      Image.asset(
                        "assets/lense_img.jpg",
                        // scale: 5.2,
                        height: Get.height * 0.18,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R",
                            style: TextStyle(
                              color: redColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "14/02/2024",
                            style: TextStyle(
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
          ),
        ),
      ],
    );
  }
}


class EquipmentDetailDialog extends StatelessWidget {
  const EquipmentDetailDialog({super.key});

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
              child: Image.asset(
                "assets/lense_img.jpg",
                scale: 2,
              ),
            ),
            myHeight(0.02),
            SizedBox(
              width: Get.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R",
                    style: TextStyle(
                      color: redColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  myWidth(0.01),
                  const Text(
                    "14/02/2024",
                    style: TextStyle(
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
  NewEquipmentDialog(
      {super.key,
      required this.imageLinkController,
      this.dropDownValue2,
      required this.onTap});
  final TextEditingController imageLinkController;
  String? dropDownValue2;
  final VoidCallback onTap;

  @override
  State<NewEquipmentDialog> createState() => _NewEquipmentDialogState();
}

class _NewEquipmentDialogState extends State<NewEquipmentDialog> {
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
              controller: widget.imageLinkController,
              label: "image link",
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
              dropDownValue: widget.dropDownValue2,
              items: const ["Left lense", "Right lense"],
              onChanged: (value) {
                setState(() {
                  widget.dropDownValue2 = value!;
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
                    onTap: widget.onTap,
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

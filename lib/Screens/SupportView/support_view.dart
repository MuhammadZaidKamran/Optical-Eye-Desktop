import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/select_role_widget.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: myPadding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Support",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              HoverButton(
                  title: "Add Employee",
                  onTap: () {
                    if (userModel?.role == "Sales Manager") {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const WarningDialog(
                                title: "You are not eligible to add Employee");
                          });
                    } else if (userModel?.role == "Optom") {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const WarningDialog(
                                title: "You are not eligible to add Employee");
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const SelectRoleWidget();
                          });
                    }
                  })
            ],
          ),
          // SizedBox(
          //   width: Get.width,
          //   height: Get.height * 0.7,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: Text(
          //           "Under Construction",
          //           style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: blackColor.withOpacity(0.4)),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    ));
  }
}

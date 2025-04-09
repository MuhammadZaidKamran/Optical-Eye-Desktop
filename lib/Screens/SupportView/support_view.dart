import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/SupportView/all_employees_view.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/select_role_widget.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: myPadding,
      child: index == 0
          ? Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Support",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                    const Spacer(),
                    HoverButton(
                        title: "All Employees",
                        onTap: () {
                          if (userModel?.role == "Sales Manager") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title:
                                          "You are not eligible to view Employee details");
                                });
                          } else if (userModel?.role == "Optom") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title:
                                          "You are not eligible to view Employee details");
                                });
                          } else {
                            index = 1;
                            setState(() {});
                          }
                        }),
                    myWidth(0.01),
                    HoverButton(
                        title: "Add Employee",
                        onTap: () {
                          if (userModel?.role == "Sales Manager") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title:
                                          "You are not eligible to add Employee");
                                });
                          } else if (userModel?.role == "Optom") {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const WarningDialog(
                                      title:
                                          "You are not eligible to add Employee");
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
                myHeight(0.02),
                Expanded(
                    child: Center(
                  child: Image.asset("assets/center_image.png",
                      fit: BoxFit.cover),
                ))
              ],
            )
          : AllEmployeesView(
              onTap: () {
                index = 0;
                setState(() {});
              },
            ),
    ));
  }
}

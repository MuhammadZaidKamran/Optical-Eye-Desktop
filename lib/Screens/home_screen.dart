import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Auth/login_view.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/Diary/diary_view.dart';
import 'package:optical_eye_desktop/Screens/StockManager/stock_manager_view.dart';
import 'package:optical_eye_desktop/Screens/SupportView/support_view.dart';
import 'package:optical_eye_desktop/Screens/TillView/till_view.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_widgets.dart';
import 'package:optical_eye_desktop/Widgets/security_pin_dialog_widget.dart';
import 'package:optical_eye_desktop/Widgets/side_bar_card_widget.dart';
import 'package:optical_eye_desktop/Widgets/warning_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final diaryNameController = TextEditingController();
  final staffMemberNameController = TextEditingController();
  final fAuth = FirebaseAuth.instance;

  bool isHover = false;
  bool isBtnHover = false;
  // bool isHover_2 = false;
  int myIndex = 0;
  final pinController_1 = TextEditingController();
  final pinController_2 = TextEditingController();
  final pinController_3 = TextEditingController();
  final pinController_4 = TextEditingController();
  final pinController_5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(Get.width, Get.height * 0.1),
        child: Material(
          elevation: 2,
          type: MaterialType.card,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(color: whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/app_icon.ico",
                      height: Get.height * 0.05,
                      width: Get.width * 0.04,
                    ),
                    const Text(
                      "IK VISION",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 40,
                    ),
                    myWidth(0.006),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${userModel?.displayName}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "${userModel?.email}",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // appBar: MyAppBar(
      //   name: "${userModel!.firstName} ${userModel!.lastName}",
      //   email: userModel!.email.toString(),
      //   secondary: true,
      //   onTapLogOut: () {
      //     Get.off(() => const LoginView());
      //   },
      // ),
      body: Row(
        children: [
          Material(
            elevation: 5,
            type: MaterialType.card,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
              height: Get.height,
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                color: whiteColor,
              ),
              child: Column(
                children: [
                  SideBarCardWidget(
                    isHover: isHover,
                    onTap: () {
                      if (myIndex != 1) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SecurityPinDialogWidget(
                                pinController: pinController_1,
                                onTap: () {
                                  if (pinController_1.text == "") {
                                    return;
                                  } else if (pinController_1.text ==
                                      userModel?.pinNumber) {
                                    Get.close(1);
                                    myIndex = 1;
                                    pinController_1.clear();
                                    if (mounted) setState(() {});
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const WarningDialog(
                                            title: "Invalid Pin Number",
                                          );
                                        });
                                  }
                                },
                              );
                            });
                      }
                      return;
                    },
                    onHover: (value) {
                      isHover = value;
                      setState(() {});
                    },
                    icon: CupertinoIcons.doc_text_search,
                    text: "Customer Files",
                  ),
                  // myHeight(0.02),
                  SideBarCardWidget(
                    isHover: isHover,
                    onTap: () {
                      if (myIndex != 2) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SecurityPinDialogWidget(
                                pinController: pinController_2,
                                onTap: () {
                                  if (pinController_2.text == "") {
                                    return;
                                  } else if (pinController_2.text ==
                                      userModel?.pinNumber) {
                                    Get.close(1);
                                    myIndex = 2;
                                    pinController_2.clear();
                                    if (mounted) setState(() {});
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const WarningDialog(
                                            title: "Invalid Pin Number",
                                          );
                                        });
                                  }
                                },
                              );
                            });
                      }
                      return;
                    },
                    onHover: (value) {
                      isHover = value;
                      setState(() {});
                    },
                    icon: CupertinoIcons.sort_up,
                    text: "Stock Manager",
                  ),
                  SideBarCardWidget(
                    isHover: isHover,
                    onTap: () {
                      if (myIndex != 3) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SecurityPinDialogWidget(
                                pinController: pinController_3,
                                onTap: () {
                                  if (pinController_3.text == "") {
                                    return;
                                  } else if (pinController_3.text ==
                                      userModel?.pinNumber) {
                                    Get.close(1);
                                    myIndex = 3;
                                    pinController_3.clear();
                                    if (mounted) setState(() {});
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const WarningDialog(
                                            title: "Invalid Pin Number",
                                          );
                                        });
                                  }
                                },
                              );
                            });
                      }
                      return;
                    },
                    onHover: (value) {
                      isHover = value;
                      setState(() {});
                    },
                    icon: CupertinoIcons.text_alignleft,
                    text: "Diary",
                  ),
                  SideBarCardWidget(
                    isHover: isHover,
                    onTap: () {
                      if (myIndex != 4) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SecurityPinDialogWidget(
                                pinController: pinController_4,
                                onTap: () {
                                  if (pinController_4.text == "") {
                                    return;
                                  } else if (pinController_4.text ==
                                      userModel?.pinNumber) {
                                    Get.close(1);
                                    myIndex = 4;
                                    pinController_4.clear();
                                    setState(() {});
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const WarningDialog(
                                            title: "Invalid Pin Number",
                                          );
                                        });
                                  }
                                },
                              );
                            });
                      }
                      return;
                    },
                    onHover: (value) {
                      isHover = value;
                      setState(() {});
                    },
                    icon: CupertinoIcons.up_arrow,
                    text: "Till",
                  ),
                  SideBarCardWidget(
                    isHover: isHover,
                    onTap: () {
                      if (myIndex != 5) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SecurityPinDialogWidget(
                                pinController: pinController_5,
                                onTap: () {
                                  if (pinController_5.text == "") {
                                    return;
                                  } else if (pinController_5.text ==
                                      userModel?.pinNumber) {
                                    Get.close(1);
                                    myIndex = 5;
                                    pinController_5.clear();
                                    setState(() {});
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const WarningDialog(
                                            title: "Invalid Pin Number",
                                          );
                                        });
                                  }
                                },
                              );
                            });
                      }
                      return;
                    },
                    onHover: (value) {
                      isHover = value;
                      setState(() {});
                    },
                    icon: CupertinoIcons.doc_person,
                    text: "Support",
                  ),
                  const Spacer(),
                  SideBarCardWidget(
                    text: "Logout",
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WarningDialog(
                              title: "Are you sure you want to logout?",
                              onTap: () {
                                fAuth.signOut().then((value) {
                                  Get.offAll(() => const LoginView());
                                });
                              },
                            );
                          });
                    },
                    border: const Border(bottom: BorderSide.none),
                    icon: Icons.logout_rounded,
                    themeColor: redColor.withOpacity(0.75),
                  )
                ],
              ),
            ),
          ),
          if (myIndex == 0)
            Expanded(
              child: Center(
                child: Image.asset("assets/center_image.png",
                    height: Get.height * 0.5,
                    width: Get.width * 0.5,
                    fit: BoxFit.cover),
              ),
            ),
          if (myIndex == 1) const CustomerFilesWidgets(),
          if (myIndex == 2) const StockManagerView(),
          if (myIndex == 3) const DiaryView(),
          if (myIndex == 4) const TillView(),
          if (myIndex == 5) const SupportView(),
        ],
      ),
    );
  }
}

// Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: Get.width * 0.05,
//           vertical: Get.height * 0.05,
//         ),
//         height: Get.height,
//         width: Get.width,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                   "assets/background_image.png",
//                 ),
//                 fit: BoxFit.cover,
//                 filterQuality: FilterQuality.high)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // myHeight(0.05),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 HomeScreenCardWidget(
//                   isHover: isHover,
//                   image: "assets/inventory.png",
//                   text: "Customer Files",
//                   onTap: () {
//                     Get.to(() => const SearchCustomer());
//                   },
//                 ),
//                 myWidth(0.04),
//                 HomeScreenCardWidget(
//                   isHover: isHover,
//                   image: "assets/appointment.png",
//                   text: "Appointment",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 HomeScreenCardWidget(
//                   isHover: isHover,
//                   image: "assets/order.png",
//                   text: "Order",
//                   onTap: () {},
//                 ),
//                 myWidth(0.04),
//                 HomeScreenCardWidget(
//                   isHover: isHover,
//                   image: "assets/payment.png",
//                   text: "Payment",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             myHeight(0.02),
//             InkWell(
//               onTap: () {},
//               onHover: (value) {
//                 isHover_2 = value;
//                 setState(() {});
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                       color: isHover_2 ? Colors.grey : Colors.transparent),
//                   color: isHover_2
//                       ? const Color.fromARGB(73, 158, 158, 158)
//                       : Colors.transparent,
//                 ),
//                 width: Get.width * 0.244,
//                 // height: Get.height * 0.12,
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         "assets/Support.png",
//                         height: Get.height * 0.12,
//                         width: Get.width * 0.24,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     myHeight(0.01),
//                     Center(
//                       child: Text(
//                         "Support",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: whiteColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

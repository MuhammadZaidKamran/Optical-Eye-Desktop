import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/Diary/diary_view.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_widgets.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/security_pin_dialog_widget.dart';
import 'package:optical_eye_desktop/Widgets/side_bar_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final diaryNameController = TextEditingController();
  final staffMemberNameController = TextEditingController();

  bool isHover = false;
  bool isBtnHover = false;
  // bool isHover_2 = false;
  int myIndex = 0;
  final pinController = TextEditingController();

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
                          "Isa Khan",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          "isakhan@gmail.com",
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
                                pinController: pinController,
                                onTap: () {
                                  Get.close(1);
                                  myIndex = 1;
                                  setState(() {});
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
                                pinController: pinController,
                                onTap: () {
                                  Get.close(1);
                                  myIndex = 2;
                                  setState(() {});
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
                                pinController: pinController,
                                onTap: () {
                                  Get.close(1);
                                  myIndex = 3;
                                  setState(() {});
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
                                pinController: pinController,
                                onTap: () {
                                  Get.close(1);
                                  myIndex = 4;
                                  setState(() {});
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
                                pinController: pinController,
                                onTap: () {
                                  Get.close(1);
                                  myIndex = 5;
                                  setState(() {});
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
                    border: const Border(bottom: BorderSide.none),
                    icon: Icons.logout_rounded,
                    themeColor: redColor.withOpacity(0.75),
                  )
                ],
              ),
            ),
          ),
          if (myIndex == 1) const CustomerFilesWidgets(),
          if (myIndex == 2)
            Expanded(
              child: Padding(
                padding: myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stock Manager",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                    myHeight(0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Zonal Stock Takes",
                              style: TextStyle(
                                fontSize: 18,
                                color: blackColor,
                              ),
                            ),
                            myHeight(0.01),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: mainThemeColor),
                              ),
                              child: Column(
                                children: [
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.search,
                                      title: "Start a new zonal stock take",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.query_stats_sharp,
                                      title: "Enter stock quantities",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.grid_view_outlined,
                                      title: "Apply stock quantities",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: CupertinoIcons.clear,
                                      title: "Cancel current stock take",
                                      onTap: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Non-Zonal Stock Takes",
                              style: TextStyle(
                                fontSize: 18,
                                color: blackColor,
                              ),
                            ),
                            myHeight(0.01),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: mainThemeColor),
                              ),
                              child: Column(
                                children: [
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.search,
                                      title: "Start a new zonal stock take",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: CupertinoIcons.doc_append,
                                      title: "Print out stock sheets",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.query_stats_sharp,
                                      title: "Enter counted stock quantities",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.grid_view_outlined,
                                      title: "Apply entered stock quantities",
                                      onTap: () {}),
                                  myHeight(0.02),
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: CupertinoIcons.clear,
                                      title: "Cancel current stock take",
                                      onTap: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rolling Stock Take",
                              style: TextStyle(
                                fontSize: 18,
                                color: blackColor,
                              ),
                            ),
                            myHeight(0.01),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: mainThemeColor),
                              ),
                              child: Column(
                                children: [
                                  HoverButton(
                                      width: Get.width * 0.24,
                                      icon: Icons.receipt_long_outlined,
                                      title: "Perform rolling stock take",
                                      onTap: () {}),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    myHeight(0.015),
                    const Text(
                      "Stock Management",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.015),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: mainThemeColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: Icons.receipt_long_outlined,
                                  title: "Deliveries",
                                  onTap: () {}),
                              myHeight(0.02),
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: Icons.search,
                                  title: "Search",
                                  onTap: () {}),
                            ],
                          ),
                          Column(
                            children: [
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: CupertinoIcons.doc_plaintext,
                                  title: "Print Barcodes",
                                  onTap: () {}),
                              myHeight(0.02),
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: Icons.ballot,
                                  title: "Stock Orders",
                                  onTap: () {}),
                            ],
                          ),
                          Column(
                            children: [
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: Icons.adjust_sharp,
                                  title: "Adjustments",
                                  onTap: () {}),
                              myHeight(0.02),
                              HoverButton(
                                  width: Get.width * 0.24,
                                  icon: Icons.batch_prediction_sharp,
                                  title: "Batch Adjustments",
                                  onTap: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (myIndex == 3) const DiaryView(),
          if (myIndex == 4)
            Expanded(
              child: Padding(
                padding: myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Till",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    myHeight(0.05),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderColor,
                          )),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              CustomerFilesPatientDetailsWidget(
                                containerText: "Till",
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                ),
                              ),
                              CustomerFilesPatientDetailsWidget(
                                  containerText: "Date"),
                              CustomerFilesPatientDetailsWidget(
                                  containerText: "ID"),
                              CustomerFilesPatientDetailsWidget(
                                  containerText: "User"),
                              CustomerFilesPatientDetailsWidget(
                                  containerText: "No.Sales"),
                              CustomerFilesPatientDetailsWidget(
                                  containerText: "Nett Sales"),
                              CustomerFilesPatientDetailsWidget(
                                containerText: "Logoff Date",
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                ),
                              ),
                            ],
                          ),
                          myHeight(0.01),
                          SizedBox(
                            height: Get.height * 0.52,
                            width: Get.width,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              separatorBuilder: (context, index) {
                                return myHeight(0.02);
                              },
                              itemBuilder: (context, index) {
                                return DispenseWidget(
                                  tabItem01: "1",
                                  tabItem02: "02/09/2021",
                                  tabItem03: "9725",
                                  tabItem04: "EMMAC",
                                  tabItem05: "28",
                                  tabItem06: "11063.44",
                                  tabItem07: "-",
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    myHeight(0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HoverButton(
                            width: Get.width * 0.12,
                            isIconAdded: false,
                            title: "View",
                            onTap: () {}),
                        myWidth(0.02),
                        HoverButton(
                            width: Get.width * 0.12,
                            isIconAdded: false,
                            title: "Complete",
                            onTap: () {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
          if (myIndex == 5) Container(),
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

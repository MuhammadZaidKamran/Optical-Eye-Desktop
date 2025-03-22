import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class StockManagerView extends StatefulWidget {
  const StockManagerView({super.key});

  @override
  State<StockManagerView> createState() => _StockManagerViewState();
}

class _StockManagerViewState extends State<StockManagerView> {
  final companyNameController = TextEditingController();
  final quantityController = TextEditingController();
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: myPadding,
        child: myIndex == 0
            ? Column(
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
                                    onTap: () {
                                      myIndex = 1;
                                      setState(() {});
                                    }),
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
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            myIndex = 0;
                            setState(() {});
                          },
                          child: const Icon(Icons.arrow_back_ios, size: 25)),
                      myWidth(0.01),
                      Text(
                        "Add Stock",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  myHeight(0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Spectacles Stock",
                            style: TextStyle(
                              fontSize: 18,
                              color: blackColor,
                            ),
                          ),
                          myHeight(0.01),
                          Container(
                            width: Get.width * 0.38,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: borderColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company Name",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                myHeight(0.01),
                                MyTextField(
                                  controller: companyNameController,
                                  label: "Company Name",
                                ),
                                myHeight(0.02),
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                myHeight(0.01),
                                MyTextField(
                                  controller: quantityController,
                                  label: "Quantity",
                                ),
                                myHeight(0.02),
                                MyButton(onTap: () {}, label: "Add Stock"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Lenses Stock",
                            style: TextStyle(
                              fontSize: 18,
                              color: blackColor,
                            ),
                          ),
                          myHeight(0.01),
                          Container(
                            width: Get.width * 0.38,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: borderColor),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company Name",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                myHeight(0.01),
                                MyTextField(
                                  controller: companyNameController,
                                  label: "Company Name",
                                ),
                                myHeight(0.02),
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                myHeight(0.01),
                                MyTextField(
                                  controller: quantityController,
                                  label: "Quantity",
                                ),
                                myHeight(0.02),
                                MyButton(onTap: () {}, label: "Add Stock"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

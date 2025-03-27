import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/StockManager/lenses_stock.dart';
import 'package:optical_eye_desktop/Screens/StockManager/spectacles_stock.dart';
import 'package:optical_eye_desktop/Widgets/customer_files_patient_details_widget.dart';
import 'package:optical_eye_desktop/Widgets/dispense_widget.dart';
import 'package:optical_eye_desktop/Widgets/edit_lense_stock_dialog.dart';
import 'package:optical_eye_desktop/Widgets/edit_spectacles_stock_dialog.dart';
import 'package:optical_eye_desktop/Widgets/hover_button.dart';

class StockManagerView extends StatefulWidget {
  const StockManagerView({super.key});

  @override
  State<StockManagerView> createState() => _StockManagerViewState();
}

class _StockManagerViewState extends State<StockManagerView> {
  final companyNameController = TextEditingController();
  final quantityController = TextEditingController();
  int myIndex = 0;
  List displaySpectaclesStock = [];
  List displayLensesStock = [];
  final fireStore = FirebaseFirestore.instance;

  getSpectaclesStock() {
    fireStore.collection("spectaclesStock").snapshots().listen((snapshot) {
      displaySpectaclesStock = snapshot.docs.toList();
      if (mounted) setState(() {});
    });
    return displaySpectaclesStock;
  }

  getLensesStock() {
    fireStore.collection("lensesStock").snapshots().listen((snapshot) {
      displayLensesStock = snapshot.docs.toList();
      if (mounted) setState(() {});
    });
    return displayLensesStock;
  }

  @override
  void initState() {
    getSpectaclesStock();
    getLensesStock();
    super.initState();
  }

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
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: Icons.query_stats_sharp,
                                    title: "Enter stock quantities",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: Icons.grid_view_outlined,
                                    title: "Apply stock quantities",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
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
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: Icons.search,
                                    title: "Start a new zonal stock take",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: CupertinoIcons.doc_append,
                                    title: "Print out stock sheets",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: Icons.query_stats_sharp,
                                    title: "Enter counted stock quantities",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
                                    width: Get.width * 0.24,
                                    icon: Icons.grid_view_outlined,
                                    title: "Apply entered stock quantities",
                                    onTap: () {}),
                                myHeight(0.02),
                                HoverButton(
                                    isAvailable: true,
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
                                    isAvailable: true,
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
                                isAvailable: true,
                                width: Get.width * 0.24,
                                icon: Icons.receipt_long_outlined,
                                title: "Deliveries",
                                onTap: () {}),
                            myHeight(0.02),
                            HoverButton(
                                isAvailable: true,
                                width: Get.width * 0.24,
                                icon: Icons.search,
                                title: "Search",
                                onTap: () {}),
                          ],
                        ),
                        Column(
                          children: [
                            HoverButton(
                                isAvailable: true,
                                width: Get.width * 0.24,
                                icon: CupertinoIcons.doc_plaintext,
                                title: "Print Barcodes",
                                onTap: () {}),
                            myHeight(0.02),
                            HoverButton(
                                isAvailable: true,
                                width: Get.width * 0.24,
                                icon: Icons.ballot,
                                title: "Stock Orders",
                                onTap: () {}),
                          ],
                        ),
                        Column(
                          children: [
                            HoverButton(
                                isAvailable: true,
                                width: Get.width * 0.24,
                                icon: Icons.adjust_sharp,
                                title: "Adjustments",
                                onTap: () {}),
                            myHeight(0.02),
                            HoverButton(
                                isAvailable: true,
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
            : SingleChildScrollView(
                child: Column(
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
                            const SpectaclesStock(),
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
                            const LensesStock(),
                          ],
                        ),
                      ],
                    ),
                    myHeight(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Spectacles Stock",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            myHeight(0.015),
                            Container(
                              width: Get.width * 0.38,
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
                                        containerText: "Name",
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                        ),
                                      ),
                                      CustomerFilesPatientDetailsWidget(
                                        isSecondary: true,
                                        width: Get.width * 0.22,
                                        containerText: "Quantity",
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  myHeight(0.01),
                                  SizedBox(
                                    height: Get.height * 0.3,
                                    width: Get.width * 0.6,
                                    child: StreamBuilder(
                                        stream: fireStore
                                            .collection("spectaclesStock")
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          return ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.012,
                                            ),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount:
                                                displaySpectaclesStock.length,
                                            itemBuilder: (context, index) {
                                              QueryDocumentSnapshot data =
                                                  displaySpectaclesStock[index];
                                              return DispenseWidget(
                                                tabItem01: data["name"],
                                                tabItem02:
                                                    data["quantity"].toString(),
                                                isIcon: true,
                                                icon: Icons.edit_outlined,
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return EditSpectaclesStockDialog(
                                                          id: data.id,
                                                          name: data["name"]
                                                              .toString(),
                                                          quantity:
                                                              data["quantity"]
                                                                  .toString(),
                                                        );
                                                      });
                                                },
                                              );
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lenses Stock",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            myHeight(0.015),
                            Container(
                              width: Get.width * 0.38,
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
                                        containerText: "Name",
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                        ),
                                      ),
                                      CustomerFilesPatientDetailsWidget(
                                        isSecondary: true,
                                        width: Get.width * 0.22,
                                        containerText: "Quantity",
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  myHeight(0.01),
                                  SizedBox(
                                    height: Get.height * 0.3,
                                    width: Get.width * 0.6,
                                    child: StreamBuilder(
                                        stream: fireStore
                                            .collection("lensesStock")
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          return ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.012,
                                            ),
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount:
                                                displayLensesStock.length,
                                            itemBuilder: (context, index) {
                                              QueryDocumentSnapshot data =
                                                  displayLensesStock[index];
                                              return DispenseWidget(
                                                tabItem01: data["name"],
                                                tabItem02:
                                                    data["quantity"].toString(),
                                                isIcon: true,
                                                icon: Icons.edit_outlined,
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return EditLenseStockDialog(
                                                          id: data.id,
                                                          name: data["name"]
                                                              .toString(),
                                                          quantity:
                                                              data["quantity"]
                                                                  .toString(),
                                                        );
                                                      });
                                                },
                                              );
                                            },
                                          );
                                        }),
                                  ),
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
      ),
    );
  }
}

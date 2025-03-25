import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/new_dispense_dialog.dart';

class DispenseController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Future addDispense({
    required String type,
    required String item,
    required String size,
    required String price,
    required String quantity,
    required String itemCode,
    required String distPD,
    required String nearPD,
    required String interPD,
    required String distPD_2,
    required String nearPD_2,
    required String interPD_2,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("dispense").add({
      "type": type,
      "item": item,
      "size": size,
      "price": price,
      "quantity": quantity,
      "itemCode": itemCode,
      "distPD": distPD,
      "nearPD": nearPD,
      "interPD": interPD,
      "distPD_2": distPD_2,
      "nearPD_2": nearPD_2,
      "interPD_2": interPD_2,
    }).then((value) {
      Get.close(3);
      update();
      mySuccessSnackBar(context: Get.context!, message: "Dispense item added!");
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const NewDispenseDialog();
          });
      update();
    }).catchError((error) {
      Get.back();
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }
}

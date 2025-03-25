import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';

class StockController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Future addSpectaclesStock({
    required String name,
    required String quantity,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("spectaclesStock").add({
      "name": name,
      "quantity": quantity,
    }).then((value) {
      Get.back();
      update();
      mySuccessSnackBar(
        context: Get.context!,
        message: "Spectacles Stock Added Successfully!",
      );
    }).catchError((error) {
      Get.back();
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }

  Future addLensesStock({
    required String name,
    required String quantity,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("lensesStock").add({
      "name": name,
      "quantity": quantity,
    }).then((value) {
      Get.back();
      update();
      mySuccessSnackBar(
        context: Get.context!,
        message: "Lenses Stock Added Successfully!",
      );
    }).catchError((error) {
      Get.back();
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }
}

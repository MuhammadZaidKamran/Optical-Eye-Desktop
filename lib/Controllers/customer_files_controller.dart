import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';

class CustomerFilesController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Future addPatient({
    required String name,
    required String gender,
    required String dateOfBirth,
    required String postCode,
    required String email,
    required String address,
    required String contactNumber,
    required String country,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("patients").add({
      "name": name,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "postCode": postCode,
      "email": email,
      "address": address,
      "contactNumber": contactNumber,
      "country": country,
    }).then((value) {
      Get.close(2);
      update();
      mySuccessSnackBar(
          context: Get.context!, message: "Patient Successfully Added!");
    }).catchError((error) {
      Get.close(1);
      update();
      myErrorSnackBar(context: Get.context!, message: error.toString());
    });
  }

  Future addNewEquipment({
    required String patientID,
    required String imageLink,
    required String lenseType,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("patientEquipments").add({
      "patientID": patientID,
      "imageLink": imageLink,
      "lenseType": lenseType,
      "date":
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
    }).then((value) {
      Get.close(2);
      update();
      mySuccessSnackBar(
          context: Get.context!, message: "Equipment successfully added!");
    }).catchError((error) {
      Get.close(1);
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }

  Future updatePatient({
    required String id,
    required String name,
    required String email,
    required String postCode,
    required String gender,
    required String address,
    required String country,
    required String dateOfBirth,
    required String contactNumber,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("patients").doc(id).set({
      "name": name,
      "email": email,
      "postCode": postCode,
      "gender": gender,
      "address": address,
      "country": country,
      "dateOfBirth": dateOfBirth,
      "contactNumber": contactNumber,
    }).then((value) {
      Get.close(1);
      update();
      mySuccessSnackBar(
          context: Get.context!, message: "Patient Successfully Updated!");
      Get.back(result: {
        "name": name,
        "email": email,
        "postCode": postCode,
        "gender": gender,
        "address": address,
        "country": country,
        "dateOfBirth": dateOfBirth,
        "contactNumber": contactNumber,
      });
      update();
    }).catchError((error) {
      Get.close(1);
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }
}
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
}

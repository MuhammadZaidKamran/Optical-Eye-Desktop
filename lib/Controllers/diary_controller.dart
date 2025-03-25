import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';

class DiaryController extends GetxController {
  final fireStore = FirebaseFirestore.instance;

  Future addNewDiary({
    required String clinicName,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("diaries").add({
      "clinicName": clinicName,
    }).then((value) {
      Get.close(2);
      update();
      mySuccessSnackBar(
          context: Get.context!, message: "Diary Successfully Created!");
    }).catchError((error) {
      Get.close(1);
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }

  Future addNewAppointment({
    required String date,
    required String diary,
    required String duration,
    required String status,
    required String type,
    required String lastAppointmentTime,
    required String clinicName,
    required String name,
    required String email,
    required String dateOfBirth,
    required String postCode,
  }) async {
    myLoadingDialog(Get.context!);
    await fireStore.collection("appointments").add({
      "id" : fireStore.collection("appointments").doc().id,
      "date": date,
      "diary": diary,
      "duration": duration,
      "status": status,
      "type": type,
      "lastAppointmentTime": lastAppointmentTime,
      "clinicName": clinicName,
      "name": name,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "postCode": postCode,
    }).then((value) {
      Get.close(2);
      update();
      mySuccessSnackBar(
          context: Get.context!, message: "Appointment Added Successfully");
    }).catchError((error) {
      Get.close(1);
      update();
      myErrorSnackBar(context: Get.context!, message: "$error");
    });
  }

  // Future updateStatus({required String status, required String id}) async {
  //   myLoadingDialog(Get.context!);
  //   await fireStore.collection("appointments").doc(id).update({
  //     "status": status,
  //   }).then((value) {
  //     Get.close(2);
  //     update();
  //     mySuccessSnackBar(
  //         context: Get.context!, message: "Status Updated Successfully!");
  //   }).catchError((error) {
  //     Get.close(1);
  //     update();
  //     myErrorSnackBar(context: Get.context!, message: "$error");
  //   });
  // }
}

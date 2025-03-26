import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Models/user_model.dart';
import 'package:optical_eye_desktop/Screens/home_screen.dart';

class AuthController extends GetxController {
  final fAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final dateTime = DateTime.now().millisecondsSinceEpoch.toStringAsFixed(5);

  Future signUp({
    required String role,
    required String email,
    required String employeeName,
    required String displayName,
    required String initials,
    required String pinNumber,
    required String insuranceCode,
    required String logonName,
    required String password,
    required String country,
    required String phoneNumber,
    required String postCode,
    required String address,
  }) async {
    myLoadingDialog(Get.context!);
    try {
      await fAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await fireStore.collection("users").doc(value.user!.uid).set({
          "userID": FirebaseAuth.instance.currentUser!.uid,
          "email": email,
          "employeeName": employeeName,
          "displayName": displayName,
          "initials": initials,
          "pinNumber": pinNumber,
          "insuranceCode": insuranceCode,
          "logonName": logonName,
          "password": password,
          "country": country,
          "phoneNumber": phoneNumber,
          "postCode": postCode,
          "address": address,
          "role": role,
        }).then((value) {
          Get.close(2);
          update();
          mySuccessSnackBar(context: Get.context!, message: "New User Added!");
        });
      });
    } catch (e) {
      Get.back();
      update();
      myErrorSnackBar(context: Get.context!, message: e.toString());
    }
  }

  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      await fAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        fireStore
            .collection("users")
            .doc(value.user!.uid)
            .snapshots()
            .listen((value) {
          if (value.data() != null) {
            userModel = UserModel.fromJson(value.data()!);
          }
        });
        myLoadingDialog(Get.context!);
        Future.delayed(const Duration(seconds: 2), () {}).then((value) {
          mySuccessSnackBar(
              context: Get.context!, message: "Logged in successfully!");
          Get.off(() => const HomeScreen());
        });
      });
    } catch (e) {
      myErrorSnackBar(context: Get.context!, message: e.toString());
    }
  }

  Future forgotPassword({required String email}) async {
    try {
      await fAuth.sendPasswordResetEmail(email: email).then((value) {
        mySuccessSnackBar(
            context: Get.context!,
            message: "Password Reset email sent successfully!");
        Get.back();
      });
    } catch (e) {
      myErrorSnackBar(context: Get.context!, message: e.toString());
    }
  }
}

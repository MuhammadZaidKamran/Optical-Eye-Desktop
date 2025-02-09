import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/home_screen.dart';

class AuthController extends GetxController {
  final fAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final dateTime = DateTime.now().millisecondsSinceEpoch.toStringAsFixed(5);

  Future signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      await fAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await fireStore.collection("users").doc(value.user!.uid).set({
          "userID": FirebaseAuth.instance.currentUser!.uid,
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "role": "Admin",
          "pinCode": dateTime,
        }).then((value) {
          mySuccessSnackBar(
              context: Get.context!, message: "Account created successfully!");
          update();
          Get.off(() => const HomeScreen());
        });
      });
    } catch (e) {
      myErrorSnackBar(context: Get.context!, message: e.toString());
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      await fAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        mySuccessSnackBar(
            context: Get.context!, message: "Logged in successfully!");
        Get.off(() => const HomeScreen());
      });
    } catch (e) {
      myErrorSnackBar(context: Get.context!, message: e.toString());
    }
  }
}

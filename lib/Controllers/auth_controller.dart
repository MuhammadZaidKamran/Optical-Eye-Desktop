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
          fireStore
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots()
              .listen((value) {
            if (value.data() != null) {
              userModel = UserModel.fromJson(value.data()!);
            }
          });
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
        mySuccessSnackBar(
            context: Get.context!, message: "Logged in successfully!");
        Get.off(() => const HomeScreen());
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

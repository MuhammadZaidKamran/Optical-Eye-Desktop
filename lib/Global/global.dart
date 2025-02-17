import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Models/user_model.dart';

EdgeInsetsGeometry myPadding = const EdgeInsets.all(15);

myHeight(double height) {
  return SizedBox(
    height: Get.height * height,
  );
}

myWidth(double width) {
  return SizedBox(
    width: Get.width * width,
  );
}

UserModel? userModel;

enum ScreenSize {
  small(300),
  normal(400),
  medium(500),
  // extraMedium(550),
  large(600),
  extraLarge(1000);

  final double size;

  const ScreenSize(this.size);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.sizeOf(context)
      .shortestSide; // Gives us the shortest side of the device
  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.medium.size) return ScreenSize.medium;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}

mySuccessSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: whiteColor,
        ),
      ),
      backgroundColor: greenColor,
    ),
    snackBarAnimationStyle: AnimationStyle(duration: const Duration(seconds: 1)),
  );
}

myErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: whiteColor,
        ),
      ),
      backgroundColor: redColor,
    ),
    snackBarAnimationStyle: AnimationStyle(duration: const Duration(seconds: 1)),
  );
}

myLoadingDialog(context){
  return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: whiteColor,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        color: mainThemeColor,
                      ),
                      myWidth(0.03),
                      const Text(
                        "Please Wait....",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              );
            });
}

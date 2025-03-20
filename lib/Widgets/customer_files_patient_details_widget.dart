import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

// ignore: must_be_immutable
class CustomerFilesPatientDetailsWidget extends StatelessWidget {
  CustomerFilesPatientDetailsWidget(
      {super.key,
      required this.containerText,
      this.borderRadius,
      this.width,
      this.isSecondary});
  final String containerText;
  final BorderRadius? borderRadius;
  bool? isSecondary = false;
  double? width;

  @override
  Widget build(BuildContext context) {
    if (isSecondary == true) {
      return SizedBox(
        width: width ?? Get.width * 0.17,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: borderColor.withOpacity(0.4),
            borderRadius: borderRadius ?? BorderRadius.circular(0),
          ),
          child: Text(
            containerText,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: borderColor.withOpacity(0.4),
            borderRadius: borderRadius ?? BorderRadius.circular(0),
          ),
          child: Text(
            containerText,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
        ),
      );
    }
  }
}

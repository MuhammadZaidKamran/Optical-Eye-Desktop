import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientFileTabWidget extends StatelessWidget {
  const PatientFileTabWidget(
      {super.key,
      required this.text,
      required this.containerColor,
      required this.textColor,
      required this.borderColor,
      required this.onTap});
  final String text;
  final Color containerColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.14,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: containerColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

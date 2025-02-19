import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

class CustomerFilesPatientDetailsWidget extends StatelessWidget {
  const CustomerFilesPatientDetailsWidget({super.key, required this.containerText, this.borderRadius});
  final String containerText;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: borderColor.withOpacity(0.4),
          borderRadius: borderRadius ?? BorderRadius.circular(0),
        ),
        child: Center(
          child: Text(
            containerText,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

class CalculatorNumberWidget extends StatelessWidget {
  const CalculatorNumberWidget({super.key, required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

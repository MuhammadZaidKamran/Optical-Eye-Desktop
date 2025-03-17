import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

class CloseButtonWidget extends StatefulWidget {
  const CloseButtonWidget({super.key});

  @override
  State<CloseButtonWidget> createState() => _CloseButtonWidgetState();
}

class _CloseButtonWidgetState extends State<CloseButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.close(1),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: mainThemeColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Icon(
            Icons.close_rounded,
            color: whiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}

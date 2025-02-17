import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      this.height,
      this.width,
      required this.onTap,
      required this.label,
      this.isLoading = false,
      this.secondary = false,
      this.borderRadius});
  final double? height;
  final double? width;
  final String label;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  bool secondary = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? myWidth(1),
        decoration: BoxDecoration(
          border: Border.all(color: secondary == true ? borderColor : Colors.transparent),
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            color: secondary == true ? whiteColor : mainThemeColor),
        child: Center(
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: mainThemeColor,
                    valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                      color: secondary == true ? mainThemeColor : whiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}

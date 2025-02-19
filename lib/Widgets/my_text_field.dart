import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.prefixIconColor,
    this.maxLines,
    this.maxLength,
    this.fillColor,
    this.hintStyle,
    this.borderRadius,
    this.leading,
    this.height,
    this.width,
    this.trailing,
  });
  final TextEditingController controller;
  final String label;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color? prefixIconColor;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final Widget? trailing;
  final Widget? leading;
  final double? height;
  final double? width;
  bool? readOnly = false;
  bool? obscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: height ?? 70,
      child: TextFormField(
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText!,
        onTap: onTap,
        cursorColor: mainThemeColor,
        controller: controller,
        readOnly: readOnly!,
        decoration: InputDecoration(
            suffixIcon: trailing,
            hintMaxLines: 1,
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            filled: true,
            fillColor: fillColor ?? whiteColor,
            hintText: label,
            hintStyle: hintStyle ?? TextStyle(color: textLightColor),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(5))),
      ),
    );
  }
}

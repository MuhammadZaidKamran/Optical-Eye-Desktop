import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class HoverButton extends StatefulWidget {
  HoverButton({
    super.key,
    required this.title, required this.onTap, this.icon, this.width,
  });
  bool isHover = false;
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final double? width;
  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        widget.isHover = value;
        setState(() {});
      },
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
        decoration: BoxDecoration(
          color: widget.isHover ? mainThemeColor : whiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: widget.isHover ? Colors.transparent : mainThemeColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon ?? Icons.add,
                color: widget.isHover ? whiteColor : mainThemeColor),
            myWidth(0.01),
            Text(widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isHover ? whiteColor : mainThemeColor,
                ))
          ],
        ),
      ),
    );
  }
}

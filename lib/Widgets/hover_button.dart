import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class HoverButton extends StatefulWidget {
  HoverButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.width,
    this.isIconAdded = true,
  });
  bool isHover = false;
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final double? width;
  bool isIconAdded = true;
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
          mainAxisAlignment: widget.isIconAdded
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isIconAdded
                ? Icon(widget.icon ?? Icons.add,
                    color: widget.isHover ? whiteColor : mainThemeColor)
                : const SizedBox(),
            widget.isIconAdded ? myWidth(0.01) : const SizedBox(),
            Text(widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isHover ? whiteColor : mainThemeColor,
                )),
          ],
        ),
      ),
    );
  }
}

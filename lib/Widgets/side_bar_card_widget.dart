import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class SideBarCardWidget extends StatefulWidget {
  SideBarCardWidget({
    super.key,
    required this.text,
    required this.icon,
    this.themeColor,
    this.border,
    this.onTap,
    this.onHover,
    this.isHover = false,
  });
  final String text;
  final IconData icon;
  final Color? themeColor;
  final Border? border;
  bool? isHover = false;
  final VoidCallback? onTap;
  final void Function(bool)? onHover;

  @override
  State<SideBarCardWidget> createState() => _SideBarCardWidgetState();
}

class _SideBarCardWidgetState extends State<SideBarCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        widget.isHover = value;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
        decoration: BoxDecoration(
            color: widget.isHover == true
                ? borderColor.withOpacity(0.2)
                : Colors.transparent,
            borderRadius:
                widget.isHover == true ? BorderRadius.circular(10) : null,
            border: widget.border ??
                const Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 0.8,
                  ),
                )),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: widget.themeColor ?? blackColor,
              size: 25,
            ),
            myWidth(0.01),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: widget.themeColor ?? blackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class HomeScreenCardWidget extends StatefulWidget {
  HomeScreenCardWidget(
      {super.key,
      required this.isHover,
      required this.image,
      required this.text,
      required this.onTap});
  final String image;
  final String text;
  final VoidCallback onTap;
  bool isHover = false;

  @override
  State<HomeScreenCardWidget> createState() => _HomeScreenCardWidgetState();
}

class _HomeScreenCardWidgetState extends State<HomeScreenCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        widget.isHover = value;
        setState(() {});
      },
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: widget.isHover ? Colors.grey : Colors.transparent),
          color: widget.isHover
              ? const Color.fromARGB(73, 158, 158, 158)
              : Colors.transparent,
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: widget.isHover ? Get.height * 0.16 : Get.height * 0.15,
              width: widget.isHover ? Get.width * 0.16 : Get.width * 0.15,
            ),
            myHeight(0.015),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

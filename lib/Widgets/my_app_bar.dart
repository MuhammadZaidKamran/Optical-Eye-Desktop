import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(
      {super.key,
      this.secondary,
      required this.name,
      required this.email,
      this.onTapLogOut});
  final String name;
  final String email;
  final VoidCallback? onTapLogOut;
  bool? secondary = false;

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
        child: Row(
          children: [
            Image.asset(
              "assets/app_icon.ico",
              height: Get.height * 0.05,
              width: Get.width * 0.04,
            ),
            const Text(
              "IK VISION",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        const Icon(
          Icons.account_circle,
          size: 40,
        ),
        myWidth(0.006),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ],
        ),
        myWidth(0.03),
        // secondary == true
        //     ? InkWell(
        //         onTap: onTapLogOut,
        //         child: Image.asset(
        //           "assets/logout.png",
        //           height: Get.height * 0.025,
        //           width: Get.width * 0.025,
        //         ),
        //       )
        //     : const SizedBox(),
        // myWidth(0.007),
      ],
      // title:
    );
  }
}

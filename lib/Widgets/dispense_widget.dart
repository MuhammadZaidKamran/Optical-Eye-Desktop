import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

// ignore: must_be_immutable
class DispenseWidget extends StatelessWidget {
  DispenseWidget(
      {super.key,
      required this.tabItem01,
      required this.tabItem02,
      required this.tabItem03,
      required this.tabItem04,
      this.tabItem05,
      this.tabItem06,
      this.isStatus = false,
      required this.onTap,
      this.containerColor,
      this.tabItem07});
  final String tabItem01;
  final String tabItem02;
  final String tabItem03;
  final String tabItem04;
  final String? tabItem05;
  final String? tabItem06;
  final String? tabItem07;
  bool? isStatus = false;
  final Color? containerColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Text(
                  tabItem01,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Text(
                  tabItem02,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          isStatus == true
              ? Container(
                  width: Get.width * 0.085,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: containerColor,
                  ),
                  padding: const EdgeInsets.symmetric(),
                  child: Center(
                    child: Text(
                      tabItem03,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: blackColor),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Center(
                      child: Text(
                        tabItem03,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Center(
                child: Text(
                  tabItem04,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          tabItem05 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Center(
                      child: Text(
                        tabItem05!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
          tabItem06 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Center(
                      child: Text(
                        tabItem06!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
          tabItem07 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Center(
                      child: Text(
                        tabItem07!,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

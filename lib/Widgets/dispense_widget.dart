import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';

// ignore: must_be_immutable
class DispenseWidget extends StatelessWidget {
  DispenseWidget(
      {super.key,
      required this.tabItem01,
      required this.tabItem02,
      this.tabItem03,
      this.tabItem04,
      this.tabItem05,
      this.tabItem06,
      this.isStatus = false,
      this.isIcon = false,
      this.isIcon2 = false,
      required this.onTap,
      this.icon,
      this.icon2,
      this.containerColor,
      this.tabItem07});
  final String tabItem01;
  final String tabItem02;
  final String? tabItem03;
  final String? tabItem04;
  final String? tabItem05;
  final String? tabItem06;
  final String? tabItem07;
  bool? isStatus = false;
  bool? isIcon = false;
  bool? isIcon2 = false;
  final Color? containerColor;
  IconData? icon;
  IconData? icon2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: borderColor.withOpacity(0.5))),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 13,
              ),
              child: Text(
                tabItem01,
                style: const TextStyle(
                  fontSize: 18,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: borderColor.withOpacity(0.5))),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 13,
              ),
              child: Text(tabItem02,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          isIcon == true
              ? Center(
                  child: Icon(
                  icon,
                  color: blackColor.withOpacity(0.5),
                ))
              : isStatus == true
                  ? Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: borderColor.withOpacity(0.5))),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 16,
                      ),
                      child: SizedBox(
                        width: Get.width * 0.1,

                        // padding: const EdgeInsets.symmetric(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 13,
                              width: 13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: containerColor,
                              ),
                            ),
                            myWidth(0.006),
                            Text(
                              tabItem03!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  : tabItem03 == null
                      ? const SizedBox()
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: borderColor.withOpacity(0.5))),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 13,
                            ),
                            child: Text(
                              tabItem03!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
          // myWidth(0.05),
          tabItem04 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: borderColor.withOpacity(0.5))),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    child: Text(
                      tabItem04!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
          isIcon2 == true
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: borderColor.withOpacity(0.5))),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ),
                    child: Center(
                        child: Icon(
                      icon2,
                      color: blackColor.withOpacity(0.5),
                    )),
                  ),
                )
              : tabItem05 == null
                  ? const SizedBox()
                  : Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: borderColor.withOpacity(0.5))),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 13,
                        ),
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
          tabItem06 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: borderColor.withOpacity(0.5))),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    child: Text(
                      tabItem06!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
          tabItem07 == null
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: borderColor.withOpacity(0.5))),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    child: Text(
                      tabItem07!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

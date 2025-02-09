import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Widgets/home_screen_card_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        name: "Isa Khan",
        email: "isakhan@gmail.com",
        secondary: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.height * 0.05,
        ),
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background_image.png",
                ),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high)),
        child: Column(
          children: [
            // myHeight(0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/inventory.png",
                  text: "Inventory",
                  onTap: () {},
                ),
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/appointment.png",
                  text: "Appointment",
                  onTap: () {},
                ),
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/order.png",
                  text: "Order",
                  onTap: () {},
                ),
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/payment.png",
                  text: "Payment",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

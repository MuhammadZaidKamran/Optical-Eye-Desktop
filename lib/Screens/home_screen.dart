import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Auth/login_view.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Screens/CustomerFiles/search_customer.dart';
import 'package:optical_eye_desktop/Widgets/home_screen_card_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHover = false;
  bool isHover_2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        name: "${userModel!.firstName} ${userModel!.lastName}",
        email: userModel!.email.toString(),
        secondary: true,
        onTapLogOut: () {
          Get.off(() => const LoginView());
        },
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // myHeight(0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/inventory.png",
                  text: "Customer Files",
                  onTap: () {
                    Get.to(() => const SearchCustomer());
                  },
                ),
                myWidth(0.04),
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/appointment.png",
                  text: "Appointment",
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/order.png",
                  text: "Order",
                  onTap: () {},
                ),
                myWidth(0.04),
                HomeScreenCardWidget(
                  isHover: isHover,
                  image: "assets/payment.png",
                  text: "Payment",
                  onTap: () {},
                ),
              ],
            ),
            myHeight(0.02),
            InkWell(
              onTap: () {},
              onHover: (value) {
                isHover_2 = value;
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: isHover_2 ? Colors.grey : Colors.transparent),
                  color: isHover_2
                      ? const Color.fromARGB(73, 158, 158, 158)
                      : Colors.transparent,
                ),
                width: Get.width * 0.22,
                // height: Get.height * 0.12,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/Support.png",
                        height: Get.height * 0.12,
                        width: Get.width * 0.22,
                        fit: BoxFit.cover,
                      ),
                    ),
                    myHeight(0.01),
                    Center(
                      child: Text(
                        "Support",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

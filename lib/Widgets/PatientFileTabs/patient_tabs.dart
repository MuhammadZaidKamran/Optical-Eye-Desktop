import 'package:flutter/material.dart';
import 'package:optical_eye_desktop/Global/global.dart';

class PatientTabs extends StatelessWidget {
  const PatientTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name : Isa Khan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Gender : Male",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Date Of Birth : 14/03/2001",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Post Code : SA-345",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        myWidth(0.2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email : isakhan@gmail.com",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Address : Saudia Arabia, Riyadh",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Contact Number : 1234567890",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            myHeight(0.04),
            const Text(
              "Country : Saudi Arabia",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Controllers/stock_controller.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class LensesStock extends StatefulWidget {
  const LensesStock({super.key});

  @override
  State<LensesStock> createState() => _LensesStockState();
}

class _LensesStockState extends State<LensesStock> {
  final companyNameController = TextEditingController();
  final quantityController = TextEditingController();
  final stockController = Get.put(StockController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StockController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Container(
          width: Get.width * 0.38,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Company Name",
                style: TextStyle(
                    fontSize: 15,
                    color: blackColor,
                    fontWeight: FontWeight.w500),
              ),
              myHeight(0.01),
              MyTextField(
                controller: companyNameController,
                label: "Company Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter company name";
                  }
                  return null;
                },
              ),
              myHeight(0.02),
              Text(
                "Quantity",
                style: TextStyle(
                    fontSize: 15,
                    color: blackColor,
                    fontWeight: FontWeight.w500),
              ),
              myHeight(0.01),
              MyTextField(
                controller: quantityController,
                label: "Quantity",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter quantity";
                  }
                  return null;
                },
              ),
              myHeight(0.02),
              MyButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller
                          .addLensesStock(
                              name: companyNameController.text.trim(),
                              quantity: quantityController.text.trim())
                          .then((value) {
                        companyNameController.clear();
                        quantityController.clear();
                      });
                    }
                  },
                  label: "Add Stock"),
            ],
          ),
        ),
      );
    });
  }
}

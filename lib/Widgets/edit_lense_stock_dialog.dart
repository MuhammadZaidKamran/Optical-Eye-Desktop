import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';
import 'package:optical_eye_desktop/Global/global.dart';
import 'package:optical_eye_desktop/Widgets/close_button_widget.dart';
import 'package:optical_eye_desktop/Widgets/my_button.dart';
import 'package:optical_eye_desktop/Widgets/my_text_field.dart';

class EditLenseStockDialog extends StatefulWidget {
  const EditLenseStockDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.quantity});
  final String id;
  final String name;
  final String quantity;

  @override
  State<EditLenseStockDialog> createState() => _EditLenseStockDialogState();
}

class _EditLenseStockDialogState extends State<EditLenseStockDialog> {
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    nameController.text = widget.name;
    quantityController.text = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: whiteColor,
        child: Padding(
          padding: myPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.3,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Lense Stock",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    CloseButtonWidget(),
                  ],
                ),
              ),
              myHeight(0.02),
              const Text("Name"),
              myHeight(0.006),
              MyTextField(
                width: Get.width * 0.3,
                controller: nameController,
                label: "Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name";
                  }
                  return null;
                },
              ),
              myHeight(0.02),
              const Text("Quantity"),
              myHeight(0.006),
              MyTextField(
                width: Get.width * 0.3,
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
                  width: Get.width * 0.3,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      myLoadingDialog(Get.context!);
                      await fireStore
                          .collection("lensesStock")
                          .doc(widget.id)
                          .update({
                        "name": nameController.text.trim(),
                        "quantity": quantityController.text.trim(),
                      }).then((value) {
                        Get.close(2);
                        setState(() {});
                        mySuccessSnackBar(
                            context: Get.context!,
                            message: "Lenses Stock Updated Successfully!");
                      }).catchError((error) {
                        Get.back();
                        setState(() {});
                        myErrorSnackBar(
                            context: Get.context!, message: "$error");
                      });
                    }
                  },
                  label: "Update"),
            ],
          ),
        ),
      ),
    );
  }
}

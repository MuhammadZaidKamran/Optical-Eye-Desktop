import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optical_eye_desktop/Global/colors.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown(
      {super.key,
      required this.label,
      this.onChanged,
      this.items,
      required this.dropDownValue});
  final Widget label;
  final void Function(String?)? onChanged;
  final List<String>? items;
  final String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: dropDownValue,
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: whiteColor,
            iconEnabledColor: blackColor,
            iconDisabledColor: blackColor,
            hint: label,
            borderRadius: BorderRadius.circular(5),
            items: items?.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    color: blackColor,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          )),
    );
  }
}

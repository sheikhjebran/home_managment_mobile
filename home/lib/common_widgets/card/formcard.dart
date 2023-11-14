import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class FormCard {
  static Widget dropDownWidget(
      BuildContext context,
      String titleText,
      List<dynamic> iteamList,
      String? selectedIteam,
      dynamic controller,
      Function onChanged) {
    return DropdownButtonHideUnderline(
        child: FormField<dynamic>(builder: (FormFieldState<dynamic> state) {
      return DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // Add more decoration..
        ),
        hint: Text(
          titleText,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).hintColor),
        ),
        items: iteamList
            .map((item) => DropdownMenuItem(
                  value: item.id.toString(),
                  child: Text(
                    "${item.homeLocation} : ${item.homeFloor}",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedIteam,
        validator: (value) {
          if (value == null) {
            return 'Please select.';
          }
          return null;
        },
        onChanged: (newValue) {
          selectedIteam = newValue as String;
          state.didChange(newValue);
          // ignore: void_checks
          return onChanged(newValue);
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );
    }));
  }
}

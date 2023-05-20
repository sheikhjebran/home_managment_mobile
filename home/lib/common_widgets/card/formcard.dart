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
      return DropdownButton2<dynamic>(
          isExpanded: true,
          hint: Text(
            titleText,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
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
          onChanged: (newValue) {
            selectedIteam = newValue as String;
            state.didChange(newValue);
            // ignore: void_checks
            return onChanged(newValue);
          },
          buttonStyleData: const ButtonStyleData(
            height: 40,
            width: 200,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return (item.value.toString().contains(searchValue));
            },
          ));
    }));
  }
}

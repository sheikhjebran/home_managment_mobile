import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:home/constants/colors.dart';
import 'package:home/constants/text_strings.dart';

class FormCard {
  static Widget dropDownWidget(BuildContext context, String titleText,
      List<dynamic> iteamList, String? selectedIteam, Function onChanged) {
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
                    child: titleText == tSelectHome
                        ? Text(
                            "${item.homeLocation} : ${item.homeFloor}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )
                        : Text(
                            "${item.tenentHome}",
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
          buttonStyleData: ButtonStyleData(
            height: 60,
            width: 500,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black26,
              ),
              color: tCardBgColor,
            ),
            // elevation: 1,
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

  static Widget dropDownSingleWidget(BuildContext context, String titleText,
      List<dynamic> iteamList, String? selectedIteam, Function onChanged) {
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
                  value: item.toString(),
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )))
              .toList(),
          value: selectedIteam,
          onChanged: (newValue) {
            selectedIteam = newValue as String;
            state.didChange(newValue);
            // ignore: void_checks
            return onChanged(newValue);
          },
          buttonStyleData: ButtonStyleData(
            height: 60,
            width: 500,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black26,
              ),
              color: tCardBgColor,
            ),
            // elevation: 2,
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

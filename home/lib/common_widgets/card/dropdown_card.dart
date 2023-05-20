import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  final String titleText;
  final List<dynamic> iteamList;
  final String? selectedHome;
  final dynamic controller;
  final Function onChanged;

  const DropDownWidget({
    Key? key,
    required this.titleText,
    required this.iteamList,
    required this.selectedHome,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  MainWidget createState() => MainWidget();
}

class MainWidget extends State<DropDownWidget> {
  String titleText = '';
  late List<dynamic> iteamList;
  String? selectedHome;
  dynamic controller;
  late Function onChanged;

  @override
  void initState() {
    super.initState();
    titleText = widget.titleText;
    iteamList = widget.iteamList;
    selectedHome = widget.selectedHome;
    controller = widget.controller;
    onChanged = widget.onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<dynamic>(
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
        value: selectedHome,
        onChanged: (value) {
          setState(() {
            selectedHome = value as String;
            debugPrint("This is the home value : $value");
            // ignore: void_checks
            return onChanged(value);
          });
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
              controller: controller.tenentHome,
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
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            controller.tenentHome.clear();
          }
        },
      ),
    );
  }
}

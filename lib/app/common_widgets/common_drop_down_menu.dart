import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonDropdownMenu<T> extends StatelessWidget {
  CommonDropdownMenu(
      {super.key,
      this.controller,
      required this.label,
      required this.dropdownMenuEntries,
      this.enabled = true,
      this.onSelected,
      this.initialSelection,
      this.trailingIcon});
  TextEditingController? controller;
  String label;
  bool enabled;
  Widget? trailingIcon;
  void Function(T?)? onSelected;
  T? initialSelection;
  List<DropdownMenuEntry<T>> dropdownMenuEntries;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DropdownMenu<T>(
      initialSelection: initialSelection,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.only(left: 20, right: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black38, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff2f68c0), width: 1),
        ),
      ),
      label: Text(label),
      controller: controller,
      width: width * .123,
      dropdownMenuEntries: dropdownMenuEntries,
      enabled: enabled,
      trailingIcon: trailingIcon,
      onSelected: onSelected,
    );
  }
}

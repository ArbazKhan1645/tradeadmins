// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:partner_hub/app/constants/constants_colors.dart';

class CircularCheckBox extends StatefulWidget {
  const CircularCheckBox(
      {super.key, required this.val, required this.isChecked});
  final Function(bool) val;
  final bool isChecked;

  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.val(false);
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black45,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isChecked
                  ? AppColors.headingTextColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}

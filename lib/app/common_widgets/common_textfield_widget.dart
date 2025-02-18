import 'package:flutter/material.dart';

commonTextfieldWidget(TextEditingController controller, String labeltext,
    IconButton iconData, bool obscuretext,
    {bool enabled = true, int? maxLines = 1}) {
  FocusNode myFocusNode = FocusNode();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: TextFormField(
        enabled: enabled,
        focusNode: myFocusNode,
        controller: controller,
        textInputAction: TextInputAction.done,
        obscureText: obscuretext,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              color:
                  myFocusNode.hasFocus ? const Color(0xff2f68c0) : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          suffixIcon: iconData,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black38, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff2f68c0), width: 1),
          ),
          labelText: labeltext,
        ),
      ),
    ),
  );
}

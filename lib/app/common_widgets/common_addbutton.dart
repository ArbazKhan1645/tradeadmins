import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CommonAddButton extends StatefulWidget {
  const CommonAddButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  State<CommonAddButton> createState() => _CommonAddButtonState();
}

class _CommonAddButtonState extends State<CommonAddButton> {
  bool isHover = false;

  setishover(bool val) {
    isHover = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onHover: setishover,
        onTap: widget.onTap,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          padding: const EdgeInsets.all(12),
          strokeWidth: 1,
          dashPattern: const [6, 4],
          color: Colors.black54,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isHover ? Colors.blueAccent : null),
            height: 50,
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: isHover ? Colors.white : null),
                  Text(widget.text,
                      style: TextStyle(
                          fontSize: 22, color: isHover ? Colors.white : null)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

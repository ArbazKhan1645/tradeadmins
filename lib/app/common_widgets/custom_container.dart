import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final BoxDecoration decoration;
  double? width;
  Widget? child;
  CustomContainer(
      {super.key,
      required this.labelText,
      required this.decoration,
      this.width,
      this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            decoration: decoration,
            child: child,
          ),
        ),
        Positioned(
          left: 10,
          bottom: 40,
          child: Container(color: Colors.white, child: Text(labelText)),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:partner_hub/app/constants/colors_constants.dart';

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(1),
        body: Center(
          child: SpinKitThreeBounce(
            color: kPrimaryColor,
            size: 50.0,
          ),
        ));
  }
}

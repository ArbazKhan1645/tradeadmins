// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partner_hub/app/constants/colors_constants.dart';
import 'package:partner_hub/app/modules/authentication/widgets/login.dart';
import 'package:partner_hub/app/modules/authentication/widgets/signup.dart';
import 'package:partner_hub/app/services/responsive.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        init: AuthenticationController(),
        builder: (controller) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: AuthenticationViewBody(),
          );
        });
  }
}

class AuthenticationViewBody extends StatefulWidget {
  const AuthenticationViewBody({super.key});

  @override
  _AuthenticationViewBodyState createState() => _AuthenticationViewBodyState();
}

class _AuthenticationViewBodyState extends State<AuthenticationViewBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool ismobileResponsive =
        Responsive.isMobile(context) || Responsive.isTablet(context);
    return GetBuilder<AuthenticationController>(builder: (controller) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              left: -25,
              top: -20,
              child: Transform.rotate(
                angle: 0.05,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff5E85CC),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          bottomRight: Radius.circular(20))),
                  height: MediaQuery.of(context).size.height + 50,
                  width: (size.width / 2),
                ),
              ),
            ),
            if (ismobileResponsive)
              Container()
            else
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 32),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: size.width * 0.02,
                    ),
                  ),
                ),
              ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              left: -500,
              child: Container(
                height: size.height,
                width: (size.width / 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white12),
              ),
            ),
            if (ismobileResponsive)
              Container()
            else
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Trade My Device",
                          style: GoogleFonts.ooohBaby(
                            color: Colors.white,
                            fontSize: size.width * 0.02,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "'Your gateway to the world \n of trading phones'",
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: size.width * 0.01,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Copyright 2025",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (ismobileResponsive)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    "Welcome",
                    style:
                        GoogleFonts.bebasNeue(color: Colors.grey, fontSize: 30),
                  ),
                ),
              ),
            AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (widget, animation) =>
                    ScaleTransition(scale: animation, child: widget),
                child: controller.islogin
                    ? const AuthenticationLogin()
                    : const AuthenticationSignUp()),
          ],
        ),
      );
    });
  }
}

class CurvedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double curveDepth = 50; // Adjust this for deeper curve
    double radius = 30; // Adjust for rounded corners

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - curveDepth, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - curveDepth, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

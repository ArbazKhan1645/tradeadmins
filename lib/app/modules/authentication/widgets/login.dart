// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/colors_constants.dart';
import 'package:partner_hub/app/common_widgets/loading.dart';
import 'package:partner_hub/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:partner_hub/app/common_widgets/action_button.dart';
import 'package:partner_hub/app/common_widgets/common_textfield_widget.dart';
import 'package:partner_hub/app/services/responsive.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticationLogin extends StatefulWidget {
  const AuthenticationLogin({super.key});
  @override
  _AuthenticationLoginState createState() => _AuthenticationLoginState();
}

class _AuthenticationLoginState extends State<AuthenticationLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
        child: SizedBox(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(child:
                GetBuilder<AuthenticationController>(builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: Responsive.isMobile(context)
                      ? const EdgeInsets.all(20)
                      : const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CountryFlag(
                                country:
                                    Country.gb, // OR Country.fromCode('eg')
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'EN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black, size: 18),
                            ],
                          ),
                        ),
                      ),
                      const Text("Trade My Phone",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 66, 60),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )),
                      const Text(
                        "trade your phones today",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 66, 60),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      commonTextfieldWidget(
                          controller.loginControllers['LoginEmail']
                              as TextEditingController,
                          "Email",
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.email)),
                          false),
                      commonTextfieldWidget(
                          controller.loginControllers['LoginPassword']
                              as TextEditingController,
                          "Password",
                          IconButton(
                              onPressed: () {
                                controller.setobsureLoginPassword();
                              },
                              icon: Icon(controller.obscureLoginPassword
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          controller.obscureLoginPassword),
                      controller.errormessage.isEmpty
                          ? Container()
                          : Text(
                              controller.errormessage.isEmpty
                                  ? ""
                                  : controller.errormessage,
                              style: const TextStyle(
                                  color: Color(0xff343A40),
                                  fontWeight: FontWeight.bold),
                            ),
                      SizedBox(
                        height: controller.errormessage.isEmpty ? 10 : 0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: const Color.fromARGB(255, 2, 66, 60),
                              value: controller.saveme,
                              onChanged: (val) {
                                controller.setSaveMe(val!);
                              }),
                          const Text("Remember Me")
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      actionButton(
                        "Log In",
                        () async {
                          Navigator.of(context).push(_createRoute());
                          controller.callLoginFunction();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dont Have an account?'),
                          TextButton(
                              onPressed: () {
                                controller.switchAuthenticationPage();
                              },
                              child: const Text('Contact us now'))
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              );
            })),
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialIcon(IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade800,
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    ),
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const MyLoadingWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

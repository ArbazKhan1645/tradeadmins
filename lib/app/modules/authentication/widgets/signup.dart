// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/colors_constants.dart';
import 'package:partner_hub/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:partner_hub/app/common_widgets/action_button.dart';
import 'package:partner_hub/app/common_widgets/common_textfield_widget.dart';

class AuthenticationSignUp extends StatefulWidget {
  const AuthenticationSignUp({super.key});

  @override
  _AuthenticationSignUpState createState() => _AuthenticationSignUpState();
}

class _AuthenticationSignUpState extends State<AuthenticationSignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
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
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("HSE TECHNO",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 66, 60),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          )),
                      const Text(
                        "Software Company LTD",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 66, 60),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Create Account",
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
                          controller.signupControllers['signupEmail']
                              as TextEditingController,
                          "Email",
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.email)),
                          false),
                      commonTextfieldWidget(
                          controller.signupControllers['signupPassword']
                              as TextEditingController,
                          "Password",
                          IconButton(
                              onPressed: () {
                                controller.setobsureSignupPassword();
                              },
                              icon: Icon(controller.obscureSignupPassword
                                  ? Icons.remove_red_eye
                                  : Icons.password)),
                          controller.obscureSignupPassword),
                      commonTextfieldWidget(
                          controller.signupControllers['signupConfirmPassword']
                              as TextEditingController,
                          "Confirm Password",
                          IconButton(
                              onPressed: () {
                                controller.setobsureSignupPassword();
                              },
                              icon: Icon(controller.obscureSignupPassword
                                  ? Icons.remove_red_eye
                                  : Icons.password)),
                          controller.obscureSignupPassword),
                      const SizedBox(
                        height: 32,
                      ),
                      actionButton(
                        "Create Account",
                        () async {
                          controller.callSignUpFunction();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already Have an account?'),
                          TextButton(
                              onPressed: () {
                                controller.switchAuthenticationPage();
                              },
                              child: const Text('Sign In'))
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

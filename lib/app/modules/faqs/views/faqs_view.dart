import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner_hub/app/modules/faqs/screens/screen.dart';

import '../controllers/faqs_controller.dart';

class FaqsView extends GetView<FaqsController> {
  const FaqsView({super.key});
  @override
  Widget build(BuildContext context) {
    return FAQScreen();
  }
}

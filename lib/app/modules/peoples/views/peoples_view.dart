import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/peoples/widgets/peoples_body.dart';

import '../controllers/peoples_controller.dart';

class PeoplesView extends GetView<PeoplesController> {
  const PeoplesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeoplesController>(
        init: PeoplesController(),
        builder: (controller) {
          return const Scaffold(
              backgroundColor: Color(0xfff3f5fa), body: PeoplesViewBody());
        });
  }
}

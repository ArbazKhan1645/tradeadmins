import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/constants/constants_colors.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/homepage_view.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/sh_overview.dart';
import 'package:partner_hub/app/modules/stastics_bar/views/stastics_bar_view.dart';

import '../controllers/support_hub_controller.dart';
import '../subwidget/chatgpt.dart';


class SupportHubView extends GetView<SupportHubController> {
  const SupportHubView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportHubController>(
        init: SupportHubController(),
        builder: (controller) {
          return DashboardScreen();
          // return Scaffold(
          //     backgroundColor: Colors.grey.shade200,
          //     endDrawer: Drawer(
          //       width: MediaQuery.of(context).size.width / 3,
          //       child: SupportHubTerminalsOverview(),
          //     ),
          //     key: controller.scaffoldKey,
          //     body: Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: SupportHubViewBody(),
          //     ));
        });
  }
}

class SupportHubViewBody extends StatelessWidget {
  const SupportHubViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportHubController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            buildSliverAppBar(),
            controller.loadingAllData
                ? const Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SupportHubLocationsOverview(),
                        // SupportHubTerminalsOverview()
                      ],
                    ),
                  )
                : Expanded(
                    child: Center(
                    child: SpinKitThreeBounce(
                      color: AppColors.primaryColor,
                      size: 50.0,
                    ),
                  ))
          ],
        ),
      );
    });
  }
}

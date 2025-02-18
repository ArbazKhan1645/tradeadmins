import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/support_hub/controllers/support_hub_controller.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/sh_location.dart';



class SupportHubLocationsOverview extends StatelessWidget {
  const SupportHubLocationsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportHubController>(builder: (controller) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 5, right: 10),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            padding: const EdgeInsets.all(6),
            strokeWidth: 0.5,
            dashPattern: const [6, 4],
            color: Colors.black45,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SupportHubLocations(),
              ),
            ),
          ),
        ),
      );
    });
  }
}


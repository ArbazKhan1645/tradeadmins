import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:partner_hub/app/modules/support_hub/controllers/support_hub_controller.dart';
import 'package:partner_hub/app/modules/support_hub/widgets/peoples_widget_listview.dart';

import '../../../models/models/mobile_phones_model.dart';
import '../subwidget/filter_widget.dart';

class SupportHubLocations extends StatelessWidget {
  const SupportHubLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportHubController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 200, child: FilterWidget()),
          Expanded(
            child: controller.filterselectedMerchantLocations.isEmpty
                ? const Center(
                    child: Text(
                        'No Locations Assigned to Partner Or No Location found for Search Query'),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(height: 15);
                    },
                    padding: EdgeInsets.zero,
                    itemCount:
                        controller.filterselectedMerchantLocations.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      MobilePhonesModel locationData =
                          controller.filterselectedMerchantLocations[index];

                      final countryName = '';
                      bool selected =
                          controller.selectedLocation?.id == locationData.id;

                      return LocationsItemWidgetListview(
                          index: selected,
                          countryname: countryName,
                          key: Key(locationData.id.toString()),
                          controller: controller,
                          location: locationData);
                    }),
          )
        ],
      );
    });
  }
}

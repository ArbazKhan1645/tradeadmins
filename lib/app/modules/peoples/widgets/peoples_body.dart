import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_hub/app/modules/peoples/controllers/peoples_controller.dart';
import 'package:partner_hub/app/modules/peoples/widgets/peoples_widget_gridview.dart';
import 'package:partner_hub/app/modules/peoples/widgets/peoples_widget_listview.dart';
import 'package:partner_hub/app/modules/stastics_bar/views/stastics_bar_view.dart';

class PeoplesViewBody extends StatelessWidget {
  const PeoplesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeoplesController>(builder: (controller) {
      return ListView(
        children: [
          const StasticsBarView(),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Checklist - Employees Workers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              const Text(
                                  'The folloeing are the peoples those are linked working'),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  'Department1',
                                  'Department2',
                                  'Department3'
                                ].map((e) {
                                  bool isSelected =
                                      e == controller.selectedStringTab.value;
                                  return Container(
                                    height: 45,
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(12))
                                        : null,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.setPeoplesIsGrid();
                                  },
                                  icon: Icon(controller.peoplesIsGrid.value
                                      ? Icons.list
                                      : Icons.grid_view)),
                              const SizedBox(width: 20),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12)),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Search Peoples'),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                      child: Text(
                                        'Add New People',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              ),
                              const SizedBox(width: 20),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          controller.peoplesIsGrid.value
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const PeoplesItemWidgetListview();
                  })
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return const PeoplesItemWidgetGridview();
                  })
        ],
      );
    });
  }
}

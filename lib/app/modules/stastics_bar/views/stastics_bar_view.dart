import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stastics_bar_controller.dart';

import 'package:auto_size_text/auto_size_text.dart';

class StasticsBarView extends GetView<StasticsBarController> {
  const StasticsBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StasticsBarController>(
      init: StasticsBarController(),
      builder: (controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;

            final bool isSmallScreen = screenWidth <= 800;

            return Padding(
              padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: Scrollbar(
                controller: controller.scrollController,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: controller.scrollController,
                  child: Row(
                    spacing: 0,
                    children: controller.stasticsbarDynamicdataList
                        .map(
                          (e) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width <= 1200
                                ? 300
                                : screenWidth / 4,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(12),
                                padding: const EdgeInsets.all(6),
                                strokeWidth: 0.5,
                                dashPattern: const [6, 4],
                                color: Colors.black,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: isSmallScreen ? 10 : 30,
                                            right: isSmallScreen ? 10 : 30,
                                            top: 0,
                                            bottom: 0),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              height: isSmallScreen ? 30 : 40,
                                              width: isSmallScreen ? 30 : 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: e['color'],
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  e['icon'],
                                                  color: Colors.white,
                                                  size: isSmallScreen ? 18 : 24,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  AutoSizeText(
                                                    e['title'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    maxLines: 1,
                                                    minFontSize: 12,
                                                  ),
                                                  AutoSizeText(
                                                    e['value'],
                                                    style: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    minFontSize: 20,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AutoSizeText(
                                                        'view All ->',
                                                        style: TextStyle(
                                                          color: e['color'],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        maxLines: 1,
                                                        minFontSize: 12,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          AutoSizeText(
                                                            '%84',
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              color: e['color'],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            maxLines: 1,
                                                            minFontSize: 16,
                                                          ),
                                                          AutoSizeText(
                                                            'This Month',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}



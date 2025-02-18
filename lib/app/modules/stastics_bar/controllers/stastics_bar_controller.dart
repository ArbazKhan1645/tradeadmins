import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StasticsBarController extends GetxController {

  ScrollController scrollController = ScrollController();
  List<Map<String, dynamic>> stasticsbarDynamicdataList = [
    {
      'title': 'Total Customers',
      'value': '1,02,890',
      'color': const Color(0xff845adf),
      'icon': Icons.stacked_bar_chart_sharp,
    },
    {
      'title': 'Total Revenue',
      'value': '56,562',
      'color': const Color(0xff2ebbe6),
      'icon': Icons.pie_chart_rounded
    },
    {
      'title': 'Conversion Rate',
      'value': '12.08%',
      'color': const Color(0xff26bf94),
      'icon': Icons.wallet
    },
    {
      'title': 'Total Deals',
      'value': '2,543',
      'color': const Color(0xfff5b849),
      'icon': Icons.percent_outlined
    }
  ];
}

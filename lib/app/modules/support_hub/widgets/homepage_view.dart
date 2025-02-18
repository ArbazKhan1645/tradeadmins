// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_null_comparison, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import '../../Home/controllers/home_controller.dart';
import 'homepage_header.dart';
import 'optimized_animated_container.dart';

class HomePageViewScreen extends StatelessWidget {
  const HomePageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool enableAnimations = !kIsWeb || !kReleaseMode;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OptimizedAnimatedContainer(
            shouldAnimate: enableAnimations,
            child: DashBoardViewBodyScreen(constraints: constraints),
          );
        },
      ),
    );
  }
}

class DashBoardViewBodyScreen extends StatefulWidget {
  const DashBoardViewBodyScreen({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  State<DashBoardViewBodyScreen> createState() =>
      _DashBoardViewBodyScreenState();
}

class _DashBoardViewBodyScreenState extends State<DashBoardViewBodyScreen> {
  late final HomeController controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(HomeController());
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSliverList(),
      ],
    );
  }

  Widget _buildCollapsedTitle({BoxConstraints? constraints}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 90,
        child: buildWidgetOFScrollHeader(context, constraints: constraints),
      ),
    );
  }

  Widget _buildSliverList() {
    return Expanded(child: controller.getDashboardViewBodyScreen[0]);
  }
}

Widget buildSliverAppBar() {
  return LayoutBuilder(builder: (context, constraints) {
    return SizedBox(
      child: HomePageHeaderWidget(constraints: constraints),
    );
  });
}

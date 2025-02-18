import 'package:flutter/material.dart';
import 'package:partner_hub/app/models/terminal_model.dart';

class StaircaseListView extends StatefulWidget {
  const StaircaseListView({super.key, required this.terminals});
  final List<TerminalModel> terminals;

  @override
  _StaircaseListViewState createState() => _StaircaseListViewState();
}

class _StaircaseListViewState extends State<StaircaseListView>
    with TickerProviderStateMixin {
  // ✅ Fix: Use TickerProviderStateMixin

  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      widget.terminals.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<Offset>(
              begin: Offset(0, -1.3), // From top to bottom
              end: Offset(0, 0),
            ).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeOut),
            ))
        .toList();

    _startAnimations();
  }

  void _startAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(Duration(milliseconds: 200)); // Delay each item
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.terminals.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SlideTransition(
          position: _animations[index],
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Termianl 1',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}

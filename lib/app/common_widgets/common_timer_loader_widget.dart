// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CommonOrderProgressIndicator extends StatefulWidget {
  final DateTime orderTime;
  final Duration orderDuration;
  final Color backgroundColor;
  final Color expiredColor;
  final Color remainingColor;

  const CommonOrderProgressIndicator({
    super.key,
    required this.orderTime,
    required this.orderDuration,
    this.backgroundColor = Colors.grey,
    this.expiredColor = Colors.red,
    this.remainingColor = const Color.fromARGB(255, 8, 66, 10),
  });

  @override
  _CommonOrderProgressIndicatorState createState() =>
      _CommonOrderProgressIndicatorState();
}

class _CommonOrderProgressIndicatorState
    extends State<CommonOrderProgressIndicator>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _animationController;
  late double _progress;
  late String _lateTime;
  late bool _isGlowVisible;

  @override
  void initState() {
    super.initState();
    _progress = 0.0;
    _lateTime = '';
    _isGlowVisible = false;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final elapsed = DateTime.now().difference(widget.orderTime);
      final totalSeconds = widget.orderDuration.inSeconds;
      setState(() {
        if (elapsed >= widget.orderDuration) {
          _progress = 1.0;
          final lateDifference = DateTime.now()
              .difference(widget.orderTime.add(widget.orderDuration));
          final lateHours = lateDifference.inHours;
          final lateMinutes = lateDifference.inMinutes.remainder(60);
          _lateTime = '$lateHours h $lateMinutes m late';
        } else {
          _progress = elapsed.inSeconds / totalSeconds;
          _lateTime = '';
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color;
    if (_progress >= 1.0) {
      color = widget.expiredColor;
    } else {
      color = widget.remainingColor;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Animate(
          effects: const [FadeEffect(), ScaleEffect()],
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: widget.backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        Positioned(
          bottom: -30,
          left: 0,
          right: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _isGlowVisible
                  ? Colors.white.withOpacity(0.10)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _lateTime,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.expiredColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              _isGlowVisible = _animationController.value > 0.5;
              return Container(
                width: MediaQuery.of(context).size.width * _progress * 0.8,
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_clock_app_using_custom_paint/screens/clock/components/clock_painter.dart';

class ClockViewScreen extends StatefulWidget {
  const ClockViewScreen({super.key});

  @override
  State<ClockViewScreen> createState() => _ClockViewScreenState();
}

class _ClockViewScreenState extends State<ClockViewScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

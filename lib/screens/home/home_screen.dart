import 'package:flutter/material.dart';
import 'package:flutter_clock_app_using_custom_paint/screens/clock/clock_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      color: const Color(0xFF202F40),
      child: const ClockViewScreen(),
    ));
  }
}

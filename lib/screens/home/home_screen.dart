import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_app_using_custom_paint/screens/clock/clock_view_screen.dart';
import 'package:flutter_clock_app_using_custom_paint/screens/clock/components/custom_Text_button.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentTime = DateTime.now();
    var formattedTime = DateFormat('hh:mm').format(currentTime);
    var formattedDate = DateFormat('EEEE, MMMM d').format(currentTime);
    var timeZoneString = currentTime.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    return Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        body: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CustomTextButton(
                    title: "Clock", imagePath: "assets/images/clock_icon.png"),
                CustomTextButton(
                    title: "Alarm", imagePath: "assets/images/alarm_icon.png"),
                CustomTextButton(
                    title: "Timer", imagePath: "assets/images/timer_icon.png"),
                CustomTextButton(
                    title: "StopWatch",
                    imagePath: "assets/images/stopwatch_icon.png"),
              ],
            ),
            const VerticalDivider(
              thickness: 2,
              color: Colors.grey,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 30, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Clock",
                      style: TextStyle(
                          fontFamily: "avenir",
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    Text(
                      formattedTime.toString(),
                      style: const TextStyle(
                          fontFamily: "avenir",
                          color: Colors.white,
                          fontSize: 64,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(formattedDate.toString(),
                        style: const TextStyle(
                            fontFamily: "avenir",
                            color: Colors.white,
                            fontSize: 20)),
                    const SizedBox(height: 25),
                    const ClockViewScreen(),
                    const SizedBox(height: 20),
                    const Text("Time Zone",
                        style: TextStyle(
                            fontFamily: "avenir",
                            color: Colors.white,
                            fontSize: 20)),
                    Row(
                      children: [
                        Text("UTC $timeZoneString",
                            style: const TextStyle(
                                fontFamily: "avenir",
                                color: Colors.white,
                                fontSize: 14)),
                        const Icon(Icons.arrow_drop_down, color: Colors.white)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

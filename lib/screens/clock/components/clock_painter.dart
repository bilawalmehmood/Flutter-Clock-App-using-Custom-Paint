import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();

    //draw the clock face

    //calculate the center of the canvas
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double radius = min(centerX, centerY);
    final Offset center = Offset(centerX, centerY);

    //draw the clock numbers
    double angle = pi / 6;
    double textRadius = radius + 10;

    for (int i = 1; i < 13; i++) {
      String text = (i).toString();
      TextSpan span = TextSpan(
        style: const TextStyle(
          color: Color(0xFFEAECFF),
          fontSize: 16,
        ),
        text: text,
      );

      TextPainter textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      double x = centerX + textRadius * cos(angle * i) - textPainter.width / 2;
      double y = centerY + textRadius * sin(angle * i) - textPainter.height / 2;

      textPainter.paint(canvas, Offset(x, y));
    }

    //draw the dash lines for the clock
    final double outerCircleRadius = radius - 5;
    final double innerCircleRadius = radius - 20;

    Paint dashBrush = Paint();
    dashBrush.color = const Color(0xFFEAECFF);
    dashBrush.style = PaintingStyle.stroke;
    dashBrush.strokeCap = StrokeCap.round;
    dashBrush.strokeWidth = 2;

    Paint hourDashBrush = Paint();
    hourDashBrush.color = Colors.red;
    hourDashBrush.style = PaintingStyle.stroke;
    hourDashBrush.strokeCap = StrokeCap.round;
    hourDashBrush.strokeWidth = 2;

    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);
      var p1 = Offset(x1, y1); //p1 is the outer point

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      var p2 = Offset(x2, y2); //p2 is the inner point
      if (i % 30 == 0) {
        canvas.drawLine(p1, p2, hourDashBrush);
      } else {
        canvas.drawLine(p1, p2, dashBrush);
      }
    }

    //draw the clock outline
    Paint outlineBrush = Paint();
    outlineBrush.color = const Color(0xFFEAECFF);
    outlineBrush.style = PaintingStyle.stroke;
    outlineBrush.strokeWidth = 16;

    canvas.drawCircle(center, radius - 40, outlineBrush);

    //draw the clock fill brush
    Paint fillBrush = Paint();
    fillBrush.color = const Color(0xFF444974);
    fillBrush.style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 40, fillBrush);

    //draw the clock hands

    //draw the hour hand
    final double hourHandRadius = radius * 0.5;
    final double hourHandAngle =
        (dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180;

    final double hourHandX = centerX + hourHandRadius * cos(hourHandAngle);
    final double hourHandY = centerY + hourHandRadius * sin(hourHandAngle);
    final Offset hourHand = Offset(hourHandX, hourHandY);

    Paint hourHandBrush = Paint();
    hourHandBrush.shader =
        const RadialGradient(colors: [Colors.red, Colors.yellow])
            .createShader(Rect.fromCircle(center: center, radius: radius));
    hourHandBrush.style = PaintingStyle.stroke;
    hourHandBrush.strokeCap = StrokeCap.round;
    hourHandBrush.strokeWidth = 12;

    canvas.drawLine(center, hourHand, hourHandBrush);

    //draw the minute hand
    final double minuteHandRadius = radius * 0.7;
    final double minuteHandAngle =
        (dateTime.minute * 6 + dateTime.second * 0.1) * pi / 180;

    final double mntHandX = centerX + minuteHandRadius * cos(minuteHandAngle);
    final double mntHandY = centerY + minuteHandRadius * sin(minuteHandAngle);
    final Offset minuteHand = Offset(mntHandX, mntHandY);

    Paint minHandBrush = Paint();
    minHandBrush.shader =
        const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
            .createShader(Rect.fromCircle(center: center, radius: radius));
    minHandBrush.style = PaintingStyle.stroke;
    minHandBrush.strokeCap = StrokeCap.round;
    minHandBrush.strokeWidth = 10;

    canvas.drawLine(center, minuteHand, minHandBrush);

    //draw the second hand
    final double secondHandRadius = radius * 0.9;
    final double secondHandAngle = dateTime.second * 6 * pi / 180;

    final double secHandX = centerX + secondHandRadius * cos(secondHandAngle);
    final double secHandY = centerY + secondHandRadius * sin(secondHandAngle);
    final Offset secondHand = Offset(secHandX, secHandY);

    Paint secondHandBrush = Paint();
    secondHandBrush.color = Colors.orange[300]!;
    secondHandBrush.style = PaintingStyle.stroke;
    secondHandBrush.strokeCap = StrokeCap.round;
    secondHandBrush.strokeWidth = 8;

    canvas.drawLine(center, secondHand, secondHandBrush);

    //draw the clock center dot
    Paint centerDotBrush = Paint();
    centerDotBrush.color = const Color(0xFFEAECFF);

    canvas.drawCircle(center, 12, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

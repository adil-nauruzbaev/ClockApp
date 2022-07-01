import 'dart:async';
import 'package:analog_clock/constants.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Nur-Sultan, KAZ | GMT",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInYearsHourAndMinute(),
          Clock(),
        ],
      ),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: kShadowColor.withOpacity(0.14),
                  blurRadius: 64,
                )
              ]),
          child: CustomPaint(
            painter: ClockPainter(context),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;

  ClockPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    canvas.drawCircle(
        center, 24, Paint()..color = Theme.of(context).primaryIconTheme.color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class TimeInYearsHourAndMinute extends StatefulWidget {
  const TimeInYearsHourAndMinute({Key key}) : super(key: key);

  @override
  State<TimeInYearsHourAndMinute> createState() =>
      _TimeInYearsHourAndMinuteState();
}

class _TimeInYearsHourAndMinuteState extends State<TimeInYearsHourAndMinute> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  String formattedDate = DateFormat.Hm().format(DateTime.now());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$formattedDate",
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}

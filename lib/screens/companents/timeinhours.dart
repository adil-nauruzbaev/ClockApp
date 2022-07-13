import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

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

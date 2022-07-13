import 'package:analog_clock/screens/companents/clock.dart';
import 'package:analog_clock/screens/companents/timeinhours.dart';
import 'package:flutter/material.dart';

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

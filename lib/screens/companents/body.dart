import 'package:analog_clock/screens/companents/clock.dart';
import 'package:analog_clock/screens/companents/timeinhours.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Nur-Sultan, KAZ | GMT",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TimeInYearsHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer(),
            CountryCard(
              country: "Volgograd, RUS",
              timeZone: "+3 HRS | GMT",
              iconSrc: "assets/icons/volg.svg",
              time: "2:20",
              period: "HM",
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);
  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(233),
      child: AspectRatio(
        aspectRatio: 1.32,
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              country,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: getProportionateScreenWidth(16),
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(timeZone),
            Spacer(),
            Row(
              children: [
                SvgPicture.asset(
                  iconSrc,
                  width: getProportionateScreenWidth(40),
                ),
                Spacer(),
                Text(
                  time,
                  style: Theme.of(context).textTheme.headline4,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(period),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

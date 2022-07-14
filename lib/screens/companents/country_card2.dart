import 'dart:async';
import 'package:analog_clock/screens/companents/timeinhours.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CountryCard2 extends StatefulWidget {
  const CountryCard2({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);
  final String country, timeZone, iconSrc, time, period;

  @override
  State<CountryCard2> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard2> {
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
    var formattedDate1 = DateTime.now();
    var fiftyDaysFromNow = DateFormat.Hm().format(formattedDate1.add(new Duration(hours: 3)));
    
    return Padding(
      padding:  EdgeInsets.only( left : getProportionateScreenWidth(20)),
      child: SizedBox(
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
                widget.country,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: getProportionateScreenWidth(16),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(widget.timeZone),
              Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    widget.iconSrc,
                    width: getProportionateScreenWidth(40),
                    color: Theme.of(context).accentIconTheme.color,
                  ),
                  Spacer(),
                  
                  Text(
                    formattedDate,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(widget.period),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

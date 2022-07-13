import 'package:analog_clock/screens/companents/timeinhours.dart';
import 'package:analog_clock/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CountryCard extends StatefulWidget {
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
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.Hm().format(DateTime.now());
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

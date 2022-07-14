import 'package:analog_clock/screens/companents/clock.dart';
import 'package:analog_clock/screens/companents/country_card.dart';
import 'package:analog_clock/screens/companents/country_card2.dart';
import 'package:analog_clock/screens/companents/test_screen.dart';
import 'package:analog_clock/screens/companents/timeinhours.dart';
import 'package:flutter/material.dart';


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
              "Dasha ♥ Adil",
              style: Theme.of(context).textTheme.headline4,
            ),
            
            TestScreen(),
            Spacer(),
            Clock(),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CountryCard2(
                    country: "Volgograd, RUS",
                    timeZone: "+3 HRS | GMT",
                    iconSrc: "assets/icons/volg.svg",
                    time: "",
                    period: "HM",
                  ),
                  CountryCard(
                    country: "Nur-Sultan, KAZ",
                    timeZone: "+6 HRS | GMT",
                    iconSrc: "assets/icons/nur.svg",
                    time: "",
                    period: "HM",
                  ),
                ],
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

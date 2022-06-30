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
            "Date together",
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

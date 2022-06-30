import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/Settings.svg'),
          // icon: Image.asset('assets/icons/setting.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}

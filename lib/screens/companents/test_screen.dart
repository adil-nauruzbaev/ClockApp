import 'package:analog_clock/screens/companents/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  //объявляем счётчик
  TimerExample timerExample;

  @override
  void initState() {
    ///инициализируем счётчик базовым значением (2 часа назад от момента запуска)
    timerExample = TimerExample(dateTime: DateTime.parse("2022-06-01"));

    ///вызываем и запускаем таймер
    timerExample?.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    //останавливаем при любом изменении состоянии (закрытие экрана, рестарт, пр....)
    timerExample?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: timerExample,
      child: Builder(
        builder: (context) =>

            ///вытягиваем данные
            Text(
          TimeLeftFormatter.formattedTimer(
              context.watch<TimerExample>().timerDuration.abs()),
         style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: getProportionateScreenWidth(20),
                    ),
        ),
      ),
    );
  }
}

class TimeLeftFormatter {
  /// Formating [int] to [String] from 1 to 01
  static String _strDigits(int n) => n.toString().padLeft(2, '0');

  /// Converting input [Duration] to [String] like a 01:02:03 (hh:mm:ss)
  static String formattedTimer(Duration duration) =>
      '${duration.inDays ~/ 365} год ${_strDigits(duration.inDays.remainder(365))} день ${_strDigits(duration.inHours.remainder(24))}:${_strDigits(duration.inMinutes.remainder(60))}:${_strDigits(duration.inSeconds.remainder(60))}';
}

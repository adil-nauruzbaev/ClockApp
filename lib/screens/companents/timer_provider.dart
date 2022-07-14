import 'dart:async';

import 'package:flutter/material.dart';

class TimerExample extends ChangeNotifier {
  ///Время, относительно которого идёт отсчёт
  final DateTime dateTime;

  /// Сюда запишем оставшееся время до конца события
  Duration timerDuration = const Duration(seconds: 0);

  ///конструктор. Обязательная переменная [DateTime] типа на входе
  TimerExample({@required this.dateTime});

  /// объявляем таймер
  Timer timer;

  @override
  void dispose() {
    ///отменяем при закрытии
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    ///запускаем таймер с частотой обновления 1 секунда
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ///как вариант, каждую секунду высчитывать разницу и записывать в переменную
      ///На самом деле можно даже форматировать данные сразу в красивую строку
      timerDuration = dateTime.difference(DateTime.now());

      ///Оповестим всех слушателей об изменении
      notifyListeners();
    });
  }
}

import 'dart:async';

import '../models/timer_model.dart';


class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;

  late Timer timer;
  late Duration _time; // _time - shows the remaining time
  late Duration _fullTime; // _fullTime - shows the beginning time
  int work = 30;


  String returnTime(Duration t) {
    String minutes = (t.inMinutes < 10)
        ? '0${t.inMinutes}'
        : t.inMinutes.toString();
    int numSeconds = t.inSeconds - (t.inMinutes * 60);
    String seconds =
        (numSeconds < 10) ? '0$numSeconds' : numSeconds.toString();
    String formattedTime = '$minutes:$seconds';
    return formattedTime;
  }

  void startWork() {
    _radius = 1;
    _time = Duration(minutes: work, seconds: 0);
    _fullTime = _time;
  }

// This function returns a Stream of TimerModel decrementing the duration every second
  Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String time;
      if (_isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }

      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
  }
}

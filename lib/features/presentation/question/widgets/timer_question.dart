import 'dart:async';
import 'package:flutter/material.dart';

class TimerQuestion extends StatefulWidget {
  const TimerQuestion({super.key});

  @override
  State<TimerQuestion> createState() => _TimerQuestionState();
}

class _TimerQuestionState extends State<TimerQuestion> {
  Timer? timer;
  int seconds = 0;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void stopTimer() {
    timer?.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        seconds++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return Text(
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 24),
    );
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }
}

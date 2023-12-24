import 'dart:async';
import 'package:flutter/material.dart';

class TimerQuestion extends StatefulWidget {
  const TimerQuestion({
    Key? key,
    required this.updateTimer,
  }) : super(key: key);

  final Function(String) updateTimer;

  @override
  State<TimerQuestion> createState() => _TimerQuestionState();
}

class _TimerQuestionState extends State<TimerQuestion> {
  late Timer timer;
  int seconds = 0;

  @override
  void initState() {
    startTimer();
    super.initState();
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
    final String result =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    widget.updateTimer(result);
    return Text(
      result,
      style: const TextStyle(fontSize: 24),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

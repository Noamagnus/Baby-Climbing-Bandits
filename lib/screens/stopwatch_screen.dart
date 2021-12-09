import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Duration duration = const Duration();
  Timer? timer;
  bool isCountdown = false;

  void addTime() {
    setState(() {
      final addSecond = isCountdown ? -1 : 1;
      final seconds = duration.inSeconds + addSecond;
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ),
        (_) => addTime());
  }

  void resetTimer() {
    duration = const Duration();
  }

  void pauseTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTime(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text('Start'),
                  onPressed: startTimer,
                ),
                TextButton(
                  child: const Text('Pause'),
                  onPressed: pauseTimer,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$minutes:$seconds',
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

import 'package:baby_climbing_bandits/models/excercise_list.dart';
import 'package:baby_climbing_bandits/screens/stopwatch_screen.dart';
import 'package:baby_climbing_bandits/screens/exercise_list_screen.dart';
import 'package:baby_climbing_bandits/screens/workout_screen.dart';
import 'package:baby_climbing_bandits/state_notifiers/bottom_bar_notifier.dart';
import 'package:baby_climbing_bandits/state_notifiers/counter_notifier.dart';
import 'package:baby_climbing_bandits/state_notifiers/exercise_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, ref) {
    final index = ref.watch(bottomBarProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: [
        const ExcerciseListScreen(),
        const WorkoutScreen(),
        const StopwatchScreen(),
      ].elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          ref.read(bottomBarProvider.notifier).setBarIndex(value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Exercise List'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: 'Add Exercise'),
        ],
      ),
    );
  }
}

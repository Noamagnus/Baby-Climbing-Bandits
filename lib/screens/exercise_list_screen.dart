import 'package:baby_climbing_bandits/screens/create_excercise_screen.dart';
import 'package:baby_climbing_bandits/state_notifiers/exercise_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExcerciseListScreen extends ConsumerWidget {
  const ExcerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final exerciseList = ref.watch(excerciseListProvider);
    final list = exerciseList;

    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].name??''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateExcerciseScreen(),
            ),
          );
          //  ref.read(excerciseListProvider.notifier).addExerciseTest2();
        },
        tooltip: 'Add Excercise',
        child: const Icon(Icons.add),
      ),
    );
  }
}

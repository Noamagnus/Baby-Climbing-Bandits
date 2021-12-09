import 'package:baby_climbing_bandits/models/excercise.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final excerciseListProvider = StateNotifierProvider<ExcerciseListNotifier, List<Excercise>>((ref) {
  return ExcerciseListNotifier();
});

class ExcerciseListNotifier extends StateNotifier<List<Excercise>> {
  ExcerciseListNotifier()
      : super([
          Excercise(
              name: '7/3x5', hangTime: 7, restTime: 3, sets: 5, restAfterExercise: 3, id: 'blsa'),
          Excercise(
              name: '7/3x5', hangTime: 7, restTime: 3, sets: 5, restAfterExercise: 3, id: 'blsan'),
          Excercise(
              name: '7/3x5', hangTime: 7, restTime: 3, sets: 5, restAfterExercise: 3, id: 'blsafg'),
          Excercise(
              name: '7/3x5',
              hangTime: 7,
              restTime: 3,
              sets: 5,
              restAfterExercise: 3,
              id: 'blsasde'),
        ]);

  void addExercise(Excercise excercise) {
    state.add(excercise);
  }

  void addExercise3(Excercise excercise) {
    state = [...state, excercise];
  }

  void addExerciseTest(
 {   String? id,
    String? name,
    int? hangTime,
    int? restTime,
    int? sets,
    int? restBetweenSets,
    int? restAfterExercise,}
  ) {
    state = [
      ...state,
      Excercise(
        name: name,
        hangTime: hangTime,
        restTime: restTime,
        sets: sets,
        restAfterExercise: restAfterExercise,
        id: id,
      )
    ];
  }

  void addExerciseTest2(
    String id,
    String name,
    int hangTime,
    int restTime,
    int sets,
    int restBetweenSets,
    int restAfterExercise,
  ) {
    state = [
      ...state,
      Excercise(
        name: 'name',
        hangTime: 1,
        restTime: 1,
        sets: 1,
        restAfterExercise: 2,
        id: 'jlkjl',
      )
    ];
  }
}

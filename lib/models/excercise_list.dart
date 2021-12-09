import 'package:baby_climbing_bandits/models/excercise.dart';

class ExcerciseList {
  List<Excercise> listOfExercise;
  ExcerciseList({
    required this.listOfExercise,
  });

  ExcerciseList copyWith({
    List<Excercise>? listOfExercise,
  }) {
    return ExcerciseList(
      listOfExercise: listOfExercise ?? this.listOfExercise,
    );
  }
}

class Excercise {
  String? id;
  String? name;
  int? hangTime;
  int? restTime;
  int? sets;
  int? restAfterExercise;
  Excercise({
     this.id,
     this.name,
     this.hangTime,
     this.restTime,
     this.sets,
     this.restAfterExercise,
  });

  Excercise copyWith({
    String? id,
    String? name,
    int? hangTime,
    int? restTime,
    int? sets,
    int? restAfterExercise,
  }) {
    return Excercise(
      id: id?? this.id,
      name: name ?? this.name,
      hangTime: hangTime ?? this.hangTime,
      restTime: restTime ?? this.restTime,
      sets: sets ?? this.sets,
      restAfterExercise: restAfterExercise ?? this.restAfterExercise,
    );
  }
}

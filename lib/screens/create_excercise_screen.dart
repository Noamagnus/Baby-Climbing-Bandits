import 'package:baby_climbing_bandits/models/excercise.dart';
import 'package:baby_climbing_bandits/state_notifiers/exercise_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateExcerciseScreen extends ConsumerWidget {
  CreateExcerciseScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final excercise =
      Excercise(id: '', name: '', hangTime: 0, restTime: 0, sets: 0, restAfterExercise: 0);
  

  @override
  Widget build(BuildContext context, ref) {
    // final excerciseList = ref.watch(excerciseListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Excercise'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StringTextFormField(
                  labelText: 'Name',
                  onSaved: (String? value) {
                    excercise.name = value;
                  },
                ),
                IntTextFormField(
                  labelText: 'Hang Time',
                  onSaved: (String? value) {
                    if (value != null) {
                      var hangTime = int.parse(value);
                      excercise.hangTime = hangTime;
                    }
                  },
                ),
                 IntTextFormField(
                  labelText: 'Rest Time',
                  onSaved: (String? value) {
                    if (value != null) {
                      var restTime = int.parse(value);
                      excercise.restTime = restTime;
                    }
                  },
                ),
                 IntTextFormField(
                  labelText: 'Number of sets',
                  onSaved: (String? value) {
                    if (value != null) {
                      var sets = int.parse(value);
                      excercise.sets = sets;
                    }
                  },
                ),
                 IntTextFormField(
                  labelText: 'Rest After Exercise',
                  onSaved: (String? value) {
                    if (value != null) {
                      var restAE = int.parse(value);
                      excercise.restAfterExercise = restAE;
                    }
                  },
                ),
                
                TextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      formKey.currentState?.save();
                      ref.read(excerciseListProvider.notifier).addExercise3(excercise);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('SAVE'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StringTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(String? value) onSaved;

  const StringTextFormField({
    required this.onSaved,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: (value) {
          if (value == null || value=='') {
            return 'Name is required';
          }
          else if (value.length > 5) {
            return 'Name should have max 30 characters';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
      ),
    );
  }
}

class IntTextFormField extends StatelessWidget {
  final String labelText;
  final void Function(String? value) onSaved;

  const IntTextFormField({
    required this.onSaved,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: (value) {
          if (value == null) {
            return 'Please enter hang time';
          } else if (int.tryParse(value) == null) {
            return 'Value must be a number';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
      ),
    );
  }
}

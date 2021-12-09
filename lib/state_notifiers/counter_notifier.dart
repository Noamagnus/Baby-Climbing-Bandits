import 'package:baby_climbing_bandits/models/counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(0));

  void increment() {
    state = state.copyWith(counts: state.counts + 1);
  }

  
}

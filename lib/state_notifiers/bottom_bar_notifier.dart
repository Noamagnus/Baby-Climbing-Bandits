import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomBarProvider = StateNotifierProvider<BottomBarNotifier, int>((ref) {
  return BottomBarNotifier();
});

class BottomBarNotifier extends StateNotifier<int> {
  BottomBarNotifier() : super(0);

  void setBarIndex(int index) {
    state = index;
  }
}

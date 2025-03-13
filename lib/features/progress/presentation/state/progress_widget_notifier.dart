import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressNotifier extends StateNotifier<List<String>> {
  ProgressNotifier() : super([]);

  void addCompletedSubtopic(String subtopicId) {
    if (!state.contains(subtopicId)) {
      state = [...state, subtopicId];
    }
  }
}

final progressNotifierProvider =
    StateNotifierProvider<ProgressNotifier, List<String>>((ref) {
  return ProgressNotifier();
});

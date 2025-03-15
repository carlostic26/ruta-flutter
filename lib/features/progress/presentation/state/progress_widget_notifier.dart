import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';

class ProgressNotifier extends StateNotifier<List<String>> {
  final ProgressRepository _repository;

  ProgressNotifier(this._repository) : super([]) {
    _loadCompletedSubtopics();
  }

  Future<void> _loadCompletedSubtopics() async {
    final completedSubtopics = await _repository.getAllCompletedSubtopics();
    state = completedSubtopics;
  }

  void setCompletedSubtopicProvider(String subtopicId) {
    if (!state.contains(subtopicId)) {
      state = [...state, subtopicId];
    }
  }
}

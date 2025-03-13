import 'package:ruta_flutter/features/progress/domain/repositories/progress_repository.dart';

class IsSubtopicCompletedUseCase {
  final ProgressRepository _progressRepository;

  IsSubtopicCompletedUseCase(this._progressRepository);

  Future<bool> call(String subtopicId) async {
    return await _progressRepository.isSubtopicCompleted(subtopicId);
  }
}

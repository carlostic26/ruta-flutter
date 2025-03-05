import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_flutter/features/score/domain/use_cases/time_register_score_use_case.dart';
import 'package:ruta_flutter/features/score/presentation/state/provider/score_use_cases_provider.dart';

final registerScoreAfterDelayUseCaseProvider =
    Provider<RegisterScoreAfterDelayUseCase>((ref) {
  final scoreUseCases = ref.read(scoreUseCasesProvider);
  return RegisterScoreAfterDelayUseCase(scoreUseCases: scoreUseCases);
});

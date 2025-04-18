import 'package:rutas_flutter/features/level/data/models/level_model.dart';
import 'package:rutas_flutter/features/level/domain/repositories/level_repository.dart';

class GetLevelUseCase {
  late final LevelRepository repository;

  GetLevelUseCase(this.repository);

  Future<List<LevelModel>> call(String module) async {
    return repository.getLevel(module);
  }
}

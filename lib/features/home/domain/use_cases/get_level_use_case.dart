import 'package:ruta_flutter/features/home/data/models/level_model.dart';
import 'package:ruta_flutter/features/home/domain/repositories/level_repository.dart';

class LoadLevelUseCase {
  late final LevelRepository repository;

  LoadLevelUseCase(this.repository);

  Future<List<LevelModel>> call(String module) async {
    return repository.getLevel(module);
  }
}

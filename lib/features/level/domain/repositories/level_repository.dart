import 'package:rutas_flutter/features/level/data/models/level_model.dart';

abstract class LevelRepository {
  Future<List<LevelModel>> getLevel(String module);
  Future<int> countLevelsByModule(String module);
}

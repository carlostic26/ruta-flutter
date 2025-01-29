import 'package:ruta_flutter/features/home/data/models/level_model.dart';

abstract class LevelRepository {
  Future<List<LevelModel>> getLevel(String module);
}

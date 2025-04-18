import 'package:rutas_flutter/features/detail/data/models/detail_model.dart';

abstract class DetailRepository {
  Future<DetailModel> getDetail(String subtopicID, String module);
}

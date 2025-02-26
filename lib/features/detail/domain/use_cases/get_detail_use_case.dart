import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/detail/domain/repositories/detail_repository.dart';

class GetDetailUseCase {
  final DetailRepository repository;

  GetDetailUseCase(this.repository);

  Future<DetailModel> call(String subtopicID, String module) {
    return repository.getDetail(subtopicID, module);
  }
}

import 'package:rutas_flutter/features/topic/domain/entities/subtopic_entity.dart';

class SubtopicModel extends SubTopic {
  SubtopicModel({
    required super.id,
    required super.title,
    required super.module,
  });

  factory SubtopicModel.fromMap(Map<String, dynamic> map) {
    return SubtopicModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      module: map['module'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'module': module,
    };
  }

  SubtopicModel copyWith({
    String? id,
    String? title,
    String? module,
  }) {
    return SubtopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
      module: module,
    );
  }
}

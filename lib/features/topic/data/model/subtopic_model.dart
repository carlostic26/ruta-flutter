import 'package:ruta_flutter/features/topic/domain/entity/subtopic_entity.dart';

class SubTopicModel extends SubTopic {
  SubTopicModel({required super.id, required super.title});

  factory SubTopicModel.fromMap(Map<String, dynamic> map) {
    return SubTopicModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  SubTopicModel copyWith({
    String? id,
    String? title,
  }) {
    return SubTopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

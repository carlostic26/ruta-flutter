import 'package:ruta_flutter/features/topic/domain/entity/topic_entity.dart';

class TopicModel extends Topic {
  TopicModel({
    required super.id,
    required super.title,
  });

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
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

  TopicModel copyWith({
    String? id,
    String? title,
  }) {
    return TopicModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

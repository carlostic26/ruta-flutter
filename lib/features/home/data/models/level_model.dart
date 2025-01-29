import 'package:ruta_flutter/features/home/domain/entities/level.dart';

class LevelModel extends Level {
  LevelModel(
      {required super.id,
      required super.module,
      required super.title,
      required super.description,
      required super.points});

  factory LevelModel.fromMap(Map<String, dynamic> map) {
    return LevelModel(
        id: map['id'] ?? '',
        module: map['module'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        points: map['points'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'module': module,
      'title': title,
      'description': description,
      'points': points
    };
  }

  LevelModel copyWith({
    int? id,
    String? module,
    String? title,
    String? description,
    int? points,
  }) {
    return LevelModel(
      id: id ?? this.id,
      module: module ?? this.module,
      title: title ?? this.title,
      description: description ?? this.description,
      points: points ?? this.points,
    );
  }
}

class ExamQuestionModel {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String moduleId; // Agregar moduleId

  ExamQuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.moduleId, // Agregar moduleId
  });

  // Convertir un Map a ExamQuestionModel
  factory ExamQuestionModel.fromMap(Map<String, dynamic> map) {
    return ExamQuestionModel(
      id: map['id'],
      questionText: map['questionText'],
      options: List<String>.from(map['options']),
      correctAnswer: map['correctAnswer'],
      moduleId: map['moduleId'], // Agregar moduleId
    );
  }

  // Convertir ExamQuestionModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options,
      'correctAnswer': correctAnswer,
      'moduleId': moduleId, // Agregar moduleId
    };
  }
}

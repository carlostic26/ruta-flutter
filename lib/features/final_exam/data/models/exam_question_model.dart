class ExamQuestionModel {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  ExamQuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });

  // Convertir un Map a ExamQuestionModel
  factory ExamQuestionModel.fromMap(Map<String, dynamic> map) {
    return ExamQuestionModel(
      id: map['id'],
      questionText: map['questionText'],
      options: List<String>.from(map['options']),
      correctAnswer: map['correctAnswer'],
    );
  }

  // Convertir ExamQuestionModel a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}

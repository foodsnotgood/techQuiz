class QuestionDto {
  final String question;
  final Map<String, String> answers;
  final String correctAnswer;
  final Map<String, bool> correctAnswers;
  final bool multipleCorrect;

  const QuestionDto(
      {required this.answers,
      required this.correctAnswer,
      required this.question,
      required this.correctAnswers,
      required this.multipleCorrect});

  factory QuestionDto.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final question = data['question'] as String;
    final correctAnswer = data['correct_answer'] ?? "";
    final answers = data['answers'] as Map<String, dynamic>;
    final correctAnswers = data['correct_answers'] as Map<String, dynamic>;
    final multipleCorrect = data['multiple_correct_answers'] as String;
    return QuestionDto(
        question: question,
        answers: answers.map((key, value) => MapEntry(key, value ?? '')),
        correctAnswers: correctAnswers.map((key, value) =>
            MapEntry(key, value.toString().toLowerCase().trim() == 'true')),
        correctAnswer: correctAnswer,
        multipleCorrect: multipleCorrect.toLowerCase().trim() == 'true');
  }
}

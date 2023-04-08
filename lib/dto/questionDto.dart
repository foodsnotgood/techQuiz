class QuestionDto {
  final String question;
  final Map<String, String> answers;
  final String correctAnswer;

  const QuestionDto(
      {required this.answers,
      required this.correctAnswer,
      required this.question});

  factory QuestionDto.fromJson(Map<String, dynamic> json) {
    return QuestionDto(
      answers: json['answers'],
      correctAnswer: json['correct_answer'],
      question: json['question'],
    );
  }
}

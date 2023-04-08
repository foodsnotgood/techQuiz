import 'package:flutter/material.dart';

import '../settings.dart' as Settings;
import 'parts/question.dart';
import 'parts/result.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<Quiz> with AutomaticKeepAliveClientMixin {
  int questionNumber = 0;
  int score = 0;
  int totalQuestions = Settings.questions.length;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    Settings.restart.stream.listen((event) {
      setState(() {
        questionNumber = 0;
        score = 0;
      });
    });
    super.initState();
  }

  void processAnswer(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questionNumber == totalQuestions) {
      return Result(score);
    } else {
      return Question(questionNumber, score, processAnswer);
    }
    super.build(context);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speedquizz/parts/result.dart';
import 'package:speedquizz/parts/techQuestion.dart';
import 'package:speedquizz/settings.dart';

class ApiQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApiQuizState();
}

class _ApiQuizState extends State<ApiQuiz> with AutomaticKeepAliveClientMixin {
  int questionNumber = 0;
  int score = 0;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    restart.stream.listen((event) {
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
    return TechQuiz(processAnswer, questionNumber, score);
  }
}

class TechQuiz extends ConsumerWidget {
  final Function processAnswer;
  final int questionNumber;
  final int score;

  TechQuiz(this.processAnswer, this.questionNumber, this.score);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionData = ref.watch(questionDataProvider);
    return questionData.when(
        data: (data) {
          print(questionNumber);
          if (questionNumber == data.length) {
            return Result(score, data.length);
          } else {
            return Container(
                child: TechQuestion(data[questionNumber], processAnswer));
          }
        },
        error: ((error, _) => Center(child: Text(error.toString()))),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

import 'package:flutter/material.dart';
import 'package:speedquizz/parts/answerbutton.dart';

import '../settings.dart' as Settings;

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;

  Question(this.questionNumber, this.score, this.processAnswer);

  Widget makeRowWithAnswerButtons(answerNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Answerbutton(
            Settings.questions[questionNumber]["answers"][answerNumber],
            Settings.questions[questionNumber]["correct"] == answerNumber,
            processAnswer),
        if (answerNumber + 1 <
            Settings.questions[questionNumber]["answers"].length)
          Answerbutton(Settings.questions[questionNumber]["answers"][1],
              Settings.questions[questionNumber]["correct"] == 1, processAnswer)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: Settings.margin),
              child: Text(
                "Vraag ${questionNumber + 1} van ${Settings.questions.length}",
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: Settings.margin),
              child: Text(
                "score: 10",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: Settings.margin),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset(
            Settings.questions[questionNumber]["image"],
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Settings.margin),
          child: Text(
            'Dit is een eerste vraag',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        for (var i = 0;
            i < Settings.questions[questionNumber]["answers"].length;
            i += 2)
          makeRowWithAnswerButtons(i),
      ],
    );
  }
}

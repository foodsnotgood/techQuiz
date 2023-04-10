import 'package:flutter/material.dart';
import 'package:speedquizz/dto/questionDto.dart';
import 'package:speedquizz/parts/answerbutton.dart';
import 'package:speedquizz/settings.dart';

class TechQuestion extends StatelessWidget {
  final QuestionDto question;
  final Function processAnswer;

  TechQuestion(this.question, this.processAnswer);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Iterable<String> answers = question.answers.values;
    Iterable<bool> correctAnswers = question.correctAnswers.values;
    return ListView(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: margin),
                  child: Text(
                    'Category: ${question.category}',
                    style: theme.textTheme.titleLarge,
                  )),
              Container(
                  padding: const EdgeInsets.only(right: margin),
                  child: Text(
                    'Difficulty: ${question.difficulty}',
                    style: theme.textTheme.titleLarge,
                  )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Text(
            question.question,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        for (var i = 0; i < answers.length; i++)
          if (answers.elementAt(i).trim() != "")
            Answerbutton(answers.elementAt(i), correctAnswers.elementAt(i),
                processAnswer)
      ],
    );
  }
}

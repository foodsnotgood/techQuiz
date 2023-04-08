import 'package:flutter/material.dart';

import '../settings.dart' as Settings;

class Result extends StatelessWidget {
  final int score;

  Result(this.score);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      children: <Widget>[
        Container(
          height: 60,
          child: Center(
              child: Text(
            "Resultaat: ",
            style: theme.textTheme.headlineMedium,
          )),
        ),
        Center(
            child: Text(
          score.toString(),
          style: theme.textTheme.headlineLarge,
        )),
        Center(
            child: Text(
          "van de ${Settings.questions.length} vragen goed!",
          style: theme.textTheme.bodyLarge,
        )),
        Container(
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: Text("Opnieuw", style: theme.textTheme.bodyMedium),
                onPressed: () {
                  Settings.restart.add(true);
                },
              ),
            ))
      ],
    );
  }
}

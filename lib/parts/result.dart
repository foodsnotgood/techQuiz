import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings.dart' as Settings;
import '../settings.dart';

class Result extends StatelessWidget {
  final int score;
  final int totalAmountQuestion;

  Result(this.score, this.totalAmountQuestion);

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
          "van de $totalAmountQuestion vragen goed!",
          style: theme.textTheme.bodyLarge,
        )),
        Container(
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Consumer(
                builder: (context, ref, _) => ElevatedButton(
                  child: Text("Opnieuw", style: theme.textTheme.bodyMedium),
                  onPressed: () {
                    ref.refresh(questionDataProvider);
                    Settings.restart.add(true);
                  },
                ),
              ),
            ))
      ],
    );
  }
}

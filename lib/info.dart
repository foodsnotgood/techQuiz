import 'package:flutter/material.dart';
import 'package:speedquizz/settings.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(margin),
        child: Text(
          "Choose your topic on the welcome tab and take a quiz to hone your tech skills! With many thanks to QuizApi.io",
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../settings.dart' as Settings;

class Answerbutton extends StatefulWidget {
  final bool isCorrect;
  final String answer;
  final Function processAnswer;

  Answerbutton(this.answer, this.isCorrect, this.processAnswer);

  @override
  State<StatefulWidget> createState() => _MyAnswerbuttonState();
}

class _MyAnswerbuttonState extends State<Answerbutton>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<Color?> fillColorAnim, borderColorAnim;
  late Animation<double?> fadeAnim;

  @override
  void initState() {
    animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 180));
    fillColorAnim = ColorTween(begin: Colors.blue).animate(animController);
    borderColorAnim = ColorTween(begin: Colors.blue).animate(animController);
    fadeAnim = Tween<double>(begin: 1.0, end: 0.3).animate(animController);
    fillColorAnim.addListener(() {
      setState(() {});
    });
    fillColorAnim.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.processAnswer(widget.isCorrect);
        animController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.4;
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(Settings.margin),
      child: GestureDetector(
        onTap: () {
          Color endColor;
          widget.isCorrect ? endColor = Colors.green : endColor = Colors.red;
          fillColorAnim = ColorTween(begin: Colors.blue, end: endColor)
              .animate(animController);
          borderColorAnim = ColorTween(begin: Colors.blue[100], end: endColor)
              .animate(animController);
          animController.forward();
        },
        child: Opacity(
          opacity: !widget.isCorrect ? fadeAnim.value! : 1,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: buttonWidth * 0.4,
              minWidth: buttonWidth,
              maxWidth: buttonWidth,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: fillColorAnim.value!,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 1.0)
                  ],
                  border: Border.all(color: borderColorAnim.value!, width: 2)),
              child: Center(
                child: Text(
                  widget.answer,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onSecondary),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

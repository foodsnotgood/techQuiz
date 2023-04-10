import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speedquizz/dto/questionDto.dart';
import 'package:speedquizz/settings.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }

  Widget generateTopicButton(String topic, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          questionDataProvider = FutureProvider<List<QuestionDto>>((ref) {
            return ref.read(apiProvider).fetchQuestions(topic);
          });
          ref.refresh(questionDataProvider);
        },
        child: Text(topic));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var tabController = DefaultTabController.of(context);
    return Consumer(builder: (context, ref, _) {
      return ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Choose your topic:',
                style: theme.textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  questionDataProvider =
                      FutureProvider<List<QuestionDto>>((ref) {
                    return ref.read(apiProvider).fetchQuestions('');
                  });
                  restart.add(true);
                  ref.refresh(questionDataProvider);
                  tabController.animateTo(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Mixed", style: theme.textTheme.bodyLarge),
                )),
          ),
          for (var i = 0; i < topics.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    questionDataProvider =
                        FutureProvider<List<QuestionDto>>((ref) {
                      return ref.read(apiProvider).fetchQuestions(topics[i]);
                    });
                    restart.add(true);
                    ref.refresh(questionDataProvider);
                    tabController.animateTo(1);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(topics[i], style: theme.textTheme.bodyLarge),
                  )),
            )
        ],
      );
    });
  }
}

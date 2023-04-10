import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    return QuestionData();
  }
}

class QuestionData extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionData = ref.watch(questionDataProvider);
    return questionData.when(
        data: ((data) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [Text(data[index].question)],
                ),
              );
            },
            itemCount: data.length,
          );
        }),
        error: ((err, stackTrace) => Center(child: Text(err.toString()))),
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}

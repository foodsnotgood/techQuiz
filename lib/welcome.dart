import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dto/questionDto.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late Future<List<QuestionDto>> futureQuestions;

  Future<List<QuestionDto>> fetchQuestions() async {
    var response = await http.get(Uri.parse(
        'https://quizapi.io/api/v1/questions?apiKey=ymuTwJq2H7AhPOR7CJkBY3WVaFrV0q09RirkWy2d&limit=5'));
    print(json.decode(response.body)[0]['correct_answers'].runtimeType);
    return (json.decode(response.body) as List)
        .map((q) => QuestionDto.fromJson(q))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions here"),
      ),
      body: FutureBuilder<List<QuestionDto>>(
          future: futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QuestionDto> questions = snapshot.data as List<QuestionDto>;
              return ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(questions[index].question),
                        ],
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('error');
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

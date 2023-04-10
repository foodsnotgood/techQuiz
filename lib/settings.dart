import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speedquizz/service/apiService.dart';

import 'dto/questionDto.dart';

StreamController<bool> restart = StreamController<bool>();

final apiProvider = Provider<ApiService>((ref) => ApiService());
var questionDataProvider = FutureProvider<List<QuestionDto>>((ref) {
  return ref.read(apiProvider).fetchQuestions("");
});

const double margin = 10;

List<String> topics = [
  "Linux",
  "Devops",
  "Kubernetes",
  "Docker",
  "Code",
  "SQL",
  "CMS",
  "bash"
];

List<dynamic> json = [
  {
    "id": 375,
    "question":
        "Once a table has been created in MySQL, its structure cannot be altered",
    "description": null,
    "answers": {
      "answer_a": "True",
      "answer_b": "False",
      "answer_c": null,
      "answer_d": null,
      "answer_e": null,
      "answer_f": null
    },
    "multiple_correct_answers": "false",
    "correct_answers": {
      "answer_a_correct": "false",
      "answer_b_correct": "true",
      "answer_c_correct": "false",
      "answer_d_correct": "false",
      "answer_e_correct": "false",
      "answer_f_correct": "false"
    },
    "correct_answer": "answer_a",
    "explanation": null,
    "tip": null,
    "tags": [
      {"name": "MySQL"}
    ],
    "category": "SQL",
    "difficulty": "Easy"
  }
];

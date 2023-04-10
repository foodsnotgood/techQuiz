import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speedquizz/service/apiService.dart';

import 'dto/questionDto.dart';

StreamController<bool> restart = StreamController<bool>();

final apiProvider = Provider<ApiService>((ref) => ApiService());
final questionDataProvider = FutureProvider<List<QuestionDto>>((ref) {
  return ref.read(apiProvider).fetchQuestions();
});

const double margin = 10;

List<dynamic> questions = [
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/image1.jpeg",
    "answers": [
      "The Book of Boba Fett",
      "The Last Jedi",
      "A New Hope",
      "The Mandalorian"
    ],
    "correct": 3
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/image2.jpeg",
    "answers": [
      "The Empire Strikes Back",
      "The Last Jedi",
      "A New Hope",
      "Return of the Jedi"
    ],
    "correct": 0
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/image3.webp",
    "answers": [
      "Revenge of the Sith",
      "Rogue One",
      "Attack of the Clones",
      "The Phantom Menace"
    ],
    "correct": 0
  },
  {
    "question": "Uit welke film of reeks komt deze foto?",
    "image": "assets/images/image4.jpeg",
    "answers": [
      "Han Solo",
      "The Clone Wars",
      "The Book of Boba Fett",
      "Rogue One"
    ],
    "correct": 0
  }
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

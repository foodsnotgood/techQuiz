import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedquizz/dto/questionDto.dart';

class ApiService {
  String endpoint =
      'https://quizapi.io/api/v1/questions?apiKey=ymuTwJq2H7AhPOR7CJkBY3WVaFrV0q09RirkWy2d&limit=5';

  Future<List<QuestionDto>> fetchQuestions(String category) async {
    var response =
        await http.get(Uri.parse("$endpoint&category=$category&limit=30"));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((q) => QuestionDto.fromJson(q))
          .toList();
    } else {
      throw Exception("Couln't fetch data");
    }
  }
}

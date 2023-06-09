import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:speedquizz/dto/questionDto.dart';

class ApiService {
  String endpoint = dotenv.env['API_BASE_URL'] ?? '';
  String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<List<QuestionDto>> fetchQuestions(String category) async {
    var response = await http
        .get(Uri.parse("$endpoint?apiKey=$apiKey&category=$category&limit=5"));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((q) => QuestionDto.fromJson(q))
          .toList();
    } else {
      throw Exception("Couln't fetch data");
    }
  }
}

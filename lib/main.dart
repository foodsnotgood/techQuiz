import 'package:flutter/material.dart';
import 'package:speedquizz/info.dart';
import 'package:speedquizz/quiz.dart';
import 'package:speedquizz/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speedquizz',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Speed Quizz"),
          ),
          bottomNavigationBar: TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Welcome",
              ),
              Tab(
                icon: Icon(Icons.live_help),
                text: "Quiz",
              ),
              Tab(
                icon: Icon(Icons.info),
                text: "Info",
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Welcome(),
              Quiz(),
              Info(),
            ],
          ),
        ));
  }
}

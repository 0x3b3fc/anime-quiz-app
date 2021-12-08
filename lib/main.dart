import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  answerQuestion(int score) {
    print('Answer Chosen!');
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
    });
    print(_questionIndex);
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favourite Anime?',
      'answers': [
        {'text': 'Naruto', 'score': 40},
        {'text': 'Demon Slayer', 'score': 40},
        {'text': 'Jujitsu Kainsen', 'score': 40},
        {'text': 'Attack On Titans', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s the best character in naruto?',
      'answers': [
        {'text': 'Madara', 'score': 40},
        {'text': 'Naruto', 'score': 0},
        {'text': 'Sarutobi', 'score': 0},
        {'text': 'Sasuki', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s the name of Tangero\'s sister?',
      'answers': [
        {'text': 'Tangero', 'score': 0},
        {'text': 'Nezuku', 'score': 40},
        {'text': 'Zoro', 'score': 0},
        {'text': 'GoGo', 'score': 0},
      ]
    },
    {
      'questionText': 'What\'s the name of Naruto\'s Bego?',
      'answers': [

        {'text': 'Sasuki', 'score': 0},
        {'text': 'Gara', 'score': 0},
        {'text': 'Kurama', 'score': 40},
        {'text': 'Kazikagi', 'score': 0},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime Quiz App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Anime Quiz App',
            style: TextStyle(
                color: isSwitched == false ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.black,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.white,
            ),
          ],
        ),
        body: Center(
          child: Container(
            color: isSwitched == false ? Colors.white : Colors.black,
            child: _questionIndex < _questions.length
                ? Quiz(_questions, _questionIndex, answerQuestion)
                : Result(_resetQuiz, _totalScore),
          ),
        ),
      ),
    );
  }
}

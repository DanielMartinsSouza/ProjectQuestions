import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

main() => runApp(QuestionsApp());

class _QuestionsAppState extends State<QuestionsApp> {
  var _totalScore = 0;
  var _questionsIndex = 0;
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual sua cor preferida',
      'aswer': [
        {'text': 'Azul', 'score': 10},
        {'text': 'Verde', 'score': 3},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Preto', 'score': 7},
      ],
    },
    {
      'question': 'Qual seu animal preferido',
      'aswer': [
        {'text': 'Cachorro', 'score': 10},
        {'text': 'Gato', 'score': 7},
        {'text': 'Cavalo', 'score': 5},
        {'text': 'Rato', 'score': 3},
      ],
    },
    {
      'question': 'Qual seu time preferido',
      'aswer': [
        {'text': 'Real Madrid', 'score': 5},
        {'text': 'Manchester City', 'score': 10},
        {'text': 'Manchester United', 'score': 3},
        {'text': 'Chelsea', 'score': 7},
      ],
    },
  ];

  void _respond(int score) {
    print(questionSelected);
    if (questionSelected) {
      setState(() {
        _questionsIndex++;
        _totalScore += score;
      });
    }
    print(_totalScore);
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionsIndex = 0;
    });
  }

  bool get questionSelected {
    return _questionsIndex < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (var answerText in answersOptions) {
    //   answersList.addAll(<Widget>[Answer(answerText, _respond)]);
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title:
              Text("Questions"), // podeira usar tambem questions.elementAt(0)
        ),
        body: questionSelected
            ? Quiz(
                respond: _respond,
                questions: _questions,
                questionsIndex: _questionsIndex,
              )
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  @override
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}

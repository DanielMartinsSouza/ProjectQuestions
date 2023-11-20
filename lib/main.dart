import 'package:flutter/material.dart';
import 'package:project_questions/answer.dart';
import 'package:project_questions/question.dart';
import 'package:project_questions/result.dart';

main() => runApp(QuestionsApp());

class _QuestionsAppState extends State<QuestionsApp> {
  var _quenstionsIndex = 0;
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Qual sua cor preferida',
      'aswer': ['Azul', 'Verde', 'Vermelho', 'Preto'],
    },
    {
      'question': 'Qual seu animal preferido',
      'aswer': ['Cachorro', 'Gato', 'Cavalo', 'Rato'],
    },
    {
      'question': 'Qual seu time preferido',
      'aswer': [
        'Real Madrid',
        'Manchester City',
        'Manchester United',
        'Chelsea'
      ],
    },
  ];

  void _respond() {
    print(questionSelected);
    if (questionSelected) {
      setState(() {
        _quenstionsIndex++;
      });
    }
  }

  bool get questionSelected {
    return _quenstionsIndex < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answersOptions =
        questionSelected ? _questions[_quenstionsIndex].cast()['aswer'] : [];
    List<Answer> answersList =
        answersOptions.map((t) => Answer(t, _respond)).toList();

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
            ? Column(
                children: [
                  Question(_questions[_quenstionsIndex]['question'].toString()),
                  ...answersList,
                ],
              )
            : Result(),
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

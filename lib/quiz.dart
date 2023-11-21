import 'package:flutter/material.dart';
import 'package:project_questions/answer.dart';
import 'package:project_questions/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionsIndex;
  final Function(int) respond;
  const Quiz({
    super.key,
    required this.questionsIndex,
    required this.questions,
    required this.respond,
  });

  bool get questionSelected {
    return questionsIndex < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answersOptions =
        questionSelected ? questions[questionsIndex].cast()['aswer'] : [];
    List<Answer> answersList = answersOptions.map((result) {
      return Answer(
          result['text'] as String, () => respond(result['score'] as int));
    }).toList();
    return Column(
      children: [
        Question(questions[questionsIndex]['question'].toString()),
        ...answersList,
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuiz;
  const Result(this.score, this.restartQuiz, {super.key});

  String get textContent {
    return 'Incrivel, sua pontuação foi ${score}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            textContent,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: restartQuiz,
            child: Text(
              "Reiniciar Quiz?",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ))
      ],
    );
  }
}

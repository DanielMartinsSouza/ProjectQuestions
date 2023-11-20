import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onSelect;

  Answer(this.text, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: onSelect,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

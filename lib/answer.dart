import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Answer extends StatelessWidget {
  const Answer(this.x, this.answerText, {Key? key}) : super(key: key);

  final String answerText;
  final Function() x;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: x,
          child: Text(
            answerText,
            style: TextStyle(fontSize: 25),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.indigo,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

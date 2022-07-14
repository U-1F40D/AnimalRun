import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final animal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: const Text(
            'questionText',
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white)),
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('answerText'),
          ),
        )
      ],
    );
  }
}

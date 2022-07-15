import 'package:flutter/material.dart';

import '../services/animal_object.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    Animal animal = widget.animal;
    List<String> answers = animal.answers;
    int correctIndex = animal.correctIndex;
    return Column(
      children: [
        const Text('Quiz'),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Text(
            widget.animal.question,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        for (String answer in answers)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (answer == answers[correctIndex]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: const Text('Hurray: That was correct'),
                          content: Image.asset(
                            'assets/images/giphy.gif',
                            scale: 1,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Bye'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: const Text('Sorry'),
                          content: const Text('That wasn\'t right \u{1F915} '),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Try Again'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white)),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(answer),
            ),
          )
      ],
    );
  }
}

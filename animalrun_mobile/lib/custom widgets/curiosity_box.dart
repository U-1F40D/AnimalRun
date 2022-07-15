import 'package:flutter/material.dart';

class CuriosityWidget extends StatelessWidget {
  const CuriosityWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: '',
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
        children: [
          const TextSpan(
            text: 'Fun Fact:',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Allison',
              fontSize: 30.0,
            ),
          ),
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

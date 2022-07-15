
import 'package:flutter/material.dart';

class CuriosityWidget extends StatelessWidget {
  const CuriosityWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Fun',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              children: [
                const TextSpan(
                  text: ' Fact:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Allison',
                    fontSize: 28.0,
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
          ),
        ));
  }
}

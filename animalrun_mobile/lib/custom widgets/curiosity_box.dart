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
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

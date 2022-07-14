import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget(
      {Key? key,
      required this.text,
      required this.containerColor,
      required this.textColor})
      : super(key: key);
  final String text;
  final Color textColor;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Text(
        style: TextStyle(color: textColor),
        text.toUpperCase(),
      ),
    );
  }
}

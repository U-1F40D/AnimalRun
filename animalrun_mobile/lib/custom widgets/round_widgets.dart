import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  const RoundWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red[500]!,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(
        text.toUpperCase(),
      ),
    );
  }
}

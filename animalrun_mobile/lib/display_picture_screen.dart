// A widget that displays the picture taken by the user.
import 'dart:io';

import 'package:animalrun_mobile/custom%20widgets/curiosity_box.dart';
import 'package:animalrun_mobile/custom%20widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

import 'custom widgets/round_widgets.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        appBar: AppBar(title: const Text('Display Image')),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              heightFactor: (height / 300),
              child: const Text('Name'),
            ),
            Center(child: Image.file(File(imagePath))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  RoundWidget(text: 'ex'),
                  RoundWidget(text: 'ew'),
                  RoundWidget(text: 'cr'),
                  RoundWidget(text: 'en'),
                  RoundWidget(text: 'vu'),
                  RoundWidget(text: 'ew'),
                  RoundWidget(text: 'lc'),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Center(
              heightFactor: (height / 600),
              child: const CuriosityWidget(
                  text:
                      'Short Curiosity: \n Exciting Random Facts About Animal'),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const QuizWidget(animal: 'animal')
          ],
        ));
  }
}

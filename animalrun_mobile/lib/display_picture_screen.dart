// A widget that displays the picture taken by the user.

import 'package:animalrun_mobile/custom%20widgets/curiosity_box.dart';
import 'package:animalrun_mobile/custom%20widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

import 'custom widgets/round_widgets.dart';
import 'services/animal_object.dart';

class DisplayPictureScreen extends StatelessWidget {
  final Animal animal;

  const DisplayPictureScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    // ignore: unused_local_variable
    double width = size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Display Image')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              heightFactor: (height / 300),
              child: Text(animal.animalName),
            ),
            //image of zoo animal from backend
            Center(child: Image.network(animal.imageUrl)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  RoundWidget(
                      text: 'ex',
                      containerColor: Colors.black,
                      textColor: Colors.red),
                  RoundWidget(
                      text: 'ew',
                      containerColor: Colors.black,
                      textColor: Colors.white),
                  RoundWidget(
                      text: 'cr',
                      containerColor: Colors.redAccent,
                      textColor: Colors.white),
                  RoundWidget(
                      text: 'en',
                      containerColor: Colors.orangeAccent,
                      textColor: Colors.white),
                  RoundWidget(
                      text: 'vu',
                      containerColor: Colors.yellow,
                      textColor: Colors.white),
                  RoundWidget(
                      text: 'ew',
                      containerColor: Colors.green,
                      textColor: Colors.white),
                  RoundWidget(
                      text: 'lc',
                      containerColor: Colors.greenAccent,
                      textColor: Colors.white),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Center(
              heightFactor: (height / 600),
              child: CuriosityWidget(text: '\n${animal.trivia}'),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            QuizWidget(animal: animal)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.cancel),
      ),
    );
  }
}

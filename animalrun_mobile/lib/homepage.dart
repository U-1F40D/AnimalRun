import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.camera})
      : super(key: key);

  final String title;
  final CameraDescription camera;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool photoCapturing = false;

  @override
  void initState() {
    super.initState();
    // CameraController To display the current output from the Camera.
    _controller = CameraController(
        // Get specific camera from the list of available cameras check main.dart .
        widget.camera,
        // Define resolution to use.
        ResolutionPreset.medium,
        enableAudio: false);

    // Initialize the controller Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: photoCapturing
          ? const CircularProgressIndicator()
          : FloatingActionButton(
              onPressed: () async {
                setState(() {
                  photoCapturing = true;
                });
                // Taking Picture in a try / catch block.
                try {
                  // Ensuring camera is initialized.
                  await _initializeControllerFuture;

                  // Attempting to take a picture and get the file `image`
                  // where it was saved.
                  final image = await _controller.takePicture();

                  if (!mounted) return;

                  // If the picture was taken, display it on a new screen.
                  setState(() {
                    photoCapturing = false;
                  });
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        // Passing the automatically generated path to
                        // the DisplayPictureScreen widget.
                        imagePath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  setState(() {
                    photoCapturing = false;
                  });
                  debugPrint('debug: $e');
                }
              },
              child: const Icon(Icons.camera_alt),
            ),
    );
  }
}

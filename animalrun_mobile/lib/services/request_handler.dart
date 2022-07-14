import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'animal_object.dart';

const urlPrefix = 'http://10.20.136.235:5000/classify-animal';

Future<Animal> makePostRequest(image) async {
  Animal animal;

  var stream = http.ByteStream(image.openRead());
  stream.cast();
  var length = await image.length();
  var uri = Uri.parse(urlPrefix);
  var request = http.MultipartRequest("POST", uri);
  var multipartFile = http.MultipartFile('file', stream, length,
      filename: basename(image.path));
//contentType: new MediaType(‘image’, ‘png’));
  request.files.add(multipartFile);
  var response = await request.send();
  debugPrint(response.reasonPhrase);

  var respStr = await response.stream.bytesToString();
  debugPrint(respStr);

  animal = animalFromJson(respStr);

  return animal;
}

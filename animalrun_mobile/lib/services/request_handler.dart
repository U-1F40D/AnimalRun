import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const urlPrefix = 'https://10.20.136.134:5000';

Future<void> makePostRequest(String image) async {
  final url = Uri.parse('$urlPrefix/classify-animal');
  final headers = {"Content-type": "application/json"};
  final json = image;
  try {
    final response = await http.post(url, headers: headers, body: json);
    debugPrint('Status code: ${response.statusCode}');
    debugPrint('Body: ${response.body}');
  } catch (e) {
    debugPrint('debug: $e');
  }
}

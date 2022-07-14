// To parse this JSON data, do
//
//     final animal = animalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Animal animalFromJson(String str) => Animal.fromJson(json.decode(str));

String animalToJson(Animal data) => json.encode(data.toJson());

class Animal {
    Animal({
        required this.animalName,
        required this.extinctionLevel,
        required this.trivia,
        required this.imageUrl,
        required this.question,
        required this.answers,
        required this.correctIndex,
    });

    final String animalName;
    final String extinctionLevel;
    final String trivia;
    final String imageUrl;
    final String question;
    final List<String> answers;
    final String correctIndex;

    factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        animalName: json["animalName"],
        extinctionLevel: json["extinctionLevel"],
        trivia: json["trivia"],
        imageUrl: json["imageUrl"],
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
        correctIndex: json["correctIndex"],
    );

    Map<String, dynamic> toJson() => {
        "animalName": animalName,
        "extinctionLevel": extinctionLevel,
        "trivia": trivia,
        "imageUrl": imageUrl,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "correctIndex": correctIndex,
    };
}


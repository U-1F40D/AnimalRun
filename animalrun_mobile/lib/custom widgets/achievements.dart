import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  TextEditingController tController = TextEditingController();

  late SharedPreferences sPrefs;

  String temp = '';

  _saveToSharedPreferences() async {
    sPrefs = await SharedPreferences.getInstance();
    sPrefs.setString("KEY_1", tController.text.toString());
  }

  _showSavedValue() async {
    sPrefs = await SharedPreferences.getInstance();
    setState(() {
      temp = sPrefs.getString("KEY_1").toString();
    });
  }

  _deleteSharedPreferences() async {
    sPrefs = await SharedPreferences.getInstance();
    sPrefs.remove("KEY_1");
    setState(() {
      temp = " ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 10,
              color: Colors.blue,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const DefaultTextStyle(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    child: Text(
                      'Your Achievements',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        size: 40,
                        color: Colors.white,
                        Icons.cancel_outlined,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

String title = "Welcome";
void main() async{
  runApp(App(title: title));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
}

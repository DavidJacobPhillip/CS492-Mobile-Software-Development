import 'package:flutter/material.dart';

class Entry {
  String title;
  String body;
  int rating;
  DateTime date = DateTime.now();

  Entry({
    this.title = "",
    this.body = "",
    this.rating = 0,
  });
}
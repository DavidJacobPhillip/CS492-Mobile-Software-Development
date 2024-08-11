import 'package:flutter/material.dart';

class JournalEntry {
  late String title;
  late String body;
  late int rating;
  late DateTime date;

  JournalEntry({required this.title, required this.body, required this.rating, required this.date});
}
import 'package:flutter/services.dart';

import '../models/journal_entry.dart';
import 'package:flutter/material.dart';

class Journal {
  List<JournalEntry> entries;

  Journal({required this.entries});

  int get length {
    for (var i = 0; i < entries.length; i++) {
      print(entries[i].title);
    }
    return entries.length;
  }
}

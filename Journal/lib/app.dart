import 'package:flutter/material.dart';
import 'package:journal/main.dart';
import 'widgets/journal_entry_form.dart';
import 'screens/new_entry.dart';
import 'screens/journal_entry_list.dart';

class App extends StatelessWidget {
  final String title;

  const App({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: JournalEntryListScreen(),
    );
  }
}

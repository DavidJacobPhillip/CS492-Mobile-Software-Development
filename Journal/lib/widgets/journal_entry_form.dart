import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../db/journal_entry_dto.dart';
import '../screens/journal_entry_list.dart';

const CREATE_TABLE = 'assets/create_sql_table.txt';

class JournalEntryForm extends StatefulWidget {
  JournalEntryForm({Key? key}) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final JournalEntryValues = Entry();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
                key: formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: "Title",
                                border: OutlineInputBorder()),
                            onSaved: (value) {
                              JournalEntryValues.title = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a title';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: "Body",
                                border: OutlineInputBorder()),
                            onSaved: (value) {
                              JournalEntryValues.body = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a body';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: "Rating",
                                border: OutlineInputBorder()),
                            onSaved: (value) {
                              JournalEntryValues.rating = int.parse(value!);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a rating';
                              } else if (!(value == "1" ||
                                  value == "2" ||
                                  value == "3" ||
                                  value == "4")) {
                                return 'Please enter a rating between 1 to 4';
                              } else {
                                return null;
                              }
                            }),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          cancelButton(context),
                          saveButton(context),
                        ],
                      )
                    ]))));
  }

  Widget cancelButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Color.fromARGB(190, 247, 246, 246)),
      child: Text('Cancel'),
      onPressed: () {
        deleteDatabase('journal.sqlite3.db');
        Navigator.of(context).pop();
      },
    );
  }

  Widget saveButton(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Color.fromARGB(190, 247, 246, 246)),
      child: Text('Save Entry'),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print('Saved to database!');
          print('Title: ' + JournalEntryValues.title);
          print('Body: ' + JournalEntryValues.body);
          print('Rating: ${JournalEntryValues.rating}');
          print('Date: ${JournalEntryValues.date}');

          // Database Creation & Adding
          // deleteDatabase('journal.db');
          final Database database = await openDatabase('journal.sqlite3.db', version: 1,
              onCreate: (Database db, int version) async {
            await db.execute(await rootBundle.loadString(CREATE_TABLE));
          });

          await database.transaction((txn) async {
            await txn.rawInsert(
                'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?);',
                [
                  JournalEntryValues.title,
                  JournalEntryValues.body,
                  JournalEntryValues.rating,
                  JournalEntryValues.date.toIso8601String()
                ]);
          });

          await database.close();
          Navigator.of(context).pop();
        }
      },
    );
  }
}

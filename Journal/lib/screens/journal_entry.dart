import 'package:flutter/material.dart';
import 'package:journal/main.dart';
import 'package:intl/intl.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_form.dart';
import '../app.dart';

class ExistingEntry extends StatefulWidget {
  JournalEntry entry;

  ExistingEntry({Key? key, required this.entry}) : super(key: key);

  @override
  State<ExistingEntry> createState() => _ExistingEntryState();
}

class _ExistingEntryState extends State<ExistingEntry> {
  bool mode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(DateFormat('MMMM dd, yyyy').format(widget.entry.date)),
          leading: (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              )
            ]
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(widget.entry.title,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(widget.entry.body,
                                style: Theme.of(context).textTheme.bodyLarge))),
                  ],
                ))));
  }

  Widget settingsDrawer(BuildContext context) {
    return Drawer(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 95,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: Divider.createBorderSide(context,
                        color: Color.fromARGB(255, 237, 237, 237), width: 2.0),
                  ),
                ),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 175),
                    child: Text('Settings')),
              ),
            ),
            SwitchListTile(
                title: Text('Dark Mode'),
                value: mode,
                onChanged: (bool value) {
                  setState(() {
                    mode = value;
                  });
                })
          ],
        ));
  }
}

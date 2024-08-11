import 'package:flutter/material.dart';
import 'package:journal/main.dart';
import '../widgets/journal_entry_form.dart';
import '../models/journal.dart';
import '../app.dart';

class NewEntry extends StatefulWidget {
  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  bool mode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Journal Entry"),
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
        endDrawer: settingsDrawer(context),
        
        body: SafeArea(
            child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            JournalEntryForm(),
          ],
        )));
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

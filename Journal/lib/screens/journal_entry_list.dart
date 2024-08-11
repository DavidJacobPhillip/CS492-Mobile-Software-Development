import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../screens/journal_entry.dart';
import '../screens/new_entry.dart';
import '../widgets/journal_entry_form.dart';
import '../models/journal_entry.dart';
import '../models/journal.dart';

const CREATE_TABLE = 'assets/create_sql_table.txt';

class JournalEntryListScreen extends StatefulWidget {
  @override
  State<JournalEntryListScreen> createState() => _JournalEntryListScreenState();
}

class _JournalEntryListScreenState extends State<JournalEntryListScreen> {
  late Journal journal;
  String title = "Journal Entries";
  bool mode = true;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    // journal = Journal.fake();
    final Database database = await openDatabase('journal.sqlite3.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(await rootBundle.loadString(CREATE_TABLE));
    });

    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries');

    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          date: DateTime.parse(record['date']));
    }).toList();

    print(journalEntries);
    setState(() {
      journal = Journal(entries: journalEntries);
      print(journal.entries.length);
    });
  }

  Widget build(BuildContext context) {
    if (journal.length == 0) {
      return noEntries(context);
    } else {
      return hasEntries(context);
    }
  }

  // If the journal has entries
  Widget hasEntries(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              )
            ]),
        endDrawer: settingsDrawer(context),
        floatingActionButton: fabEntryCreateButton(context),
        body: LayoutBuilder(builder: sizeDecider));
  }

  Widget sizeDecider(BuildContext context, BoxConstraints constraints) {
    String entryTitle = journal.entries[0].title;
    String entryBody = journal.entries[0].body;
    if (constraints.maxWidth < 700) {
      return Center(
          child: ListView.builder(
              itemCount: journal.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text('${journal.entries[index].title}'),
                    subtitle: Text(
                        '${DateFormat('EEEE').format(journal.entries[index].date)}, ${DateFormat('MMMM dd, yyyy').format(journal.entries[index].date)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ExistingEntry(entry: (journal.entries[index]))));
                    });
              }));
    } else {
      return Center(
        child: Row(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: journal.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text('${journal.entries[index].title}'),
                        subtitle: Text(
                            '${DateFormat('EEEE').format(journal.entries[index].date)}, ${DateFormat('MMMM dd, yyyy').format(journal.entries[index].date)}'),
                        onTap: () {
                          print(index);
                          setState(() {
                            entryTitle = journal.entries[index].title;
                            entryBody = journal.entries[index].body;
                          });
                        });
                  }),
            ),
            preview(context, entryTitle, entryBody)
          ],
        ),
      );
    }
  }

  Widget preview(BuildContext context, String title, String body) {
    return Expanded(
        child: SafeArea(
      child: Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:
                    Text(title, style: Theme.of(context).textTheme.headline4),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(body,
                          style: Theme.of(context).textTheme.bodyLarge))),
            ],
          )),
    ));
  }

  Widget noEntries(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Welcome"),
            automaticallyImplyLeading: false,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              )
            ]),
        endDrawer: settingsDrawer(context),
        floatingActionButton: fabEntryCreateButton(context),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.book, size: 100), Text("Journal")],
        )));
  }

  Widget fabEntryCreateButton(BuildContext context) {
    return Material(
        child: FloatingActionButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NewEntry()))
            .then((_) {
          loadJournal();
        });
      },
      tooltip: 'Journal Entry Creator',
      child: const Icon(Icons.add),
    ));
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

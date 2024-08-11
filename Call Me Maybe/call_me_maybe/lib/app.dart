import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/business_card.dart';
import 'screens/resume.dart';
import 'screens/predictor.dart';

class App extends StatelessWidget {
  final String title;

  const App({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: MainTabController(title: title));
  }
}

// Lists out the tabs used for each of the screens
class MainTabController extends StatelessWidget {
  static const tabs = [
    Tab(icon: Icon(Icons.face)),
    Tab(icon: Icon(CupertinoIcons.doc_text_fill)),
    Tab(icon: Icon(CupertinoIcons.question_circle)),
  ];

  final screens = [
    Business_Card(title: "a"),
    Resume(title: "b"),
    Predictor(title: "c")
  ];

  final String title;
  MainTabController({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(title: Text(title), bottom: TabBar(tabs: tabs)),
          body: TabBarView(children: screens),
        ));
  }
}

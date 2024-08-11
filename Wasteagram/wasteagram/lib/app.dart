import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/waste_list_screen.dart';
import 'package:sentry/sentry.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: (Colors.grey)),
      home: WasteListScreen(),
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}

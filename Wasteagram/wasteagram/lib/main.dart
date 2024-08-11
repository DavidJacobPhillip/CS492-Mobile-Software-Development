import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://0d5067bea9c64d62a1a7c7c491b97e5f@o1358070.ingest.sentry.io/6644995';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(App()),
  );
}

import 'package:call_me_maybe/components/centered_placeholder.dart';
import 'package:flutter/material.dart';
import '../components/centered_placeholder.dart';
import '../models/magiceightball.dart';

class Predictor extends StatefulWidget {
  final String title;

  const Predictor({Key? key, required this.title}) : super(key: key);

  @override
  State<Predictor> createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  final magiceightball = MagicEightBall(value: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50, left: 5, right: 5),
          child: Text("Call Me... Maybe?",
              style: Theme.of(context).textTheme.headline4),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 50, left: 5, right: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  magiceightball.roll();
                });
               },
              child: Text("Ask a question... tap for the answer.",
                  style: Theme.of(context).textTheme.headline6),
            )),
        Padding(
            padding: EdgeInsets.only(bottom: 50, left: 5, right: 5),
            child: Align(
              alignment: Alignment.center,
              child: Text(magiceightball.answer(),
                  style: Theme.of(context).textTheme.headline4),
            ))
      ],
    ));
  }
}

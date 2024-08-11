import 'package:call_me_maybe/components/centered_placeholder.dart';
import 'package:flutter/material.dart';
import '../components/centered_placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class Business_Card extends StatelessWidget {
  final String title;

  const Business_Card({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.top,
      children: [
        // Padding Box
        Padding(
            padding: EdgeInsets.only(top: 50, bottom: 25),
            child: SizedBox(width: 50, height: 50, child: Placeholder())),

        // My Name
        Padding(
            padding: EdgeInsets.all(5),
            child: Text("Santosh Ramesh",
                style: Theme.of(context).textTheme.headline6)),

        // "Developer Extraordinaire"
        Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Text("Developer Extraordinaire",
                style: Theme.of(context).textTheme.bodyMedium)),

        // Phone Number
        Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: InkWell(
              onTap: () => launchUrl(Uri.parse("sms:9713448206")),
                child: Text("971-344-8206",
                  style: Theme.of(context).textTheme.bodyLarge))
              ),

        // Github + Email
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Github Link
          Padding(
            padding: EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse("https://www.github.com/DavidJacobPhillip")),
              child: const Text(
                "github.com/DavidJacobPhillip", 
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w400
              ))
            ),
          ),
          //Email
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text("rameshsa@oregonstate",
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.w400
              ))),
        ]),
      ],
    ));
  }
}

Widget paddedPlaceholder() {
  return const Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(width: 100, height: 100, child: Placeholder()));
}

Widget placeHolderRow() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [paddedPlaceholder(), paddedPlaceholder()]);
}

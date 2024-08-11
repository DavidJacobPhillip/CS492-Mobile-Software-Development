import 'package:flutter/material.dart';

// Returning Resume Sections
class Experience extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final String location;
  final String description;

  Experience(
      {Key? key,
      required this.title,
      required this.company,
      required this.date,
      required this.location,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: Padding(
        padding: EdgeInsets.only(
            top: 5,
            bottom: 5,
            left: padding(context),
            right: padding(context)),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          Row(children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(company,
                        style: Theme.of(context).textTheme.bodySmall))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(date,
                        style: Theme.of(context).textTheme.bodySmall))),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(location,
                        style: Theme.of(context).textTheme.bodySmall))),
          ]),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(description,
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ])));
  }
}

double padding(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return 10;
  } else {
    return 5;
  }
}

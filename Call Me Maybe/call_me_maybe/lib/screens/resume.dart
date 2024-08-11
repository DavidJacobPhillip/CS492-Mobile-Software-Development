import 'package:call_me_maybe/components/centered_placeholder.dart';
import 'package:flutter/material.dart';
import '../components/centered_placeholder.dart';
import 'package:call_me_maybe/components/experience.dart';

class Resume extends StatelessWidget {
  final String title;

  const Resume({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // My Name
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 3, left: padding(context), right: padding(context)),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Santosh Ramesh",
                        style: Theme.of(context).textTheme.headline6)),
              ),

              // Email
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, left: padding(context), right: padding(context)),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("rameshsa@oregonstate.edu",
                        style: Theme.of(context).textTheme.bodyMedium)),
              ),

              // Github
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 20, left: padding(context), right: padding(context)),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("https://www.github.com/DavidJacobPhillip",
                        style: Theme.of(context).textTheme.bodySmall)),
              ),

              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Data Assurance & Transparency Associate",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Account Executive",
                  company: "Gartner",
                  date: "June 2022 -",
                  location: "Dallas, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
              Experience(
                  title: "Computer Science Instructor",
                  company: "Oregon State",
                  date: "September 2022 -",
                  location: "Corvallis, TX",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies ex id enim fringilla, ac varius odio porta. Pellentesque congue, ante a cursus fringilla, quam leo lectus."),
            ],
          ),
        )));
  }
}

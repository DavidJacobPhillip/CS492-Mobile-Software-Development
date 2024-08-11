import 'dart:io';

import 'package:dart_space_adventure/dart_space_adventure.dart';
import 'planetary_system.dart';

class SapceAdventure {
  PlanetarySystem planetarySystem;

  SapceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt("What is Your Name"));
    print('Let\'s go on an adventure!');
    travel(promptForRandomOrSpecificDestination(
        'Shall I randomly choose a planet for you to visit? (Y or N)'));
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}! \n'
        'There are 8 planets to explore. \n');
  }

  void printIntroduction(String name) {
    print(
        'Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  void travelToRandomPlanet() {
    print('Ok! Traveling to Mercury...\n'
        'Arrived at Mercury, it\'s dark, dry and hot.');
  }

  void travelTo(String planet) {
    print('Travleing to $planet...'
        'Arrived at $planet. A very cold plannet, further from the sun \n');
  }

  void travel(bool randomDestination) {
    if (randomDestination) {
      travelToRandomPlanet();
    } else {
      travelTo(responseToPrompt('Name the planet you would like to visit.'));
    }
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer =
        ''; // good to type-annotate here because otherwise we don't know what it is
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I didn\'t get that');
      }
    }
    return false;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:dart_space_adventure/dart_space_adventure.dart';

void main(List<String> args) {
  var solarSystemData = jsonDecode(File(args[0]).readAsStringSync());
  var systemName = solarSystemData['name'];
  var planetList = mockPlanets(solarSystemData);

  SpaceAdventure(
          planetarySystem:
              PlanetarySystem(name: systemName, planets: planetList))
      .start();
}

List<Planet> mockPlanets(var solarSystemData) {
  List<Planet> planets = [];

  solarSystemData['planets'].forEach((entry) {
    planets.add(Planet(name: entry['name'], description: entry['description']));
  });

  return planets;
}

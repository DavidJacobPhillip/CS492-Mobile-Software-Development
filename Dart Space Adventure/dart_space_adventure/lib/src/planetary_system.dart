import 'dart:math';
import 'planet.dart';

class PlanetarySystem{
  final Random _random = Random();    // Required to create a seed; not using this would return the same "random" planet everytime
  final String name;
  final List<Planet> planets;
  
  PlanetarySystem({this.name = "Unnamed System", this.planets = const[]});

  // Getters
  int get numberOfPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  // Methods
  Planet randomPlanet(){
    if(!hasPlanets) return Planet.nullPlanet();           // Prevents accessing out-of-range planets when the list of planets is empty
    return planets[_random.nextInt(planets.length)];
  }

  Planet planetWithName(String name){
    return planets.firstWhere(
      (planet) => planet.name == name, 
      orElse: () => Planet.nullPlanet()
    );
  }
  
}
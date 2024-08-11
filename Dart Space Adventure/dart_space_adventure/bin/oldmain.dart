import 'package:dart_space_adventure/dart_space_adventure.dart';

const systemName = 'Solar System';
const planetData = {
  'Mercury': 'A very hot planet, closest to the sun',
  'Venus': 'Named after a Greek Goddess',
  'Earth': 'No other place to call home!',
  'Neptune': 'What a cool name for an uninteresting planet',
  'Jupiter': 'A gas giant, with a noticeable red spot'
};

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: systemName,
      planets: mockPlanets()
    )
  ).start();
}

List<Planet> mockPlanets(){
  return planetData.entries.map(
    (e) => Planet(
      name: e.key, 
      description: e.value
    )
  ).toList();
}
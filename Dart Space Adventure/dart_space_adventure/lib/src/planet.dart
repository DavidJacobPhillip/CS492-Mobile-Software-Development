class Planet{
  final String name;
  final String description;

  Planet({required this.name, required this.description});

  Planet.nullPlanet(): name = 'Null', description = 'Null';
}
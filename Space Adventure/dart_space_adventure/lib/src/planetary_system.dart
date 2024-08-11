class PlanetarySystem {
  String name;

  // constructor's old form
  // PlanetarySystem() {
  //   this.name == "Unnamed System";
  // }

  // constructor's new form
  // PlanetarySystem() : name = "unnamed System";

  // named constructor's type old form
  // PlanetarySystem.withName(String name) {
  //   this.name = name;
  // }

  // named constructor's new form using initialized formal
  PlanetarySystem({this.name = "Unnamed System"})
}

// example:
var dagobah = PlanetarySystem(name: "Dagobah System");

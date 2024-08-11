import 'dart:math';

class MagicEightBall {
  final Random random = Random();

  final int value;
  String response = "";
  int current = 8;

  MagicEightBall({this.value = 8});

  String answer() {
    switch (current) {
      case 1: {return "Unlikely.";}
      case 2: {return "Hmm... Try Again.";}
      case 3: {return "It will happen!";}
      case 4: {return "There is no chance!";}
      case 5: {return "Basically 50-50!";}
      case 6: {return "Not worth a shot.";}
      case 7: {return "Very Likely!";}
      case 8: {return "Unlikely But Possible.";}
    }

    return "Unlikely But Possible.";
  }

  void roll() {
    current = random.nextInt(value) + 1;
  }
}

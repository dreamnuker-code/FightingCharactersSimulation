import 'dart:io';
import 'package:ansicolor/ansicolor.dart';
import 'dart:math';

class Character {
  String name;
  int? hp;
  int? normalDamage;
  Map<String, dynamic> superPower;
  bool breaked;

  Character({
    required this.name,
    required this.hp,
    required this.normalDamage,
    required this.breaked,
    required String superPName,
    required int? superPdmg,
  }) : superPower = {
    'name': superPName,
    'dmg': superPdmg
  };
}

void main() {
  AnsiPen critPen = AnsiPen()..red(bold: true);
  AnsiPen lightPen = AnsiPen()..green(bold: true);
  AnsiPen pinkPen = AnsiPen()..magenta(bold: true);
  typing("Welcome to the simulation of two Characters fighting each other.");
  typing("First thing we will do is to create these two Characters, obviously.");
  typing("Not one, not three, two. Why? Because I wish so. Lol.");
  print("");
  List<Character> chars = [];
  for (var i = 1; i < 3; i++) {
    chars.add(creatingCharacters(i));
  }
  sleep(Duration(seconds: 2));
  print("===================================");
  print(critPen("${chars[0].name} vs. ${chars[1].name}"));
  sleep(Duration(seconds: 5));
  typing("Well...");
  typing("It's going to be very interesting...");
  typing("Are you ready?");
  typing("No matter...");
  typing(pinkPen('3...'));
  typing(pinkPen('2..'));
  typing(pinkPen('1.'));
  typing(lightPen("Go!"));
  game(chars);
}

void typing(String text) {
  for (var i = 0; i < text.length; i++) {
    stdout.write(text[i]);
    sleep(const Duration(milliseconds: 30));
  }
  sleep(const Duration(milliseconds: 500));
  print("");
}

Character creatingCharacters(num) {
  AnsiPen critPen = AnsiPen()..red(bold: true);
  AnsiPen lightPen = AnsiPen()..green(bold: true);
  AnsiPen pinkPen = AnsiPen()..magenta(bold: true);
  print("");
  print("============================================================");
  String numbr = "";
  switch(num) {
    case 1: numbr = "1st"; break;
    case 2: numbr = "2nd"; break;
  }
  typing("Please enter the name of the ${numbr} Character.");
  stdout.write(lightPen("> > > "));
  String name = stdin.readLineSync() ?? '';
  typing("Okay... Now decide how much HP should this Character have.");
  stdout.write(lightPen("> > > "));
  int? hp;
  while (hp == null) {
    hp = int.tryParse(stdin.readLineSync() ?? '');
    if (hp == null) {
      stdout.write(critPen("ERROR. Try again."));
      stdout.write(lightPen("> > > "));
    }
    else {
      break;
    }
  }
  typing("Alright... Type how much damage should this Character take.");
  stdout.write(lightPen("> > > "));
  int? dmg;
  while (dmg == null) {
    dmg = int.tryParse(stdin.readLineSync() ?? '');
    if (dmg == null) {
      stdout.write(critPen("ERROR. Try again."));
      stdout.write(lightPen("> > > "));
    }
    else {
      break;
    }
  }
  typing("Nice! Now something unexpecting!");
  typing(pinkPen("SPECIAL Character'S SUPERPOWER!!!"));
  typing("How should this superpower called?");
  stdout.write(lightPen("> > > "));
  String spName = stdin.readLineSync() ?? '';
  typing("How much HP should this superpower take to the opponent?");
  stdout.write(lightPen("> > > "));
  int? spDmg;
  while (spDmg == null) {
    spDmg = int.tryParse(stdin.readLineSync() ?? '');
    if (spDmg == null) {
      stdout.write(critPen("ERROR. Try again."));
      print(lightPen(" > > > "));
    }
    else {
      break;
    }
  } 
  return Character(name: name, hp: hp, normalDamage: dmg, breaked: false, superPName: spName, superPdmg: spDmg);
}

void game(List<Character> chars) {
  AnsiPen critPen = AnsiPen()..red(bold: true);
  AnsiPen lightPen = AnsiPen()..green(bold: true);
  AnsiPen pinkPen = AnsiPen()..magenta(bold: true);
  List<Character> characters = chars;
  print("============================================================");
  while (characters[0].hp! > 0 && characters[1].hp! > 0) {
    print("${characters[0].name}'s HP : ${characters[0].hp}");
    print("${characters[1].name}'s HP : ${characters[1].hp}");
    int ac0 = 0;
    int ac1 = 0;
    if (characters[0].breaked == false && characters[1].breaked == false) {
      ac0 = Random().nextInt(2);
      ac1 = Random().nextInt(2);
      switch(ac0) {
        case 0: characters[1].hp = characters[1].hp! - characters[0].normalDamage!; typing(pinkPen("Character ${characters[0].name} attacked ${characters[1].name} and took ${characters[0].normalDamage}")); break; // characters[1].hp! - characters[0].normalDamage!, poniewaz int?, tak, ! to "jest!!! jest!!!", nie "nie jest"
        case 1: characters[1].hp = characters[1].hp! - (characters[0].superPower["dmg"] as int); characters[0].breaked = true; typing(critPen("Character ${characters[0].name} used their superpower ${(characters[0].superPower["name"] as String)} on ${characters[1].name} and took ${(characters[0].superPower["dmg"] as int)}")); break;
      }
      switch(ac1) {
        case 0: characters[0].hp = characters[0].hp! - characters[1].normalDamage!; typing(pinkPen("Character ${characters[1].name} attacked ${characters[0].name} and took ${characters[0].normalDamage}")); break;// characters[1].hp! - characters[0].normalDamage!, poniewaz int?, tak, ! to "jest!!! jest!!!", nie "nie jest"
        case 1: characters[0].hp = characters[0].hp! - (characters[1].superPower["dmg"] as int); characters[1].breaked = true; typing(critPen("Character ${characters[1].name} used their superpower ${(characters[1].superPower["name"] as String)} on ${characters[0].name} and took ${(characters[1].superPower["dmg"] as int)}")); break;
      }
    }
    else if (characters[0].breaked == false && characters[1].breaked == true) {
      ac0 = Random().nextInt(2);
      switch(ac0) {
        case 0: characters[1].hp = characters[1].hp! - characters[0].normalDamage!; typing(pinkPen("Character ${characters[0].name} attacked ${characters[1].name} and took ${characters[0].normalDamage}")); break; // characters[1].hp! - characters[0].normalDamage!, poniewaz int?, tak, ! to "jest!!! jest!!!", nie "nie jest"
        case 1: characters[1].hp = characters[1].hp! - (characters[0].superPower["dmg"] as int); characters[0].breaked = true; typing(critPen("Character ${characters[0].name} used their superpower ${(characters[0].superPower["name"] as String)} on ${characters[1].name} and took ${(characters[0].superPower["dmg"] as int)}")); break;
      }
      typing(lightPen("${characters[1].name} cannot attack."));
      characters[1].breaked = false;
    }
    else if (characters[0].breaked == true && characters[1].breaked == false) {
      ac1 = Random().nextInt(2);
      switch(ac1) {
        case 0: characters[0].hp = characters[0].hp! - characters[1].normalDamage!; typing(pinkPen("Character ${characters[1].name} attacked ${characters[0].name} and took ${characters[1].normalDamage}")); break; // characters[1].hp! - characters[0].normalDamage!, poniewaz int?, tak, ! to "jest!!! jest!!!", nie "nie jest"
        case 1: characters[0].hp = characters[0].hp! - (characters[1].superPower["dmg"] as int); characters[1].breaked = true; typing(critPen("Character ${characters[1].name} used their superpower ${(characters[1].superPower["name"] as String)} on ${characters[0].name} and took ${(characters[1].superPower["dmg"] as int)}")); break;
      }
      typing(lightPen("${characters[0].name} cannot attack."));
      characters[0].breaked = false;
    }
    else if (characters[0].breaked == true && characters[1].breaked == true) {
      characters[0].breaked = false;
      characters[1].breaked = false;
      typing(lightPen("Both characters took a break and now they can fight."));
    }
  }
  if (characters[0].hp! <= 0 && characters[1].hp! > 0 || characters[0].hp! < characters[1].hp!) {
    typing(lightPen("Congratulations! ${characters[1].name} won!"));
  }
  else if (characters[1].hp! <= 0 && characters[0].hp! > 0 || characters[1].hp! < characters[0].hp!) {
    typing(lightPen("Congratulations! ${characters[0].name} won!"));
  }
}
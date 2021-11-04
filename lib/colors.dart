import 'package:flutter/material.dart';

const Color kTxtWhite = Color(0xffFeFeFe);
const Color kMdGrey = Color(0xff666666);
const Color kLtGrey = Color(0xffAAAAAA);
const Color kDarkBlack = Color(0xff1b1b1b);
const Color kspaceBlack = Color(0xff000000);
const Color kJustWhite = Color(0xffeeeeee);

const Color kgreenShade1 = Color(0xff80ED99);
const Color kgreenShade2 = Color(0xff57CC99);
const Color kgreenShade3 = Color(0xff38A3A5);
const Color kgreenShade4 = Color(0xff22577A);

const List<String> alphabets = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class GradientApp {
  double radius;
  GradientApp({
    required this.radius,
  });
  late Gradient kgreenTea = RadialGradient(
      colors: const [kgreenShade2, kgreenShade1],
      center: Alignment.topCenter,
      radius: radius);

  late Gradient kMidForest = RadialGradient(
      colors: const [kgreenShade3, kgreenShade2],
      center: Alignment.topCenter,
      radius: radius);

  late Gradient kPurplePearl = RadialGradient(
      colors: const [kgreenShade2, kgreenShade2],
      center: Alignment.topCenter,
      radius: radius);

  late Gradient kBurningSun = RadialGradient(
      colors: const [kgreenShade2, kgreenShade2],
      center: Alignment.topCenter,
      radius: radius);
}

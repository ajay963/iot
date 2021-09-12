import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  final String colorCode;
  const ColorBox({
    Key? key,
    required this.colorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Ink(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Color(int.parse(colorCode)),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

class GradientBox extends StatelessWidget {
  final String color1;
  final String color2;
  final String graientName;
  const GradientBox({
    Key? key,
    required this.color1,
    required this.color2,
    required this.graientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(graientName),
        const SizedBox(height: 20),
        Ink(
          height: screenSize.width * 0.3,
          width: screenSize.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(int.parse(color1)), Color(int.parse(color2))],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight)),
        ),
      ],
    );
  }
}

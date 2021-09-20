import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  final Color colorCode;
  final Function() onTap;
  const ColorBox({
    Key? key,
    required this.colorCode,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.white.withOpacity(0.5),
      child: Ink(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: colorCode, borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class GradientBox extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String graientName;
  final Function() onTap;
  const GradientBox({
    Key? key,
    required this.color1,
    required this.color2,
    required this.graientName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.white.withOpacity(0.5),
      child: Ink(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: RadialGradient(
                colors: [color1, color2],
                radius: 1,
                focal: Alignment.topLeft,
                center: Alignment.topRight)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  final Color colorCode;
  const ColorBox({
    Key? key,
    required this.colorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: colorCode, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class GradientBox extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String graientName;
  const GradientBox({
    Key? key,
    required this.color1,
    required this.color2,
    required this.graientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(graientName,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1),
        const SizedBox(height: 10),
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight)),
        ),
      ],
    );
  }
}

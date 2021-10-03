import 'package:flutter/material.dart';

class CustomRoudedButto extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomRoudedButto({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    // final _color = Provider.of<LightData>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      hoverColor: Colors.white.withOpacity(0.2),
      onTap: onTap,
      child: Ink(
        height: 40,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(text, style: _txtTheme.bodyText1)),
        decoration: BoxDecoration(
          color: Theme.of(context).textButtonTheme.style.backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color txtWhite = Color(0xffFeFeFe);
const Color mdGrey = Color(0xff666666);
const Color ltGrey = Color(0xffAAAAAA);
const Color darkBlack = Color(0xff1b1b1b);

class Themeing {
  static ThemeData theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: darkBlack,
      splashColor: Colors.white,
      textTheme: TextTheme(
          headline1: GoogleFonts.roboto(
              fontSize: 28, fontWeight: FontWeight.w700, color: txtWhite),
          headline2: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: mdGrey,
          ),
          headline3: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: txtWhite,
          ),
          bodyText1: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: ltGrey,
          )));
}

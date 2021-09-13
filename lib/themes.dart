import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kTxtWhite = Color(0xffFeFeFe);
const Color kMdGrey = Color(0xff666666);
const Color kLtGrey = Color(0xffAAAAAA);
const Color kDarkBlack = Color(0xff1b1b1b);

class Themeing {
  static ThemeData appTheme = ThemeData(
      // brightness: Brightness.light,
      // primaryColor: darkBlack,
      splashColor: Colors.white,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: kTxtWhite),
          headline2: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: kMdGrey,
          ),
          headline3: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: kTxtWhite,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: kLtGrey,
          )),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            letterSpacing: 4,
            color: kTxtWhite),
        backgroundColor: kDarkBlack,
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: kMdGrey,
        labelStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: kLtGrey,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: kMdGrey.withOpacity(0.5),
        ),
      ),
      sliderTheme: const SliderThemeData(
          thumbColor: kDarkBlack,
          activeTrackColor: kDarkBlack,
          inactiveTrackColor: kLtGrey,
          overlayColor: Color(0x22000000),
          trackHeight: 10,
          thumbShape: RoundSliderThumbShape(
              disabledThumbRadius: 15, enabledThumbRadius: 15)));
}

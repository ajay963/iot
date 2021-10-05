import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/colors.dart';

class Themeing {
  static ThemeData appTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kJustWhite,
      cardColor: kLtGrey,
      iconTheme: const IconThemeData(color: kJustWhite, size: 24),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kspaceBlack),
      )),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kMdGrey),
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
            color: kMdGrey,
          ),
          bodyText2: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 4,
            color: kTxtWhite),
        backgroundColor: const Color(0xffefefef),
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: kMdGrey.withOpacity(0.5),
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

  static ThemeData appDarkTheme = ThemeData(
      brightness: Brightness.dark,
      // backgroundColor: kspaceBlack,
      cardColor: kDarkBlack,
      scaffoldBackgroundColor: kspaceBlack,
      iconTheme: const IconThemeData(
        size: 40,
        color: kspaceBlack,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kMdGrey),
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
            color: kMdGrey,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: kMdGrey,
          ),
          bodyText2: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: kMdGrey)),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          letterSpacing: 4,
          color: kMdGrey,
        ),
        backgroundColor: kspaceBlack,
        elevation: 0,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: kMdGrey.withOpacity(0.5),
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
          color: kLtGrey.withOpacity(0.5),
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

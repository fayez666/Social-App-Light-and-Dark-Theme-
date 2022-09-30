import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarDarkTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor)
    ),
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32)
    ),
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme:appBarLightTheme,
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
  );
}

 AppBarTheme appBarLightTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
  color: kContentColorLightTheme,
    titleTextStyle: GoogleFonts.cookie(
        fontSize: 36
    )
);

AppBarTheme appBarDarkTheme = AppBarTheme(
    centerTitle: false,
    elevation: 0,
    color: kContentColorDarkTheme,
  titleTextStyle: GoogleFonts.cookie(
    color: Colors.black,
    fontSize: 36
  )
);
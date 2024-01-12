import 'package:flutter/material.dart';

enum Mode { dark, light }

ThemeData appTheme(Mode mode) {
  return ThemeData(
    useMaterial3: true,
    brightness: mode == Mode.dark ? Brightness.dark : Brightness.light,
    colorSchemeSeed: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
    fontFamily: 'ComicNeue',
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontFamily: 'ComicNeue',
            fontWeight: FontWeight.w900,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    ),
  );
}

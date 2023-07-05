import 'package:flutter/material.dart';

ThemeData themeCustomData() {
  return ThemeData(
    // fontFamily: 'Playfair',
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.white,
      primaryContainer: Colors.grey.shade200,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w500)),
  );
}

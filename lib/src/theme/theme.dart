import 'package:covid_19/src/theme/text_theme.dart';
import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();
  //= Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,

    //* -- Text Theme
    textTheme: AppTextTheme.lightTextTheme,
  );
  //= Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,

    //* -- Text Theme
    textTheme: AppTextTheme.darkTextTheme,
  );
}

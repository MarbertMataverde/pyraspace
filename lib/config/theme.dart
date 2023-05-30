import 'package:flutter/material.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: LightThemeColors.primaryColor,
  scaffoldBackgroundColor: LightThemeColors.backgroundColor,
  textTheme: const TextTheme().apply(
    bodyColor: LightThemeColors.primaryTextColor,
    displayColor: LightThemeColors.secondaryTextColor,
  ),
  fontFamily: 'Poppins',
);

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: DarkThemeColors.primaryColor,
  scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
  textTheme: const TextTheme().apply(
    bodyColor: DarkThemeColors.primaryTextColor,
    displayColor: DarkThemeColors.secondaryTextColor,
  ),
  fontFamily: 'Poppins',
);

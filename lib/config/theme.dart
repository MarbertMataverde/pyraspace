import 'package:flutter/material.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: LightThemeColors.primaryColor,
  scaffoldBackgroundColor: LightThemeColors.backgroundColor,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: LightThemeColors.primaryColor),
    bodyMedium: TextStyle(color: LightThemeColors.primaryColor),
    bodyLarge: TextStyle(color: LightThemeColors.primaryColor),
    labelSmall: TextStyle(color: LightThemeColors.secondaryTextColor),
    labelMedium: TextStyle(color: LightThemeColors.secondaryTextColor),
    labelLarge: TextStyle(color: LightThemeColors.secondaryTextColor),
  ),
  fontFamily: 'Poppins',
);

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: DarkThemeColors.primaryColor,
  scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: DarkThemeColors.primaryColor),
    bodyMedium: TextStyle(color: DarkThemeColors.primaryColor),
    bodyLarge: TextStyle(color: DarkThemeColors.primaryColor),
    labelSmall: TextStyle(color: DarkThemeColors.secondaryTextColor),
    labelMedium: TextStyle(color: DarkThemeColors.secondaryTextColor),
    labelLarge: TextStyle(color: DarkThemeColors.secondaryTextColor),
  ),
  fontFamily: 'Poppins',
);

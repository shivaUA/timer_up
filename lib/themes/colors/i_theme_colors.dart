import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors/theme_colors_dark.dart';
import 'package:timer_up/themes/colors/theme_colors_light.dart';
import 'package:timer_up/themes/theme_type.dart';

abstract interface class IThemeColors {
  Color get primaryColor;
  Color get secondaryColor;
  Color get tertiaryColor;

  Color get primaryBackgroundColor;
  Color get secondaryBackgroundColor;
  Color get tertiaryBackgroundColor;

  Color get textPrimaryColor;
  Color get textSecondaryColor;
  Color get textTertiaryColor;

  Color get borderPrimaryColor;
  Color get borderSecondaryColor;
  Color get borderTertiaryColor;

  Color get errorTextColor;
  Color get errorBackgroundColor;
  Color get errorBorderColor;

  Color get infoTextColor;
  Color get infoBackgroundColor;
  Color get infoBorderColor;

  Color get warningTextColor;
  Color get warningBackgroundColor;
  Color get warningBorderColor;

  Color get successTextColor;
  Color get successBackgroundColor;
  Color get successBorderColor;

  static IThemeColors combine(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        return ThemeColorsLight();
      default:
        return ThemeColorsDark();
    }
  }
}

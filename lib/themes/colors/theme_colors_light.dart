import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors/i_theme_colors.dart';

final class ThemeColorsLight implements IThemeColors {
  @override
  Color get primaryColor => const Color.fromRGBO(76, 41, 87, 1);
  @override
  Color get secondaryColor => const Color.fromRGBO(204, 150, 147, 1);
  @override
  Color get tertiaryColor => const Color.fromRGBO(170, 135, 80, 1);

  @override
  Color get primaryBackgroundColor => const Color.fromRGBO(241, 231, 244, 1);
  @override
  Color get secondaryBackgroundColor => const Color.fromRGBO(233, 224, 236, 1);
  @override
  Color get tertiaryBackgroundColor => const Color.fromRGBO(229, 206, 214, 1);

  @override
  Color get textPrimaryColor => const Color.fromRGBO(27, 15, 31, 1);
  @override
  Color get textSecondaryColor => const Color.fromRGBO(27, 15, 31, .6);
  @override
  Color get textTertiaryColor => const Color.fromRGBO(170, 135, 80, .6);

  @override
  Color get borderPrimaryColor => const Color.fromRGBO(216, 207, 219, 1);
  @override
  Color get borderSecondaryColor => const Color.fromRGBO(210, 200, 213, 1);
  @override
  Color get borderTertiaryColor => const Color.fromRGBO(170, 135, 80, .3);

  @override
  Color get errorTextColor => const Color.fromARGB(255, 217, 83, 79);
  @override
  Color get errorBackgroundColor => const Color.fromARGB(255, 242, 222, 222);
  @override
  Color get errorBorderColor => const Color.fromARGB(255, 206, 72, 68);

  @override
  Color get infoTextColor => const Color.fromARGB(255, 91, 192, 222);
  @override
  Color get infoBackgroundColor => const Color.fromARGB(255, 217, 237, 247);
  @override
  Color get infoBorderColor => const Color.fromARGB(255, 89, 115, 135);

  @override
  Color get warningTextColor => const Color.fromARGB(255, 199, 144, 50);
  @override
  Color get warningBackgroundColor => const Color.fromARGB(255, 252, 248, 227);
  @override
  Color get warningBorderColor => const Color.fromARGB(255, 170, 103, 8);

  @override
  Color get successTextColor => const Color.fromARGB(255, 62, 168, 64);
  @override
  Color get successBackgroundColor => const Color.fromARGB(255, 223, 240, 216);
  @override
  Color get successBorderColor => const Color.fromARGB(255, 60, 118, 61);
}

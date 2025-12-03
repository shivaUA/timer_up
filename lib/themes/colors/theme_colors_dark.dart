import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors/i_theme_colors.dart';

final class ThemeColorsDark implements IThemeColors {
  @override
  Color get primaryColor => const Color.fromRGBO(203, 168, 214, 1);
  @override
  Color get secondaryColor => const Color.fromRGBO(108, 54, 51, 1);
  @override
  Color get tertiaryColor => const Color.fromRGBO(175, 141, 85, 1);

  @override
  Color get primaryBackgroundColor => const Color.fromRGBO(21, 11, 24, 1);
  @override
  Color get secondaryBackgroundColor => const Color.fromRGBO(28, 19, 31, 1);
  @override
  Color get tertiaryBackgroundColor => const Color.fromRGBO(47, 24, 32, 1);

  @override
  Color get textPrimaryColor => const Color.fromRGBO(236, 224, 240, 1);
  @override
  Color get textSecondaryColor => const Color.fromRGBO(236, 224, 240, .6);
  @override
  Color get textTertiaryColor => const Color.fromRGBO(175, 141, 85, .6);

  @override
  Color get borderPrimaryColor => const Color.fromRGBO(45, 36, 48, 1);
  @override
  Color get borderSecondaryColor => const Color.fromRGBO(53, 42, 55, 1);
  @override
  Color get borderTertiaryColor => const Color.fromRGBO(175, 141, 85, .3);

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

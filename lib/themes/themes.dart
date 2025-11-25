import 'package:flutter/material.dart';

class AppTheme {
  static const String _fontFamily = "Inter";

  final ThemeData theme;
  final ColorsData colors;

  AppTheme(this.theme, this.colors);

  factory AppTheme.combine(ThemeType type) {
    return type == ThemeType.dark ? AppTheme.dark() : AppTheme.light();
  }

  factory AppTheme.dark() {
    var colors = ColorsData.dark();
    var theme = _combineTheme(ThemeType.dark, colors);

    return AppTheme(theme, colors);
  }

  factory AppTheme.light() => throw UnimplementedError();

  static AppTheme of(BuildContext context) {
    var widget = context.findAncestorWidgetOfExactType<AppThemeContainer>();
    return widget!.themeData;
  }

  static ColorsData colorsOf(BuildContext context) {
    var widget = context.findAncestorWidgetOfExactType<AppThemeContainer>();
    return widget!.themeData.colors;
  }

  static ThemeData _combineTheme(ThemeType type, ColorsData colors) {
    var mainTheme = type == ThemeType.dark ? ThemeData.dark() : ThemeData.light();
    var supportTheme = type == ThemeType.dark ? ThemeData.light() : ThemeData.dark();
    var colorScheme = mainTheme.colorScheme;

    return mainTheme.copyWith(
      textTheme: mainTheme.textTheme.copyWith(
        bodySmall:
            mainTheme.textTheme.bodySmall?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
        bodyMedium:
            mainTheme.textTheme.bodyMedium?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
        bodyLarge:
            mainTheme.textTheme.bodyLarge?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 15.5,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 15.5,
            ),
        displaySmall:
            mainTheme.textTheme.displaySmall?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
        displayMedium:
            mainTheme.textTheme.displayMedium?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
        displayLarge:
            mainTheme.textTheme.displayLarge?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
        headlineSmall:
            mainTheme.textTheme.headlineSmall?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
        headlineMedium:
            mainTheme.textTheme.headlineMedium?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.5,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.5,
            ),
        headlineLarge:
            mainTheme.textTheme.headlineLarge?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
        labelSmall:
            mainTheme.textTheme.labelSmall?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 11.5,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 11.5,
            ),
        labelMedium:
            mainTheme.textTheme.labelMedium?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 13.5,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 13.5,
            ),
        labelLarge:
            mainTheme.textTheme.labelLarge?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 15.5,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.normal,
              fontSize: 15.5,
            ),
        titleSmall:
            mainTheme.textTheme.titleSmall?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
        titleMedium:
            mainTheme.textTheme.titleMedium?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
        titleLarge:
            mainTheme.textTheme.titleLarge?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
      ),
      scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
      chipTheme: supportTheme.chipTheme.copyWith(
        labelStyle:
            supportTheme.chipTheme.labelStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, color: colors.defaultTextColor),
      ),
      canvasColor: colors.canvasColor,
      primaryColor: colors.primaryColor,
      colorScheme: colorScheme.copyWith(onPrimary: Colors.amber),
      checkboxTheme: mainTheme.checkboxTheme.copyWith(
        side: const BorderSide(color: Colors.grey, style: BorderStyle.solid, width: 1.5),
        fillColor: const WidgetStatePropertyAll(Color.fromARGB(255, 70, 70, 70)),
      ),
      datePickerTheme: mainTheme.datePickerTheme.copyWith(
        todayForegroundColor: const WidgetStatePropertyAll(Colors.lightGreen),
        todayBackgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        yearStyle:
            mainTheme.datePickerTheme.yearStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.infoBackgroundColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, fontSize: 17, color: colors.infoBackgroundColor),
        dayStyle:
            mainTheme.datePickerTheme.dayStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.infoBackgroundColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, fontSize: 16),
        weekdayStyle:
            mainTheme.datePickerTheme.weekdayStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.infoBackgroundColor,
            ) ??
            TextStyle(
              fontFamily: _fontFamily,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: colors.infoBackgroundColor,
            ),
        headerHelpStyle:
            mainTheme.datePickerTheme.headerHelpStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, color: colors.defaultTextColor),
        headerHeadlineStyle:
            mainTheme.datePickerTheme.headerHeadlineStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, color: colors.defaultTextColor),
        rangePickerHeaderHelpStyle:
            mainTheme.datePickerTheme.rangePickerHeaderHelpStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, color: colors.defaultTextColor),
        rangePickerHeaderHeadlineStyle:
            mainTheme.datePickerTheme.rangePickerHeaderHeadlineStyle?.copyWith(
              fontFamily: _fontFamily,
              color: colors.defaultTextColor,
            ) ??
            TextStyle(fontFamily: _fontFamily, color: colors.defaultTextColor),
      ),
      inputDecorationTheme: mainTheme.inputDecorationTheme.copyWith(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: PredictiveBackPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class ColorsData {
  Color primaryColor;
  Color scaffoldBackgroundColor;
  Color canvasColor;
  Color appBarBackgroundColor;

  Color defaultTextColor;
  Color defaultTextColorDarker;
  Color defaultBackgroundColor;
  Color defaultBorderColor;
  Color defaultBorderColorDarker;

  Color errorTextColor;
  Color errorTextColorDarker;
  Color errorBackgroundColor;
  Color errorBorderColor;
  Color errorBorderColorDarker;

  Color infoTextColor;
  Color infoTextColorDarker;
  Color infoBackgroundColor;
  Color infoBorderColor;
  Color infoBorderColorDarker;

  Color warningTextColor;
  Color warningTextColorDarker;
  Color warningBackgroundColor;
  Color warningBorderColor;
  Color warningBorderColorDarker;

  Color successTextColor;
  Color successTextColorDarker;
  Color successBackgroundColor;
  Color successBorderColor;
  Color successBorderColorDarker;

  Color buttonGradientColor1;
  Color buttonGradientColor2;
  Color buttonGradientColor3;

  ColorsData({
    required this.primaryColor,
    required this.scaffoldBackgroundColor,
    required this.canvasColor,
    required this.appBarBackgroundColor,

    required this.defaultTextColor,
    required this.defaultTextColorDarker,
    required this.defaultBackgroundColor,
    required this.defaultBorderColor,
    required this.defaultBorderColorDarker,

    required this.errorTextColor,
    required this.errorTextColorDarker,
    required this.errorBackgroundColor,
    required this.errorBorderColor,
    required this.errorBorderColorDarker,

    required this.infoTextColor,
    required this.infoTextColorDarker,
    required this.infoBackgroundColor,
    required this.infoBorderColor,
    required this.infoBorderColorDarker,

    required this.warningTextColor,
    required this.warningTextColorDarker,
    required this.warningBackgroundColor,
    required this.warningBorderColor,
    required this.warningBorderColorDarker,

    required this.successTextColor,
    required this.successTextColorDarker,
    required this.successBackgroundColor,
    required this.successBorderColor,
    required this.successBorderColorDarker,

    required this.buttonGradientColor1,
    required this.buttonGradientColor2,
    required this.buttonGradientColor3,
  });

  factory ColorsData.dark() {
    return ColorsData(
      primaryColor: const Color(0xFF2697FF),
      scaffoldBackgroundColor: const Color(0xFF212332),
      canvasColor: const Color(0xFF2A2D3E),
      appBarBackgroundColor: const Color.fromARGB(255, 20, 18, 24),

      defaultTextColor: const Color(0xEFF6F6F6),
      defaultTextColorDarker: const Color.fromARGB(255, 51, 51, 51),
      defaultBackgroundColor: const Color.fromARGB(255, 247, 247, 249),
      defaultBorderColor: const Color.fromRGBO(200, 180, 180, 180),
      defaultBorderColorDarker: const Color.fromRGBO(52, 51, 67, 1),

      errorTextColor: const Color.fromARGB(255, 217, 83, 79),
      errorTextColorDarker: const Color.fromARGB(255, 169, 68, 66),
      errorBackgroundColor: const Color.fromARGB(255, 242, 222, 222),
      errorBorderColor: const Color.fromARGB(255, 206, 72, 68),
      errorBorderColorDarker: const Color.fromARGB(255, 133, 43, 41),

      infoTextColor: const Color.fromARGB(255, 91, 192, 222),
      infoTextColorDarker: const Color.fromARGB(255, 49, 112, 143),
      infoBackgroundColor: const Color.fromARGB(255, 217, 237, 247),
      infoBorderColor: const Color.fromARGB(255, 89, 115, 135),
      infoBorderColorDarker: const Color.fromARGB(255, 26, 81, 122),

      warningTextColor: const Color.fromARGB(255, 199, 144, 50),
      warningTextColorDarker: const Color.fromARGB(255, 138, 109, 59),
      warningBackgroundColor: const Color.fromARGB(255, 252, 248, 227),
      warningBorderColor: const Color.fromARGB(255, 170, 103, 8),
      warningBorderColorDarker: const Color.fromARGB(255, 128, 77, 6),

      successTextColor: const Color.fromARGB(255, 62, 168, 64),
      successTextColorDarker: const Color.fromARGB(255, 60, 118, 61),
      successBackgroundColor: const Color.fromARGB(255, 223, 240, 216),
      successBorderColor: const Color.fromARGB(255, 60, 118, 61),
      successBorderColorDarker: const Color.fromARGB(255, 24, 87, 25),

      buttonGradientColor1: const Color.fromRGBO(187, 63, 221, 1),
      buttonGradientColor2: const Color.fromRGBO(251, 109, 169, 1),
      buttonGradientColor3: const Color.fromRGBO(255, 159, 124, 1),
    );
  }
}

enum ThemeType { light, dark, custom }

class AppThemeContainer extends StatelessWidget {
  final AppTheme themeData;
  final Widget? child;

  const AppThemeContainer({required this.themeData, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child ?? SizedBox();
  }
}

import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors_data.dart';
import 'package:timer_up/themes/theme_type.dart';

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

  static AppTheme of(BuildContext context) => AppThemeContainer.of(context)!.themeData;

  static ColorsData colorsOf(BuildContext context) =>
      AppThemeContainer.of(context)!.themeData.colors;

  static ThemeData themeOf(BuildContext context) => AppThemeContainer.of(context)!.themeData.theme;

  static ThemeData _combineTheme(ThemeType type, ColorsData colors) {
    var mainTheme = type == ThemeType.dark ? ThemeData.dark() : ThemeData.light();
    var supportTheme = type == ThemeType.dark ? ThemeData.light() : ThemeData.dark();
    var colorScheme = mainTheme.colorScheme;

    return mainTheme.copyWith(
      textTheme: mainTheme.textTheme.copyWith(
        bodySmall: mainTheme.textTheme.bodySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        bodyMedium: mainTheme.textTheme.bodyMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyLarge: mainTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 15.5,
        ),
        displaySmall: mainTheme.textTheme.displaySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        displayMedium: mainTheme.textTheme.displayMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        displayLarge: mainTheme.textTheme.displayLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        headlineSmall: mainTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        headlineMedium: mainTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 16.5,
        ),
        headlineLarge: mainTheme.textTheme.headlineLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        labelSmall: mainTheme.textTheme.labelSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 11.5,
        ),
        labelMedium: mainTheme.textTheme.labelMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 13.5,
        ),
        labelLarge: mainTheme.textTheme.labelLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 15.5,
        ),
        titleSmall: mainTheme.textTheme.titleSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        titleMedium: mainTheme.textTheme.titleMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        titleLarge: mainTheme.textTheme.titleLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 21,
        ),
      ),
      scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
      chipTheme: supportTheme.chipTheme.copyWith(
        labelStyle: supportTheme.chipTheme.labelStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
        ),
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
        yearStyle: mainTheme.datePickerTheme.yearStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        dayStyle: mainTheme.datePickerTheme.dayStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        weekdayStyle: mainTheme.datePickerTheme.weekdayStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        headerHelpStyle: mainTheme.datePickerTheme.headerHelpStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
        ),
        headerHeadlineStyle: mainTheme.datePickerTheme.headerHeadlineStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
        ),
        rangePickerHeaderHelpStyle: mainTheme.datePickerTheme.rangePickerHeaderHelpStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
        ),
        rangePickerHeaderHeadlineStyle: mainTheme.datePickerTheme.rangePickerHeaderHeadlineStyle
            ?.copyWith(fontFamily: _fontFamily, color: colors.defaultTextColor),
      ),
      inputDecorationTheme: mainTheme.inputDecorationTheme.copyWith(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          //TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: PredictiveBackPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class AppThemeContainer extends StatelessWidget {
  final AppTheme themeData;
  final Widget? child;

  const AppThemeContainer({required this.themeData, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return child ?? SizedBox();
  }

  static AppThemeContainer? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppThemeContainer>();
}

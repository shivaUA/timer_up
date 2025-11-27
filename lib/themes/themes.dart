import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors_data.dart';
import 'package:timer_up/themes/theme_type.dart';

class AppTheme {
  static const String _fontFamily = "Inter";

  final ThemeData theme;
  final ColorsData colors;

  AppTheme(this.theme, this.colors);

  factory AppTheme.combine(ThemeType type) {
    return type == ThemeType.dark ? AppTheme._dark() : AppTheme._light();
  }

  factory AppTheme._dark() {
    var colors = ColorsData.dark();
    var theme = _combineTheme(ThemeType.dark, colors);

    return AppTheme(theme, colors);
  }

  factory AppTheme._light() => throw UnimplementedError();

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
        // BODY
        bodySmall: mainTheme.textTheme.bodySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
        bodyMedium: mainTheme.textTheme.bodyMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        bodyLarge: mainTheme.textTheme.bodyLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 21,
        ),
        // DISPLAY
        displaySmall: mainTheme.textTheme.displaySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 36,
        ),
        displayMedium: mainTheme.textTheme.displayMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 45,
        ),
        displayLarge: mainTheme.textTheme.displayLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 57,
        ),
        // HEADLINE
        headlineSmall: mainTheme.textTheme.headlineSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headlineMedium: mainTheme.textTheme.headlineMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        headlineLarge: mainTheme.textTheme.headlineLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        // LABEL
        labelSmall: mainTheme.textTheme.labelSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        labelMedium: mainTheme.textTheme.labelMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        labelLarge: mainTheme.textTheme.labelLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        // TITLE
        titleSmall: mainTheme.textTheme.titleSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        titleMedium: mainTheme.textTheme.titleMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleLarge: mainTheme.textTheme.titleLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.defaultTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 22,
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
      colorScheme: colorScheme.copyWith(onPrimary: colors.secondaryColor),
      checkboxTheme: mainTheme.checkboxTheme.copyWith(
        side: BorderSide(color: colors.tertiaryColor, style: BorderStyle.solid, width: 1.5),
        fillColor: WidgetStatePropertyAll(colors.tertiaryColor.withAlpha(70)),
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

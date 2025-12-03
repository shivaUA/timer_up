import 'package:flutter/material.dart';
import 'package:timer_up/themes/colors/i_theme_colors.dart';
import 'package:timer_up/themes/theme_type.dart';

class AppTheme {
  static const String _fontFamily = "Inter";

  final ThemeData theme;
  final IThemeColors colors;

  AppTheme(this.theme, this.colors);

  factory AppTheme.combine(ThemeType type) {
    var colors = IThemeColors.combine(type);
    var themeData = type == ThemeType.dark ? ThemeData.dark() : ThemeData.light();
    var theme = _combineTheme(themeData, colors);

    return AppTheme(theme, colors);
  }

  static AppTheme of(BuildContext context) => AppThemeContainer.of(context)!.themeData;

  static IThemeColors colorsOf(BuildContext context) =>
      AppThemeContainer.of(context)!.themeData.colors;

  static ThemeData themeOf(BuildContext context) => AppThemeContainer.of(context)!.themeData.theme;

  static ThemeData _combineTheme(ThemeData theme, IThemeColors colors) {
    var colorScheme = theme.colorScheme;

    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        // BODY
        bodySmall: theme.textTheme.bodySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
        bodyMedium: theme.textTheme.bodyMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        bodyLarge: theme.textTheme.bodyLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 21,
        ),
        // DISPLAY
        displaySmall: theme.textTheme.displaySmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 36,
        ),
        displayMedium: theme.textTheme.displayMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 45,
        ),
        displayLarge: theme.textTheme.displayLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 57,
        ),
        // HEADLINE
        headlineSmall: theme.textTheme.headlineSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headlineMedium: theme.textTheme.headlineMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        headlineLarge: theme.textTheme.headlineLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        // LABEL
        labelSmall: theme.textTheme.labelSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        labelMedium: theme.textTheme.labelMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        labelLarge: theme.textTheme.labelLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        // TITLE
        titleSmall: theme.textTheme.titleSmall?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        titleMedium: theme.textTheme.titleMedium?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleLarge: theme.textTheme.titleLarge?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
      ),
      scaffoldBackgroundColor: colors.primaryBackgroundColor,
      chipTheme: theme.chipTheme.copyWith(
        labelStyle: theme.chipTheme.labelStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
        ),
      ),
      canvasColor: colors.secondaryBackgroundColor,
      primaryColor: colors.primaryColor,
      colorScheme: colorScheme.copyWith(onPrimary: colors.secondaryColor),
      checkboxTheme: theme.checkboxTheme.copyWith(
        side: BorderSide(color: colors.tertiaryColor, style: BorderStyle.solid, width: 1.5),
        fillColor: WidgetStatePropertyAll(colors.tertiaryColor.withAlpha(70)),
      ),
      datePickerTheme: theme.datePickerTheme.copyWith(
        todayForegroundColor: const WidgetStatePropertyAll(Colors.lightGreen),
        todayBackgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        yearStyle: theme.datePickerTheme.yearStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        dayStyle: theme.datePickerTheme.dayStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        weekdayStyle: theme.datePickerTheme.weekdayStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.infoBackgroundColor,
        ),
        headerHelpStyle: theme.datePickerTheme.headerHelpStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
        ),
        headerHeadlineStyle: theme.datePickerTheme.headerHeadlineStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
        ),
        rangePickerHeaderHelpStyle: theme.datePickerTheme.rangePickerHeaderHelpStyle?.copyWith(
          fontFamily: _fontFamily,
          color: colors.textPrimaryColor,
        ),
        rangePickerHeaderHeadlineStyle: theme.datePickerTheme.rangePickerHeaderHeadlineStyle
            ?.copyWith(fontFamily: _fontFamily, color: colors.textPrimaryColor),
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
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

/// Type of the theme for UI
enum ThemeType {
  /// Light theme
  light(1),

  /// Dark theme
  dark(2);

  const ThemeType(this.value);
  final int value;
}

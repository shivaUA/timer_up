/// Formatof the time to use everywhere in the app
enum TimeFormat {
  /// 12-hour time format with AM / PM
  h12(1),

  /// 24-hour time format
  h24(2);

  const TimeFormat(this.value);
  final int value;
}

import 'dart:ui';

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
    );
  }
}

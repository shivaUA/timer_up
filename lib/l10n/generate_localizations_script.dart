import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  print("📁 Generating localizations....");

  /// Describes the arguments to generate localizations
  ///
  final localizations = [
    //* COMMON
    {
      'arbDir': 'lib/l10n/translations/common',
      'templateArb': 'common_en.arb',
      'outputFile': 'common_localizations.dart',
      'outputDir': 'lib/l10n/generated/common',
      'untranslatedFile': 'lib/l10n/generated/common/untranslated.json',
      'outputClass': 'CommonLocalizations'
    },

    //* SYSTEM
    {
      'arbDir': 'lib/l10n/translations/system',
      'templateArb': 'system_en.arb',
      'outputFile': 'system_localizations.dart',
      'outputDir': 'lib/l10n/generated/system',
      'untranslatedFile': 'lib/l10n/generated/system/untranslated.json',
      'outputClass': 'SystemLocalizations'
    },
  ];

  if (Platform.isWindows) {
    var result = await Process.start('powershell', []);
    result.stdout.transform(utf8.decoder).forEach(print);
    result.stderr.transform(utf8.decoder).forEach(print);

    for (final loc in localizations) {
      print("Adding ${loc['outputClass']} ⚙️");

      result.stdin.writeln("flutter gen-l10n" +
          ' --arb-dir=${loc['arbDir']}' +
          ' --template-arb-file=${loc['templateArb']}' +
          ' --output-localization-file=${loc['outputFile']}' +
          ' --output-dir=${loc['outputDir']}' +
          ' --untranslated-messages-file=${loc['untranslatedFile']}' +
          ' --no-synthetic-package' +
          ' --output-class=${loc['outputClass']}');
    }

    result.stdin.writeln("exit(0)");
    var code = await result.exitCode;

    if (code != 0) {
      print('Error generating localizations, please check error messages.');
    } else {
      print('✅ Localizations generated!');
    }
  } else {
    for (final loc in localizations) {
      print("Generating ${loc['outputClass']} ⚙️");

      final result = await Process.run('flutter', [
        'gen-l10n',
        '--arb-dir=${loc['arbDir']}',
        '--template-arb-file=${loc['templateArb']}',
        '--output-localization-file=${loc['outputFile']}',
        '--output-dir=${loc['outputDir']}',
        '--untranslated-messages-file=${loc['untranslatedFile']}',
        '--no-synthetic-package',
        '--output-class=${loc['outputClass']}'
      ]);

      if (result.exitCode != 0) {
        print('Error generating ${loc['outputClass']}: ${result.stderr}');
        exit(1);
      }

      print('➡️  ${loc['outputClass']} generated successfully');
    }

    print('✅ All localizations generated successfully!');
  }
}

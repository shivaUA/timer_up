// ignore_for_file: avoid_print

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
      'outputClass': 'CommonLocalizations',
    },

    //* CORE
    {
      'arbDir': 'lib/l10n/translations/core',
      'templateArb': 'core_en.arb',
      'outputFile': 'core_localizations.dart',
      'outputDir': 'lib/l10n/generated/core',
      'untranslatedFile': 'lib/l10n/generated/core/untranslated.json',
      'outputClass': 'CoreLocalizations',
    },
  ];

  if (Platform.isWindows) {
    var result = await Process.start('powershell', []);
    result.stdout.transform(utf8.decoder).forEach(print);
    result.stderr.transform(utf8.decoder).forEach(print);

    for (final loc in localizations) {
      print("Adding ${loc['outputClass']} ⚙️");

      result.stdin.writeln(
        'flutter gen-l10n'
        ' --arb-dir=${loc['arbDir']}'
        ' --template-arb-file=${loc['templateArb']}'
        ' --output-localization-file=${loc['outputFile']}'
        ' --output-dir=${loc['outputDir']}'
        ' --untranslated-messages-file=${loc['untranslatedFile']}'
        ' --no-synthetic-package'
        ' --output-class=${loc['outputClass']}',
      );
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
        '--output-class=${loc['outputClass']}',
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

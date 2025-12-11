// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// L10nMapperGenerator
// **************************************************************************

import 'package:timer_up/l10n/generated/common/common_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  CommonLocalizations get _localizations => CommonLocalizations.of(this)!;
  CommonLocalizations get l10n => _localizations;
  Locale get locale => Localizations.localeOf(this);
  String parseL10n(String translationKey, {List<Object>? arguments}) {
    final localizations = CommonLocalizations.of(this)!;
    return L10nHelper.parseL10n(
      localizations,
      translationKey,
      arguments: arguments,
    );
  }
}

extension CommonLocalizationsExtension on CommonLocalizations {
  String parseL10n(String translationKey, {List<Object>? arguments}) {
    return L10nHelper.parseL10n(this, translationKey, arguments: arguments);
  }
}

class L10nHelper {
  static String parseL10n(
    CommonLocalizations localizations,
    String translationKey, {
    List<Object>? arguments,
  }) {
    const mapper = CommonLocalizationsMapper();
    final object = mapper.toLocalizationMap(localizations)[translationKey];
    if (object == null) return 'Translation key not found!';
    if (object is String) return object;
    assert(arguments != null, 'Arguments should not be null!');
    assert(arguments!.isNotEmpty, 'Arguments should not be empty!');
    return Function.apply(object, arguments);
  }
}

class CommonLocalizationsMapper {
  const CommonLocalizationsMapper();
  Map<String, dynamic> toLocalizationMap(CommonLocalizations localizations) {
    return {
      'localeName': localizations.localeName,
      'common_language': localizations.common_language,
      'common_create': localizations.common_create,
      'common_refresh': localizations.common_refresh,
      'common_edit': localizations.common_edit,
      'common_delete': localizations.common_delete,
      'common_ok': localizations.common_ok,
      'common_close': localizations.common_close,
      'common_cancel': localizations.common_cancel,
      'common_save': localizations.common_save,
      'common_saveAndClose': localizations.common_saveAndClose,
      'common_active': localizations.common_active,
      'common_name': localizations.common_name,
      'common_sortOrder': localizations.common_sortOrder,
      'common_description': localizations.common_description,
      'common_select': localizations.common_select,
      'common_yes': localizations.common_yes,
      'common_no': localizations.common_no,
      'common_title': localizations.common_title,
      'common_text': localizations.common_text,
      'common_date': localizations.common_date,
    };
  }
}

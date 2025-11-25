// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'system_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SystemLocalizationsEn extends SystemLocalizations {
  SystemLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get languages_nameValidation => 'Enter a language name';

  @override
  String get languages_cultureCode => 'Culture code';

  @override
  String get languages_cultureCodeValidation => 'Enter a culture code (e.g. en-US)';

  @override
  String get languages_default => 'Default';

  @override
  String get languages_editContentIfInactive => 'Edit content if inactive';

  @override
  String get languages_deleteLanguage => 'Delete language';

  @override
  String languages_deleteLanguageMessage(String name) {
    return 'You are about to delete a language \"$name\". Are you sure you want to proceed?';
  }

  @override
  String get languages_savedMessage => 'Language saved successfully';

  @override
  String get languages_editLanguage => 'Edit language';

  @override
  String get languages_createLanguage => 'Create language';

  @override
  String get tags_deleteTag => 'Delete tag';

  @override
  String tags_deleteTagMessage(String text) {
    return 'You are about to delete a tag \"$text\". Are you sure you want to proceed?';
  }

  @override
  String get tags_savedMessage => 'Tag saved successfully';

  @override
  String get tags_tagDetails => 'Tag details';

  @override
  String get tags_editTag => 'Edit tag';

  @override
  String get tags_createTag => 'Create tag';

  @override
  String get tags_loadErrorMessage => 'Tag details are not loaded.\r\nPlease try again.';

  @override
  String get interests_favoritesCount => 'Favorites count';

  @override
  String get interests_showDuringOnboarding => 'Show during onboarding';

  @override
  String get interests_deleteInterest => 'Delete interest';

  @override
  String interests_deleteInterestMessage(String text) {
    return 'You are about to delete a interest \"$text\". Are you sure you want to proceed?';
  }

  @override
  String get interests_savedMessage => 'Interest saved successfully';

  @override
  String get interests_interestDetails => 'Interest details';

  @override
  String get interests_editInterest => 'Edit interest';

  @override
  String get interests_createInterest => 'Create interest';

  @override
  String get interests_loadErrorMessage => 'Interest details are not loaded.\r\nPlease try again.';

  @override
  String get resourceStrings_translations => 'Translations';

  @override
  String get resourceStrings_deleteResourceString => 'Delete resource string';

  @override
  String resourceStrings_deleteResourceStringMessage(String key) {
    return 'You are about to delete a resource string \"$key\".\nAre you sure you want to proceed?';
  }

  @override
  String get resourceStrings_savedMessage => 'Resource saved successfully';

  @override
  String get resourceStrings_resourceStringDetails => 'Resource string details';

  @override
  String get resourceStrings_editResourceString => 'Edit resource string';

  @override
  String get resourceStrings_createResourceString => 'Create resource string';

  @override
  String get resourceStrings_loadErrorMessage => 'Resource string details are not loaded.\r\nPlease try again.';
}

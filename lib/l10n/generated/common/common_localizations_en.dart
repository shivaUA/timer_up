// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'common_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CommonLocalizationsEn extends CommonLocalizations {
  CommonLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_language => 'Language';

  @override
  String get common_create => 'Create';

  @override
  String get common_refresh => 'Refresh';

  @override
  String get common_edit => 'Edit';

  @override
  String get common_delete => 'Delete';

  @override
  String get common_email => 'E-mail';

  @override
  String get common_emailValidation => 'Enter a valid E-mail address';

  @override
  String get common_userName => 'Username';

  @override
  String get common_ok => 'OK';

  @override
  String get common_close => 'Close';

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_save => 'Save';

  @override
  String get common_saveAndClose => 'Save and close';

  @override
  String get common_active => 'Active';

  @override
  String get common_name => 'Name';

  @override
  String get common_sortOrder => 'Sort order';

  @override
  String get common_modifiedAt => 'Modified at';

  @override
  String get common_description => 'Description';

  @override
  String get common_select => 'Select';

  @override
  String get common_yes => 'Yes';

  @override
  String get common_no => 'No';

  @override
  String get common_title => 'Title';

  @override
  String get common_picture => 'Picture';

  @override
  String get common_detailsPicture => 'Details picture';

  @override
  String get common_detailsPictures => 'Details picture';

  @override
  String get common_text => 'Text';

  @override
  String get common_date => 'Date';

  @override
  String get common_import => 'Import';

  @override
  String get common_key => 'Key';

  @override
  String get common_keyValidation => 'Specify a key';

  @override
  String get common_number => 'Number';

  @override
  String get common_sortOrderValidation => 'Please enter a number from -32768 to 32767';

  @override
  String get network_dioExceptions_cancel => 'Request to the server was cancelled.';

  @override
  String get network_dioExceptions_connectionTimeout => 'Connection timed out.';

  @override
  String get network_dioExceptions_receiveTimeout => 'Receiving timeout occurred.';

  @override
  String get network_dioExceptions_sendTimeout => 'Request send timeout.';

  @override
  String get network_dioExceptions_noInternet => 'No Internet.';

  @override
  String get network_dioExceptions_unexpectedError => 'Unexpected error occurred.';

  @override
  String get network_httpStatuses_400 => 'Provided request data is not correct.';

  @override
  String get network_httpStatuses_401 => 'Session expired, please login again.';

  @override
  String get network_httpStatuses_403 => 'The authenticated user is not allowed to access the specified API endpoint.';

  @override
  String get network_httpStatuses_404 => 'The requested resource does not exist.';

  @override
  String get network_httpStatuses_405 => 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';

  @override
  String get network_httpStatuses_406 => 'Operation was denied. Please check the data and be sure you are attempting the right action.';

  @override
  String get network_httpStatuses_415 => 'Unsupported media type. The requested content type or version number is invalid.';

  @override
  String get network_httpStatuses_422 => 'Data validation failed.';

  @override
  String get network_httpStatuses_429 => 'Too many requests.';

  @override
  String get network_httpStatuses_500 => 'Internal server error.';

  @override
  String get network_httpStatuses_general => 'Oops something went wrong!';

  @override
  String get textEditor_dialog_fullScreen => 'Edit text';

  @override
  String get textEditor_dialog_code => 'Edit markdown code';

  @override
  String get textEditor_toolbar_fullScreen => 'Open full-screen editor';

  @override
  String get textEditor_toolbar_code => 'Open code editor';

  @override
  String get editors_date_dialogTitle => 'Select Date';

  @override
  String get editors_date_validation => 'Select a valid date';

  @override
  String get editors_dateTime_dialogTitle => 'Select Date & Time';

  @override
  String get editors_dateTime_validation => 'Select a valid date and time';

  @override
  String get editors_time_hour => 'Hour';

  @override
  String get editors_time_minute => 'Minute';

  @override
  String get editors_time_second => 'Second';

  @override
  String editors_time_validation(String min, String max) {
    return 'Value must be between \"$min\" and \"$max\"';
  }

  @override
  String editors_languageRows_validation(String languageName) {
    return 'Enter value for \"$languageName\"';
  }

  @override
  String editors_languageTabs_validation(String fieldName) {
    return 'Please enter \"$fieldName\"';
  }

  @override
  String get import_inserted => 'Inserted';

  @override
  String get import_updated => 'Updated';

  @override
  String get import_deleted => 'Deleted';

  @override
  String get routes_dashboard => 'Dashboard';

  @override
  String get routes_login => 'Login';

  @override
  String get routes_users => 'Users';

  @override
  String get routes_roles => 'Roles';

  @override
  String get routes_accessRules => 'Access rules';

  @override
  String get routes_tags => 'Tags';

  @override
  String get routes_resourceStrings => 'Resource strings';

  @override
  String get routes_interests => 'Interests';

  @override
  String get routes_languages => 'Languages';

  @override
  String get routes_stems => 'Stems';

  @override
  String get routes_dailyEnergy => 'Daily energy';

  @override
  String get routes_products => 'Products';

  @override
  String get routes_ecommerceStatistics => 'Ecommerce statistics';

  @override
  String get routes_sections => 'Sections';

  @override
  String get routes_categories => 'Categories';

  @override
  String get routes_programs => 'Programs';

  @override
  String get routes_doctors => 'Doctors';

  @override
  String get routes_messageTemplates => 'Message templates';

  @override
  String get routes_notificationMessages => 'Notification messages';

  @override
  String get routes_moonPhases => 'Moon phases';

  @override
  String get routes_zodiacSigns => 'Zodiac signs';

  @override
  String get routes_actions => 'Actions';

  @override
  String get routes_recommendations => 'Recommendations';

  @override
  String get routes_daily_rituals => 'Rituals';

  @override
  String get routes_daily_rituals_days => 'Ritual days';

  @override
  String get routes_daily_rituals_categories => 'Ritual categories';

  @override
  String get mainMenu_sections_programs => 'Programs';

  @override
  String get mainMenu_sections_auth => 'Auth';

  @override
  String get mainMenu_sections_bazi => 'BaZi';

  @override
  String get mainMenu_sections_store => 'Store';

  @override
  String get mainMenu_sections_messaging => 'Messaging';

  @override
  String get mainMenu_sections_moonPhases => 'Moon Phases';

  @override
  String get mainMenu_sections_system => 'System';

  @override
  String get mainMenu_sections_daily => 'Daily';

  @override
  String get autoTable_actionUnavailable => 'This action is not available';

  @override
  String get autoTable_searchPlaceholder => 'Type at least 3 characters to search...';

  @override
  String get autoTable_searchButton => 'Tap to search';

  @override
  String get autoTable_searchCancelButton => 'Tap to cancel current search';

  @override
  String get autoTable_noData => 'No records found for current filters';

  @override
  String autoTable_searchResultsFor(String searchPhrase) {
    return 'Search results for request: \"$searchPhrase\"';
  }

  @override
  String get autoTable_openMenu => 'Open menu';
}

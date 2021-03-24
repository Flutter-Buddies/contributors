import 'package:contributors/src/app/utils/contributors_translations.dart';
import 'package:flutter/cupertino.dart';

/// [Utils] is a utility class useful for a lot of things that are not related,
/// but also not worth creating a separate class for.
/// We can say it is the miscellaneous functionality class.
class Utils {
  /// [getCurrentTranslation] returns a [ContributorsTranslation] class if you
  /// provide a [Locale].
  /// The `locale` is required.
  /// If no `locale` matching the provided one is found the method returns
  /// English language constructor from [ContributorsTranslation] class.
  static ContributorsTranslation getCurrentTranslation(
    Locale locale,
  ) {
    if (locale == null) {
      return ContributorsTranslation.en();
    } else {
      switch (locale.languageCode) {
        case 'en':
          return ContributorsTranslation.en();
        case 'ar':
          return ContributorsTranslation.ar();
        default:
          return ContributorsTranslation.en();
      }
    }
  }
}

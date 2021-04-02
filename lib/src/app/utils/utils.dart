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
    List<ContributorsTranslation> translations,
  ) {
    if (locale == null) {
      return ContributorsTranslation.en();
    } else {
      if (translations.isEmpty) {
        switch (locale.languageCode) {
          case 'en':
            return ContributorsTranslation.en();
          case 'ar':
            return ContributorsTranslation.ar();
          case 'cs':
            return ContributorsTranslation.cs();
          default:
            return ContributorsTranslation.en();
        }
      } else {
        return translations.firstWhere(
          (ContributorsTranslation contributorsTranslation) =>
              contributorsTranslation.languageCode == locale.languageCode,
          orElse: () => ContributorsTranslation.en(),
        );
      }
    }
  }
}

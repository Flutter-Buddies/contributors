import 'package:contributors/src/app/utils/contributors_translations.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static ContributorsTranslation getCurrentTranslation(
    Locale locale,
  ) {
    if (locale == null) {
      return ContributorsTranslation.en();
    } else {
      switch (locale.languageCode) {
        case "en":
          return ContributorsTranslation.en();
        case "ar":
          return ContributorsTranslation.ar();
        default:
          return ContributorsTranslation.en();
      }
    }
  }
}

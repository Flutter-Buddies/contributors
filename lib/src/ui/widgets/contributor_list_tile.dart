import 'package:contributors/src/app/utils/contributors_translations.dart';
import 'package:contributors/src/app/utils/utils.dart';
import 'package:flutter/material.dart';

/// [ContributorListTile] is a widget used to show one contributor info when
/// using a [ListView] to show basic info about him and how many contributions
/// he/she did.
class ContributorListTile extends StatelessWidget {
  /// [imageUrl] is the image url for the contributor.
  final String imageUrl;

  /// [name] is the name of the contributor.
  final String name;

  /// [contributionsNumber] is the number of contributions of the contributor.
  final int contributionsNumber;

  /// [onTap] is the image url for the contributor.
  final void Function() onTap;

  /// [locale] is the [Locale] that you want the text to appear in.
  final Locale locale;

  /// [translations] is the `List<ContributorsTranslation>` you want to use, we
  /// have defaults but you can add custom ones here.
  /// This overrides the default supported languages which means you should add
  /// every language you want to support inside this list. The built-in
  /// translations are factory methods of [ContributorsTranslation].
  ///
  /// Example:
  ///
  /// * ContributorsTranslation.en()
  /// * ContributorsTranslation.ar()
  final List<ContributorsTranslation> translations;

  /// `ContributorListTile` is the default contructor for [ContributorListTile]
  const ContributorListTile({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.contributionsNumber,
    @required this.onTap,
    @required this.locale,
    @required this.translations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(
        '${Utils.getCurrentTranslation(locale, translations).contributions}: $contributionsNumber',
      ),
      onTap: onTap,
    );
  }
}

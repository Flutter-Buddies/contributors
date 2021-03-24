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

  /// `ContributorListTile` is the default contructor for [ContributorListTile]
  const ContributorListTile({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.contributionsNumber,
    @required this.onTap,
    @required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(
        '${Utils.getCurrentTranslation(locale).contributions}: $contributionsNumber',
      ),
      onTap: onTap,
    );
  }
}

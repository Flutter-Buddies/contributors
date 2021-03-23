import 'package:contributors/src/app/utils/utils.dart';
import 'package:flutter/material.dart';

class ContributorListTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int contributionsNumber;
  final void Function() onTap;
  final Locale locale;

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
        "${Utils.getCurrentTranslation(locale).contributions}: $contributionsNumber",
      ),
      onTap: onTap,
    );
  }
}

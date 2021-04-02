import 'package:flutter/material.dart';

/// [ContributorsInfoListTile] is a widget for showing a contributor stat
/// in a elegant way using a `ListTile`.
class ContributorsInfoListTile extends StatelessWidget {
  /// [icon] is the icon at the begginning of the `ListTile`
  final IconData icon;

  /// [title] is the title `String` of the `ListTile`
  final String title;

  /// [trailing] is the trailing `String` of the `ListTile`
  final String trailing;

  /// [onTap] is the on tap callback of the `ListTile`
  final void Function() onTap;

  /// [ContributorsInfoListTile] is the default constructor
  /// of `ContributorsInfoListTile`
  const ContributorsInfoListTile({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.trailing,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).textTheme.bodyText1.color,
        size: 25,
      ),
      title: MediaQuery.of(context).size.width <= 450
          ? null
          : FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class ContributorListTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int contributionsNumber;
  final void Function() onTap;

  const ContributorListTile({
    Key key,
    @required this.imageUrl,
    @required this.name,
    @required this.contributionsNumber,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(name),
      subtitle: Text(
        "Contributions: $contributionsNumber",
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class ContributorListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
        ),
      ),
      title: Text(
        "Baby Yoda",
      ),
      subtitle: Text(
        "Contributions: 15",
      ),
      onTap: () {
        print("Baby Yoda Tapped!");
        // TODO: go to contributor view
      },
    );
  }
}

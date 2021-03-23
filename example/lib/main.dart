import 'package:flutter/material.dart';
import 'package:contributors/contributors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContributorsView(
      ownerName: "Flutter-Buddies",
      repoName: "contributors",
      locale: Locale("en"), // try this for english language
      // locale: Locale("ar"), // try this for arabic language
    );
  }
}

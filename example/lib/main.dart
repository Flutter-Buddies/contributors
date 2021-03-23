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
    );
  }
}

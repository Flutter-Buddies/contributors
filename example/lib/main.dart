import 'package:flutter/material.dart';
import 'package:contributors_ui/contributors_ui.dart';

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
      ownerName: "YazeedAlKhalaf",
      repoName: "contributors_ui",
    );
  }
}

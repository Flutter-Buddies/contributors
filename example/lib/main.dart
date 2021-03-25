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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contributors Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReadyUI(),
                  ),
                );
              },
              child: Text("Ready UI"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CustomUI(),
                  ),
                );
              },
              child: Text("Custom UI"),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadyUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContributorsView(
        ownerName: "Flutter-Buddies",
        repoName: "contributors",
        locale: Locale("en"), // try this for english language
        // locale: Locale("ar"), // try this for arabic language
      ),
    );
  }
}

class CustomUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContributorsBuilderView(
        ownerName: "Flutter-Buddies",
        repoName: "contributors",
        locale: Locale("en"), // try this for english language
        // locale: Locale("ar"), // try this for arabic language
        builder: (
          BuildContext context,
          List<Contributor> contributors,
        ) {
          return ListView.builder(
            itemCount: contributors.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              final Contributor contributor = contributors[index];

              return Text(contributor.login);
            },
          );
        },
      ),
    );
  }
}

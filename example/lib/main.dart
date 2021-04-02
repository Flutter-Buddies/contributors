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
        repoName: "tic-tac-no",
        locale: Locale("en"), // try this for english language
        // locale: Locale("ar"), // try this for arabic language
        translations: const <ContributorsTranslation>[
          ContributorsTranslation(
            languageCode: 'es',
            contributions: 'Contribuciones',
            followers: 'Seguidores',
            following: 'Siguiendo',
            publicRepos: 'Reposiciones Públicas',
            publicGists: 'Gists Públicos',
            isRTL: false,
          ),
        ],
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
        repoName: "tic-tac-no",
        locale: Locale("en"), // try this for english language
        // locale: Locale("ar"), // try this for arabic language
        translations: const <ContributorsTranslation>[
          ContributorsTranslation(
            languageCode: 'es',
            contributions: 'Contribuciones',
            followers: 'Seguidores',
            following: 'Siguiendo',
            publicRepos: 'Reposiciones Públicas',
            publicGists: 'Gists Públicos',
            isRTL: false,
          ),
        ],
        builder: (
          BuildContext context,
          List<ContributorStatistics> contributorStatisticsList,
        ) {
          return ListView.builder(
            itemCount: contributorStatisticsList.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              final ContributorStatistics contributorStatistics =
                  contributorStatisticsList[index];

              return Container(
                color: index.isEven ? Colors.red : Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contributorStatistics.author.login,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: contributorStatistics.weeks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Text(
                                "Start: " +
                                    DateTime.fromMillisecondsSinceEpoch(
                                      contributorStatistics.weeks[index].start *
                                          1000,
                                    ).toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Commits: " +
                                    contributorStatistics.weeks[index].commits
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Additions: " +
                                    contributorStatistics.weeks[index].additions
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Deletions: " +
                                    contributorStatistics.weeks[index].deletions
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

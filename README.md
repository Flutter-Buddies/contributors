# Contributors

![Pub Version](https://img.shields.io/pub/v/contributors?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/flutter-buddies/contributors?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/flutter-buddies/contributors?style=for-the-badge)
![GitHub Pull Requests](https://img.shields.io/github/issues-pr/flutter-buddies/contributors?style=for-the-badge)

## Features 🎮

- 🎈 Ready to use UI for showing contributors.
- 😜 Builder widget for customizing the feel and look of the UI.
- 🚀 Data is directly from GitHub REST API v3.
- 🌐 Translations support!

## Usage 👷‍♂️

There are three sections for the usage:

1. [Ready UI](#Ready%20UI)
2. [Custom UI](#Custom%20UI)
3. [Translations](#Translations)

### Ready UI

To use the ready UI you just use the `ContributorsView` widget and fill the required properties.

Example:

```dart
import 'package:flutter/material.dart';
import 'package:contributors/contributors.dart';

class ReadyUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContributorsView(
        ownerName: "Flutter-Buddies",
        repoName: "contributors",
      ),
    );
  }
}
```

### Custom UI

To use the custom UI you just use the `ContributorsViewBuilder` widget and fill the required properties.

Example:

```dart
import 'package:flutter/material.dart';
import 'package:contributors/contributors.dart';

class CustomUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ContributorsBuilderView(
        ownerName: "Flutter-Buddies",
        repoName: "contributors",
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
```

### Translations

Our way of handling localization works with every app. You just need to provide the `Locale` to the `locale` property on the widget you are using from Contributors.

Currently we support:

- English (en)
- Arabic (ar)
- Czech (cs)

You can add more languages by specifying the `translations` property on the widget you use, examples below.

> Note that using `translations` requires you to add every language you want to use, even the factory methods of `ContributorsTranslation`.

Example (Ready UI):

```dart
import 'package:flutter/material.dart';
import 'package:contributors/contributors.dart';

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
        translations: <ContributorsTranslation>[
          ContributorsTranslation.en(),
          ContributorsTranslation.ar(),
          ContributorsTranslation.cs(),
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
```

Example (Custom UI):

```dart
import 'package:flutter/material.dart';
import 'package:contributors/contributors.dart';

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
        translations: <ContributorsTranslation>[
          ContributorsTranslation.en(),
          ContributorsTranslation.ar(),
          ContributorsTranslation.cs(),
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
```

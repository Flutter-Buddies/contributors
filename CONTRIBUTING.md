# Contribution Guidelines

## Code Style

Use [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) plugin that is in VS Code to format the code. We suggest enabling format on save option.

## Add support for a new language

If your language is Spanish:

- `languageName` => `Spanish`
- `languageCode` => `es`

To add a language follow the following steps:

- Fork this repository
- Create a branch from master with name add\_{YOUR_LANGUAGE_NAME}\_language, so for example add_arabic_language
- Append your language in `lib/src/app/utils/contributors_translations.dart` as a factory at the end of the file:

Before:

```dart
/// `English` language translation
factory ContributorsTranslation.en() {
  return const ContributorsTranslation(
    languageCode: 'en',
    contributions: 'Contributions',
    followers: 'Followers',
    following: 'Following',
    publicRepos: 'Public Repos',
    publicGists: 'Public Gists',
    isRTL: false,
  );
}

/// `Arabic` language translation
factory ContributorsTranslation.ar() {
  return const ContributorsTranslation(
    languageCode: 'ar',
    contributions: 'المساهمات',
    followers: 'المتابِعون',
    following: 'المتابَعون',
    publicRepos: 'المستودعات العامة',
    publicGists: 'المقتطفات العامة',
    isRTL: true,
  );
}
```

After:

```dart
/// `English` language translation
factory ContributorsTranslation.en() {
  return const ContributorsTranslation(
    languageCode: 'en',
    contributions: 'Contributions',
    followers: 'Followers',
    following: 'Following',
    publicRepos: 'Public Repos',
    publicGists: 'Public Gists',
    isRTL: false,
  );
}

/// `Arabic` language translation
factory ContributorsTranslation.ar() {
  return const ContributorsTranslation(
    languageCode: 'ar',
    contributions: 'المساهمات',
    followers: 'المتابِعون',
    following: 'المتابَعون',
    publicRepos: 'المستودعات العامة',
    publicGists: 'المقتطفات العامة',
    isRTL: true,
  );
}

/// `languageName` language translation
factory ContributorsTranslation.languageCode() {
  return const ContributorsTranslation(
    languageCode: 'languageCode',
    contributions: '',
    followers: '',
    following: '',
    publicRepos: '',
    publicGists: '',
    isRTL: false, // depends on your language
  );
}
```

- Append your language to the switch statement in `lib/src/app/utils/utils.dart`:

Before:

```dart
static ContributorsTranslation getCurrentTranslation(
  Locale locale,
  List<ContributorsTranslation> translations,
) {
  if (locale == null) {
    return ContributorsTranslation.en();
  } else {
    if (translations.isEmpty) {
      switch (locale.languageCode) {
        case 'en':
          return ContributorsTranslation.en();
        case 'ar':
          return ContributorsTranslation.ar();
        default:
          return ContributorsTranslation.en();
      }
    } else {
      return translations.firstWhere(
        (ContributorsTranslation contributorsTranslation) =>
            contributorsTranslation.languageCode == locale.languageCode,
        orElse: () => ContributorsTranslation.en(),
      );
    }
  }
}
```

After:

```dart
static ContributorsTranslation getCurrentTranslation(
  Locale locale,
  List<ContributorsTranslation> translations,
) {
  if (locale == null) {
    return ContributorsTranslation.en();
  } else {
    if (translations.isEmpty) {
      switch (locale.languageCode) {
        case 'en':
          return ContributorsTranslation.en();
        case 'ar':
          return ContributorsTranslation.ar();
        case 'languageCode':
          return ContributorsTranslation.ar();
        default:
          return ContributorsTranslation.languageCode();
      }
    } else {
      return translations.firstWhere(
        (ContributorsTranslation contributorsTranslation) =>
            contributorsTranslation.languageCode == locale.languageCode,
        orElse: () => ContributorsTranslation.en(),
      );
    }
  }
}
```

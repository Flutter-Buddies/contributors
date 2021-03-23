import 'package:flutter/material.dart';

class ContributorsTranslation {
  final String languageCode;
  final String contributions;
  final String followers;
  final String following;
  final String publicRepos;
  final String publicGists;
  final bool isRTL;

  const ContributorsTranslation({
    @required this.languageCode,
    @required this.contributions,
    @required this.followers,
    @required this.following,
    @required this.publicRepos,
    @required this.publicGists,
    @required this.isRTL,
  });

  factory ContributorsTranslation.en() {
    return ContributorsTranslation(
      languageCode: "en",
      contributions: "Contributions",
      followers: "Followers",
      following: "Following",
      publicRepos: "Public Repos",
      publicGists: "Public Gists",
      isRTL: false,
    );
  }

  factory ContributorsTranslation.ar() {
    return ContributorsTranslation(
      languageCode: "ar",
      contributions: "المساهمات",
      followers: "المتابِعون",
      following: "المتابَعون",
      publicRepos: "المستودعات العامة",
      publicGists: "المقتطفات العامة",
      isRTL: true,
    );
  }
}

import 'dart:async';

import 'package:contributors/src/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:stacked/stacked.dart';

import 'package:contributors/src/ui/widgets/contributor_list_tile.dart';

import 'contributors_view_model.dart';

class ContributorsView extends StatelessWidget {
  final String ownerName;
  final String repoName;
  final Locale locale;

  const ContributorsView({
    Key key,
    @required this.ownerName,
    @required this.repoName,
    this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorsViewModel>.reactive(
      viewModelBuilder: () => ContributorsViewModel(),
      onModelReady: (ContributorsViewModel model) {
        model.getContributorsStream(
          ownerName: ownerName,
          repoName: repoName,
        );
      },
      builder: (
        BuildContext context,
        ContributorsViewModel model,
        Widget child,
      ) {
        return Directionality(
          textDirection: Utils.getCurrentTranslation(locale).isRTL
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            body: StreamBuilder<List<Contributor>>(
              stream: model.contributorsController.stream,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Contributor>> snapshot,
              ) {
                final List<Contributor> contributorsList = snapshot.data;

                if (contributorsList == null || contributorsList.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: contributorsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Contributor contributor = contributorsList[index];

                    return ContributorListTile(
                      imageUrl: contributor.avatarUrl,
                      name: contributor.login,
                      contributionsNumber: contributor.contributions,
                      locale: locale,
                      onTap: () async {
                        await model.navigateToContributorView(
                          context: context,
                          contributor: contributor,
                          ownerName: ownerName,
                          repoName: repoName,
                          locale: locale,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

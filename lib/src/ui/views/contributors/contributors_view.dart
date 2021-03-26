import 'package:contributors/src/ui/views/contributors_builder/contributors_builder_view.dart';
import 'package:flutter/material.dart' show ListTile;
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:stacked/stacked.dart';

import 'package:contributors/src/app/utils/utils.dart';
import 'package:contributors/src/ui/widgets/contributor_list_tile.dart';

import 'contributors_view_model.dart';

/// [ContributorsView] is the ready to use UI that lists all contributors of
/// provided repository, ([ownerName]/[repoName]), showing there Name, Avatar,
/// and Contributions Number in a [ListTile].
class ContributorsView extends StatelessWidget {
  /// [ownerName] is the name of the owner of [repoName].
  final String ownerName;

  /// [repoName] is repo name that the contributor contributed to.
  final String repoName;

  /// [locale] is the [Locale] that you want the text to appear in.
  final Locale locale;

  /// `ContributorsView` is the default contructor for [ContributorsView].
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
            body: ContributorsBuilderView(
              repoName: repoName,
              ownerName: ownerName,
              locale: locale,
              builder: (
                BuildContext context,
                List<ContributorStatistics> contributorStatisticsList,
              ) {
                return ListView.builder(
                  itemCount: contributorStatisticsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ContributorStatistics contributorStatistics =
                        contributorStatisticsList[index];
                    final User user = contributorStatistics.author;

                    return ContributorListTile(
                      imageUrl: user.avatarUrl,
                      name: user.login,
                      contributionsNumber: contributorStatistics.total,
                      locale: locale,
                      onTap: () async {
                        await model.navigateToContributorView(
                          context: context,
                          contributorStatistics: contributorStatistics,
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

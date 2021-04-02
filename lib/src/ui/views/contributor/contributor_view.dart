import 'package:contributors/src/app/utils/contributors_translations.dart';
import 'package:contributors/src/app/utils/utils.dart';
import 'package:contributors/src/ui/views/contributor/widgets/info_list_tile.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:stacked/stacked.dart';

import './contributor_view_model.dart';

/// [ContributorView] is the ready to use UI that lists one contributor
/// with their Name, Bio, Contributions Number, and more stats.
class ContributorView extends StatelessWidget {
  /// [contributor] provides info about the contributor.
  final ContributorStatistics contributorStatistics;

  /// [repoName] is repo name that the contributor contributed to.
  final String repoName;

  /// [ownerName] is the name of the owner of [repoName].
  final String ownerName;

  /// [locale] is the [Locale] that you want the text to appear in.
  final Locale locale;

  /// [translations] is the `List<ContributorsTranslation>` you want to use, we
  /// have defaults but you can add custom ones here.
  /// This overrides the default supported languages which means you should add
  /// every language you want to support inside this list. The built-in
  /// translations are factory methods of [ContributorsTranslation].
  ///
  /// Example:
  ///
  /// * ContributorsTranslation.en()
  /// * ContributorsTranslation.ar()
  final List<ContributorsTranslation> translations;

  /// `ContributorView` is the default contructor for [ContributorView]
  const ContributorView({
    Key key,
    @required this.contributorStatistics,
    @required this.repoName,
    @required this.ownerName,
    @required this.locale,
    @required this.translations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorViewModel>.reactive(
      viewModelBuilder: () => ContributorViewModel(),
      onModelReady: (ContributorViewModel model) async {
        await model.init(
          userLoginName: contributorStatistics.author.login,
        );
      },
      builder: (
        BuildContext context,
        ContributorViewModel model,
        Widget child,
      ) {
        return Directionality(
          textDirection: Utils.getCurrentTranslation(locale, translations).isRTL
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(),
            body: model.user != null
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                contributorStatistics.author.avatarUrl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          model.user.name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                model.user.bio,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ContributorsInfoListTile(
                                icon: Icons.format_list_numbered_rounded,
                                title:
                                    '${Utils.getCurrentTranslation(locale, translations).contributions} ($ownerName/$repoName)',
                                trailing:
                                    contributorStatistics.total.toString(),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(right: 25),
                          height: 150,
                          child: LineChart(
                            LineChartData(
                              lineBarsData: <LineChartBarData>[
                                LineChartBarData(
                                  show: true,
                                  spots: contributorStatistics.weeks
                                      .map((ContributorWeekStatistics week) {
                                    return FlSpot(
                                      contributorStatistics.weeks
                                          .indexOf(week)
                                          .toDouble(),
                                      week.commits.toDouble(),
                                    );
                                  }).toList(),
                                  isCurved: true,
                                  colors: model.gradientColors,
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: model.gradientColors
                                        .map((Color color) =>
                                            color.withOpacity(0.3))
                                        .toList(),
                                  ),
                                ),
                              ],
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: const Color(0xff37434d),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ContributorsInfoListTile(
                                icon: Icons.person_add,
                                title: Utils.getCurrentTranslation(
                                        locale, translations)
                                    .followers,
                                trailing: model.user.followersCount.toString(),
                                onTap: () {},
                              ),
                            ),
                            Expanded(
                              child: ContributorsInfoListTile(
                                icon: Icons.person_remove,
                                title: Utils.getCurrentTranslation(
                                        locale, translations)
                                    .following,
                                trailing: model.user.followingCount.toString(),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ContributorsInfoListTile(
                                icon: Icons.storage_rounded,
                                title: Utils.getCurrentTranslation(
                                        locale, translations)
                                    .publicRepos,
                                trailing:
                                    model.user.publicReposCount.toString(),
                                onTap: () {},
                              ),
                            ),
                            Expanded(
                              child: ContributorsInfoListTile(
                                icon: Icons.sd_storage_rounded,
                                title: Utils.getCurrentTranslation(
                                        locale, translations)
                                    .publicGists,
                                trailing:
                                    model.user.publicGistsCount.toString(),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}

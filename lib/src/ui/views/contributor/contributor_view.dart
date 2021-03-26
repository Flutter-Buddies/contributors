import 'package:contributors/src/app/utils/utils.dart';
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

  /// `ContributorView` is the default contructor for [ContributorView]
  const ContributorView({
    Key key,
    @required this.contributorStatistics,
    @required this.repoName,
    @required this.ownerName,
    @required this.locale,
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
          textDirection: Utils.getCurrentTranslation(locale).isRTL
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
                              child: ListTile(
                                leading: Icon(
                                  Icons.format_list_numbered_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  size: 25,
                                ),
                                title: Text(
                                  '${Utils.getCurrentTranslation(locale).contributions} ($ownerName/$repoName)',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  contributorStatistics.total.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                              child: ListTile(
                                leading: Icon(
                                  Icons.person_add,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  size: 25,
                                ),
                                title: Text(
                                  Utils.getCurrentTranslation(locale).followers,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  model.user.followersCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  Icons.person_remove,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  size: 25,
                                ),
                                title: Text(
                                  Utils.getCurrentTranslation(locale).following,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  model.user.followingCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  Icons.storage_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  size: 25,
                                ),
                                title: Text(
                                  Utils.getCurrentTranslation(locale)
                                      .publicRepos,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  model.user.publicReposCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                leading: Icon(
                                  Icons.sd_storage_rounded,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  size: 25,
                                ),
                                title: Text(
                                  Utils.getCurrentTranslation(locale)
                                      .publicGists,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  model.user.publicGistsCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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

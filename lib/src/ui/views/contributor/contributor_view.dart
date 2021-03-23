import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:stacked/stacked.dart';

import './contributor_view_model.dart';

class ContributorView extends StatelessWidget {
  final Contributor contributor;
  final String repoName;
  final String ownerName;

  const ContributorView({
    Key key,
    @required this.contributor,
    @required this.repoName,
    @required this.ownerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorViewModel>.reactive(
      viewModelBuilder: () => ContributorViewModel(),
      onModelReady: (ContributorViewModel model) async {
        await model.init(
          userLoginName: contributor.login,
        );
      },
      builder: (
        BuildContext context,
        ContributorViewModel model,
        Widget child,
      ) {
        return Scaffold(
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
                              contributor.avatarUrl,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        model.user.name,
                        style: TextStyle(
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
                              style: TextStyle(
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
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                size: 25,
                              ),
                              title: Text(
                                "Contributions ($ownerName/$repoName)",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                contributor.contributions.toString(),
                                style: TextStyle(
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
                                Icons.person_add,
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                size: 25,
                              ),
                              title: Text(
                                "Followers",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                model.user.followersCount.toString(),
                                style: TextStyle(
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
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                size: 25,
                              ),
                              title: Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                model.user.followingCount.toString(),
                                style: TextStyle(
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
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                size: 25,
                              ),
                              title: Text(
                                "Public Repos",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                model.user.publicReposCount.toString(),
                                style: TextStyle(
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
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                size: 25,
                              ),
                              title: Text(
                                "Public Gists",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                model.user.publicGistsCount.toString(),
                                style: TextStyle(
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
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

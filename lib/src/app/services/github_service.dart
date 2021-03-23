import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github/github.dart';

class GithubService {
  final GitHub _gitHub = GitHub();

  Stream<Contributor> getContributorsOfRepository({
    @required String ownerName,
    @required String repoName,
  }) {
    // final StreamController<List<Contributor>> contributorsStreamController =
    //     StreamController<List<Contributor>>();

    final Stream<Contributor> contributorStream =
        _gitHub.repositories.listContributors(
      RepositorySlug(ownerName, repoName),
    );

    // List<Contributor> contributorsList = <Contributor>[];

    // contributorStream.listen((Contributor contributor) {
    //   contributorsList.add(contributor);
    // });

    // contributorsStreamController.add(contributorsList);

    return contributorStream;
  }

  Future<User> getUserInfo({
    @required String userLoginName,
  }) async {
    final User user = await _gitHub.users.getUser(userLoginName);

    return user;
  }
}

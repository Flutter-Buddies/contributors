import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github/github.dart';

/// [GithubService] is a service for getting data from `GitHub`.
/// It is the middle man between the third party package and out code.
class GithubService {
  final GitHub _gitHub = GitHub();

  /// [getContributorsOfRepository] return a stream of type contributor.
  /// To get a list listen to the stream and add to a list of contributors
  /// whenever you receive a contributor from the listener.
  /// You need to provide:
  ///
  /// * ownerName | the name of the owner e.g. "Flutter-Buddies"
  /// * repoName | the name of the repository e.g. "contributors"
  Stream<Contributor> getContributorsOfRepository({
    @required String ownerName,
    @required String repoName,
  }) {
    final Stream<Contributor> contributorStream =
        _gitHub.repositories.listContributors(
      RepositorySlug(ownerName, repoName),
    );

    return contributorStream;
  }

  /// [getUserInfo] is a method that returns a `User` if you `await` on it.
  /// You need to provide:
  ///
  /// * userLoginName | username of the user, `login` in the github api
  Future<User> getUserInfo({
    @required String userLoginName,
  }) async {
    final User user = await _gitHub.users.getUser(userLoginName);

    return user;
  }
}

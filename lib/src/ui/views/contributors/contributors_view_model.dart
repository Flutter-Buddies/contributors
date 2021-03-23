import 'dart:async';

import 'package:contributors/src/app/services/github_service.dart';
import 'package:contributors/src/ui/global/custom_base_view_model.dart';
import 'package:contributors/src/ui/views/contributor/contributor_view.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';

class ContributorsViewModel extends CustomBaseViewModel {
  final GithubService _githubService = GithubService();

  final StreamController<List<Contributor>> contributorsController =
      StreamController<List<Contributor>>();

  @override
  void dispose() {
    contributorsController.close();
    super.dispose();
  }

  void getContributorsStream({
    @required String ownerName,
    @required String repoName,
  }) {
    List<Contributor> contributorsList = <Contributor>[];

    final Stream<Contributor> contributorStream =
        _githubService.getContributorsOfRepository(
      ownerName: ownerName,
      repoName: repoName,
    );

    contributorStream.listen((Contributor contributor) {
      contributorsList.add(contributor);
      notifyListeners();
    });

    contributorsController.add(contributorsList);
  }

  Future<void> navigateToContributorView({
    @required BuildContext context,
    @required Contributor contributor,
    @required String ownerName,
    @required String repoName,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ContributorView(
          contributor: contributor,
          ownerName: ownerName,
          repoName: repoName,
        ),
      ),
    );
  }
}

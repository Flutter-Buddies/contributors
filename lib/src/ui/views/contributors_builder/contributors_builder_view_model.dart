import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github/github.dart';

import 'package:contributors/src/app/services/github_service.dart';
import 'package:contributors/src/ui/global/custom_base_view_model.dart';

/// [ContributorsBuilderViewModel] is the View Model that holds the logic
/// for the [ContributorsBuilderView].
class ContributorsBuilderViewModel extends CustomBaseViewModel {
  final GithubService _githubService = GithubService();

  /// [contributorsController] is a stream controller that holds the list of
  /// contributors in its stream.
  final StreamController<List<Contributor>> contributorsController =
      StreamController<List<Contributor>>();

  @override
  void dispose() {
    contributorsController.close();
    super.dispose();
  }

  /// [getContributorsStream] method gets the stream of contributor and listens
  /// to it then adds new contributors to the list. After that it adds the list
  /// to the [contributorsController].
  void getContributorsStream({
    @required String ownerName,
    @required String repoName,
  }) {
    final List<Contributor> contributorsList = <Contributor>[];

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
}

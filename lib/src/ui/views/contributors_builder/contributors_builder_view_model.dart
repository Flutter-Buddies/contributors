import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github/github.dart';

import 'package:contributors/src/app/services/github_service.dart';
import 'package:contributors/src/ui/global/custom_base_view_model.dart';

/// [ContributorsBuilderViewModel] is the View Model that holds the logic
/// for the [ContributorsBuilderView].
class ContributorsBuilderViewModel extends CustomBaseViewModel {
  final GithubService _githubService = GithubService();

  /// [getContributorStatistics] method gets a list of contributor statistics.
  Future<List<ContributorStatistics>> getContributorStatistics({
    @required String ownerName,
    @required String repoName,
  }) async {
    final List<ContributorStatistics> contributorStatisticsListTemp =
        await _githubService.getContributorsOfRepository(
      ownerName: ownerName,
      repoName: repoName,
    );

    return contributorStatisticsListTemp;
  }
}

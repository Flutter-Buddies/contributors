import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github/github.dart';

import 'package:contributors/src/ui/global/custom_base_view_model.dart';
import 'package:contributors/src/ui/views/contributor/contributor_view.dart';
import 'package:contributors/src/ui/views/contributors/contributors_view.dart'
    show ContributorsView;

/// [ContributorsViewModel] is the View Model that holds the logic
/// for the [ContributorsView].
class ContributorsViewModel extends CustomBaseViewModel {
  /// [navigateToContributorView] does exactly what it says.
  /// You need to provide all arguments, all are required.
  Future<void> navigateToContributorView({
    @required BuildContext context,
    @required ContributorStatistics contributorStatistics,
    @required String ownerName,
    @required String repoName,
    @required Locale locale,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (_) => ContributorView(
          contributorStatistics: contributorStatistics,
          ownerName: ownerName,
          repoName: repoName,
          locale: locale,
        ),
      ),
    );
  }
}

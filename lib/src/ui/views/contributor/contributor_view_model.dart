import 'package:contributors/src/app/services/github_service.dart';
import 'package:contributors/src/ui/global/custom_base_view_model.dart';
import 'package:contributors/src/ui/views/contributor/contributor_view.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';

/// [ContributorViewModel] is the View Model that holds the logic
/// for the [ContributorView].
class ContributorViewModel extends CustomBaseViewModel {
  final GithubService _githubService = GithubService();

  User _user;

  /// `getter` for private variable [_user] of type [User].
  User get user => _user;

  /// `setter` for private variable [_user] of type [User].
  /// this method also runs `notifyListeners()`.
  void setUser(User newValue) {
    _user = newValue;
    notifyListeners();
  }

  /// [init] method is run in the [ContributorView] `onModelReady` property.
  Future<void> init({
    @required String userLoginName,
  }) async {
    final User user = await _githubService.getUserInfo(
      userLoginName: userLoginName,
    );

    setUser(user);
  }
}

import 'package:contributors_ui/src/app/services/github_service.dart';
import 'package:contributors_ui/src/ui/global/custom_base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';

class ContributorViewModel extends CustomBaseViewModel {
  final GithubService _githubService = GithubService();

  User _user;
  User get user => _user;
  void setUser(User newValue) {
    _user = newValue;
    notifyListeners();
  }

  Future<void> init({
    @required String userLoginName,
  }) async {
    final User user = await _githubService.getUserInfo(
      userLoginName: userLoginName,
    );

    setUser(user);
  }
}

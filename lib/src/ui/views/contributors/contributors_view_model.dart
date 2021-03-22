import 'package:contributors_ui/src/ui/global/custom_base_view_model.dart';
import 'package:contributors_ui/src/ui/views/contributor/contributor_view.dart';
import 'package:flutter/material.dart';

class ContributorsViewModel extends CustomBaseViewModel {
  Future<void> navigateToContributorView({
    @required BuildContext context,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ContributorView(),
      ),
    );
  }
}

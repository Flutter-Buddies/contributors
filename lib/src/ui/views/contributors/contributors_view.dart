import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:contributors_ui/src/ui/widgets/contributor_list_tile.dart';

import 'contributors_view_model.dart';

class ContributorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorsViewModel>.reactive(
      viewModelBuilder: () => ContributorsViewModel(),
      builder: (
        BuildContext context,
        ContributorsViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return ContributorListTile(
                imageUrl:
                    "https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                name: "Baby Yoda",
                contributionsNumber: 15,
                onTap: () async {
                  await model.navigateToContributorView(
                    context: context,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:contributors/src/app/utils/contributors_translations.dart';
import 'package:contributors/src/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:stacked/stacked.dart';

import './contributors_builder_view_model.dart';

/// [ContributorsBuilderView] gives you the ability to customize the UI.
/// You can get the list of contributors from the `builder` and return the UI
/// that matches your app's feel and look.
class ContributorsBuilderView extends StatelessWidget {
  /// [builder] is where you return the code if the contributors list is
  /// not empty. This method is returned inside a [StreamBuilder] which checks
  /// if the list is empty or null before running `builder`, so no need to
  /// double check if it is empty. Though it wouldn't hurt to do it.
  /// Look at the source code for more info how this works behind the scenes.
  final Widget Function(BuildContext, List<ContributorStatistics>) builder;

  /// [ownerName] is the name of the owner of [repoName].
  final String ownerName;

  /// [repoName] is repo name that the contributor contributed to.
  final String repoName;

  /// [locale] is the [Locale] that you want the text to appear in.
  final Locale locale;

  /// [translations] is the `List<ContributorsTranslation>` you want to use, we
  /// have defaults but you can add custom ones here.
  /// This overrides the default supported languages which means you should add
  /// every language you want to support inside this list. The built-in
  /// translations are factory methods of [ContributorsTranslation].
  ///
  /// Example:
  ///
  /// * ContributorsTranslation.en()
  /// * ContributorsTranslation.ar()
  final List<ContributorsTranslation> translations;

  /// `ContributorsBuilderView` is the default contructor for [ContributorsBuilderView]
  const ContributorsBuilderView({
    Key key,
    @required this.builder,
    @required this.ownerName,
    @required this.repoName,
    @required this.locale,
    this.translations = const <ContributorsTranslation>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorsBuilderViewModel>.reactive(
      viewModelBuilder: () => ContributorsBuilderViewModel(),
      onModelReady: (ContributorsBuilderViewModel model) {
        model.getContributorStatistics(
          ownerName: ownerName,
          repoName: repoName,
        );
      },
      builder: (
        BuildContext context,
        ContributorsBuilderViewModel model,
        Widget child,
      ) {
        return Directionality(
          textDirection: Utils.getCurrentTranslation(locale, translations).isRTL
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            body: model.contributorStatisticsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : builder(
                    context,
                    model.contributorStatisticsList,
                  ),
          ),
        );
      },
    );
  }
}

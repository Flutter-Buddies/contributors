import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './contributor_view_model.dart';

class ContributorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContributorViewModel>.reactive(
      viewModelBuilder: () => ContributorViewModel(),
      builder: (
        BuildContext context,
        ContributorViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Baby Yoda",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "I 💙 Flutter! Like to make things with code! Youngest Participant in Hajj Hackathon!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.format_list_numbered_rounded,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          size: 25,
                        ),
                        title: Text(
                          "Contributions (Flutter/flutter)",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "15",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_add,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          size: 25,
                        ),
                        title: Text(
                          "Followers",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.person_remove,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          size: 25,
                        ),
                        title: Text(
                          "Following",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "39",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.storage_rounded,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          size: 25,
                        ),
                        title: Text(
                          "Public Repos",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "5",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.sd_storage_rounded,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          size: 25,
                        ),
                        title: Text(
                          "Public Gists",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "39",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

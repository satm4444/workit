import 'package:Workit/providers/work_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchItems =
        Provider.of<WorkProvider>(context, listen: false).getSearchItems(query);
    return ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: <Widget>[
          ListTile(
            title: Text(searchItems[index].worktype),
            onTap: () {
              Navigator.pushNamed(context, '/work_detail_screen',
                  arguments: searchItems[index].id);
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/icons/workprofile.png"),
            ),
          ),
          Divider()
        ],
      ),
      itemCount: searchItems.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchItems =
        Provider.of<WorkProvider>(context).getSearchItems(query);
    return query.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Center(child: Text('Search Work'))],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/work_detail_screen',
                        arguments: searchItems[index].id);
                  },
                  title: Text(searchItems[index].worktype),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/workprofile.png"),
                  ),
                ),
                Divider()
              ],
            ),
            itemCount: searchItems.length,
          );
  }
}

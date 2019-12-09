// Core
import 'package:flutter/material.dart';

import '../bloc/contacts/contacts_manager.dart';
import '../models/contact.dart';
import '../widgets/contact_list_builder.dart';

import '../provider.dart';

class ContactSearchDelegate extends SearchDelegate {
  final ContactManager manager;

  ContactSearchDelegate({this.manager});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
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
    // ContactManager manager = Provider.of(context);

    if (query.length < 3) {
      return Center(
        child: Text('Please type more than 3 characters for Search.'),
      );
    }

    return ContactListBuilder(
      // stream: manager.filteredCollection(query: query),
      builder: (BuildContext context, contacts) {
        return ListView.separated(
          itemCount: contacts?.length ?? 0,
          itemBuilder: (BuildContext ctx, int index) {
            Contact _contact = contacts[index];
            //
            return ListTile(
              title: Text(_contact.name),
              subtitle: Text(_contact.email),
              leading: CircleAvatar(),
            );
          },
          separatorBuilder: (BuildContext ctx, int index) => Divider(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

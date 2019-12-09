// Core
import 'package:flutter/material.dart';

import '../models/contact.dart';

// Widgets
import '../widgets/app_drawer.dart';
import '../widgets/contact_counter.dart';
import '../widgets/contact_list_builder.dart';
import '../widgets/contacts_search_delegate.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ContactManager manager = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          ContactCounter(),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ContactListBuilder(
        builder: (BuildContext context, List<Contact> contacts) {
          return ListView.separated(
            itemCount: contacts?.length ?? 0,
            itemBuilder: (BuildContext ctx, int index) {
              Contact _contact = contacts[index];

              return ListTile(
                title: Text(_contact.name),
                subtitle: Text(_contact.email),
                leading: CircleAvatar(),
              );
            },
            separatorBuilder: (BuildContext ctx, int index) => Divider(),
          );
        },
      ),
    );
  }
}

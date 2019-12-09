// Core
import 'package:flutter/material.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/widgets/contact_list_builder.dart';
import '../models/contact.dart';
import '../provider.dart';
import '../widgets/contacts_search_delegate.dart';
import '../bloc/contacts/contacts_manager.dart';

// Widgets
import '../widgets/app_drawer.dart';

class ContactsScreen extends StatelessWidget {
  // ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: manager.contactCounter,
            builder: (ctx, snapshot) {
              return Chip(
                backgroundColor: Colors.red,
                label: Text(
                  (snapshot.data ?? 0).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearchDelegate(manager: manager),
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
        stream: manager.contactListView,
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

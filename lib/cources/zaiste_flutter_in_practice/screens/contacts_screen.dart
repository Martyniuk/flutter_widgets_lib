// Core
import 'package:flutter/material.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/models/contact.dart';
import '../bloc/contacts/contacts_manager.dart';

// Widgets
import '../widgets/app_drawer.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: manager.contactCounter,
            builder: (ctx, snapshot) {
              return Chip(
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
          Padding(
            padding: EdgeInsets.only(right: 16.0),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
        stream: manager.contactListView,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              List<Contact> contacts = snapshot.data;
              if (snapshot.hasError) {
                return Text('Error has appeared ${snapshot}');
              }

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
          }
        },
      ),
    );
  }
}

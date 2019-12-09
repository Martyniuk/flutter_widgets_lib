// Core
import 'package:flutter/material.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/bloc/contacts/contacts_manager.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/models/contact.dart';

import '../provider.dart';

class ContactListBuilder extends StatelessWidget {
  @required
  final Function builder;

  const ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<List<Contact>>(
      stream: manager.contactListView,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;

            return builder(context, contacts);
        }
      },
    );
  }
}

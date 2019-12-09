// Core
import 'package:flutter/material.dart';

import '../bloc/contacts/contacts_manager.dart';
import '../provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of<ContactManager>(context);

    return StreamBuilder<int>(
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
    );
  }
}

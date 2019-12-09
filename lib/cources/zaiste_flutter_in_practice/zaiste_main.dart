// Core
import 'package:flutter/material.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/provider.dart';

// Widgets
import 'app.dart';
import 'bloc/contacts/contacts_manager.dart';

class ZaisteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
      child: App(),
    );
  }
}

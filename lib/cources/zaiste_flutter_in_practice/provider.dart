//Core
import 'package:flutter/material.dart';

// Manager
import 'bloc/contacts/contacts_manager.dart';

class Provider<T> extends InheritedWidget {
  final T data;
  static Type _typeOf<T>() => T;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static ContactManager of<T>(BuildContext context) {
    final type = _typeOf<Provider<T>>();
    return (context.inheritFromWidgetOfExactType(type) as Provider).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

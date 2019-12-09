// -- BLOC for Contacts
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import '../../service/contact_service.dart';
import '../../models/contact.dart';

class ContactManager {
  // Stream<List<Contact>> get contactListView async* {
  //   yield await ContactService.browse();
  // }
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();

  Stream<List<Contact>> get contactListView {
    return Stream.fromFuture(ContactService.browse());
  }

  Stream<List<Contact>> filteredCollection({query}) {
    return Stream.fromFuture(ContactService.browse(query: query));
  }

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }

  void dispose() {
    _contactCounter.close();
  }
}

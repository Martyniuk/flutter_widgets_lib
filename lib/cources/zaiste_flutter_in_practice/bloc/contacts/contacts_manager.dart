// -- BLOC for Contacts
import 'dart:async';

import '../../service/contact_service.dart';

import '../../models/contact.dart';

class ContactManager {
  // Stream<List<Contact>> get contactListView async* {
  //   yield await ContactService.browse();
  // }
  Stream<List<Contact>> get contactListView {
    return Stream.fromFuture(ContactService.browse());
  }

  Stream<List<Contact>> filteredCollection({query}) {
    return Stream.fromFuture(ContactService.browse(query: query));
  }

  StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}

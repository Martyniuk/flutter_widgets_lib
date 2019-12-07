// Core
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Models
import '../models/contact.dart';

class ContactService {
  static String _url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = await json.decode(content);
    // List<Contact> _contacts =
    //     collection.map((json) => Contact.fromJson(json)).toList();

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    if (query != null && query.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(query));
    }

    return _contacts.toList();
  }
}

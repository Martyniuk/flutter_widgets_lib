// Core
// import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

// Instruments
// import 'package:http/http.dart' as http;
import 'dart:convert';
// part 'Message.g.dart'; <-- wrong notation...
part 'message.g.dart';

@JsonSerializable()
class Message {
  final String body;
  final String subject;

  Message(this.body, this.subject);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async {
    String url = status == 'important'
        ? 'http://www.mocky.io/v2/5de3727a3000002900e9c9b8'
        : 'http://www.mocky.io/v2/5de3fe4830000051009f78e4';

    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}

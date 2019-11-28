// Core
import 'package:json_annotation/json_annotation.dart';

// Instruments
import 'package:http/http.dart' as http;
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

  static Future<List<Message>> browse() async {
    http.Response response =
        await http.get('http://www.mocky.io/v2/5ddead35310000526c3ae488');

    await Future.delayed(Duration(seconds: 3));
    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}

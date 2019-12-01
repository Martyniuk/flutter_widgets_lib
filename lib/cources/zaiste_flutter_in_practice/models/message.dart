// Core
import 'package:json_annotation/json_annotation.dart';

// Instruments
import 'package:http/http.dart' as http;
import 'dart:convert';
// part 'Message.g.dart'; <-- wrong notation...
part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message {
  final String body;
  final String subject;

  Message(this.body, this.subject);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response response =
        await http.get('https://www.mocky.io/v2/5de3727a3000002900e9c9b8');

    await Future.delayed(Duration(seconds: 3));
    // print('< ---response---- ${response} ======================');
    String content = response.body;
    // print('< --content----- ${content} ======================');
    List collection = json.decode(content);
    // print('< --collection----- ${collection} ======================');
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}

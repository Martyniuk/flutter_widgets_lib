// Core
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

// Instruments
// import 'package:http/http.dart' as http;
import 'package:flipperkit_http_interceptor/flipperkit_http_interceptor.dart';
import 'package:dio/dio.dart';
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
    // bool trustSelfSigned = true;
    // HttpClient httpClient = new HttpClient()
    // ..badCertificateCallback =
    // ((X509Certificate cert, String host, int port) => trustSelfSigned);
    // HttpClient client = new HttpClient();
    // client.getUrl(Uri.parse(url));

    // var http = new HttpClientWithInterceptor();
    // var response = await http.get(url);
    // String PEM = "XXXXX"; // certificate content
    // var dio = Dio();
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) {
    //     return true;
    //   };
    // };
    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}

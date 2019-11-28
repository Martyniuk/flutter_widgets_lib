// Core
import 'package:flutter/material.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/widgets/compose_button.dart';
import 'package:widgetlibrary/cources/zaiste_flutter_in_practice/widgets/message_detail.dart';

// Models
import '../models/message.dart';
import 'message_compose.dart';

class MessageList extends StatefulWidget {
  const MessageList({
    Key key,
  }) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;
  // List<Message> messages = const [];
  // bool isLoading = true;

  // Future loadMessageList() async {
  //   // String content = await rootBundle.loadString('data/message.json');

  //   // http.Response response =
  //   //     await http.get('http://www.mocky.io/v2/5ddea11431000023673ae3ed');

  //   // await Future.delayed(Duration(seconds: 3));
  //   // String content = response.body;
  //   // List collection = json.decode(content);
  //   // List<Message> _messages =
  //   //     collection.map((json) => Message.fromJson(json)).toList();
  //   List<Message> _messages = await Message.browse();

  //   setState(() {
  //     messages = _messages;
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    messages = Message.browse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zaiste - Flutter in Practice app')),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Message> messages = snapshot.data;
              if (snapshot.hasError) {
                return Text('Error has appeared ${snapshot.error}');
              }

              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MessageDetail(message.subject, message.body),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      child: Text('VM'),
                    ),
                    title: Text('${message.subject}'),
                    subtitle: Text(
                      '${message.body}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
                itemCount: messages.length,
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}

// Core
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// Models
import '../models/message.dart';
import 'message_detail.dart';
// import 'message_compose.dart';

class MessageList extends StatefulWidget {
  final String status;
  MessageList({this.status = 'important'});

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() async {
    future = Message.browse(status: widget.status);
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
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

                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  key: ObjectKey(message),
                  actions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () => {},
                    ),
                    IconSlideAction(
                      caption: 'Share',
                      color: Colors.indigo,
                      icon: Icons.share,
                      onTap: () => {},
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'More',
                      color: Colors.black45,
                      icon: Icons.more_horiz,
                      onTap: () => {},
                    ),
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {
                        setState(() {
                          messages.removeAt(index);
                        });
                      },
                    ),
                  ],
                  child: ListTile(
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
                  ),
                );
              },
              itemCount: messages.length,
            );
        }
      },
    );
  }
}

// ------------ below example is displaying how request can be handled --------------------

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

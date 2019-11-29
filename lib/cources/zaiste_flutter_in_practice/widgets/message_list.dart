// Core
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// Models
import '../models/message.dart';
import 'compose_button.dart';
import 'message_detail.dart';
// import 'message_compose.dart';

var avatar =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPRs-cPqHbf_URF5W6vePAqdwy7KLLncCS0sCHTKPhM2i9fP3Gzg&s';

class MessageList extends StatefulWidget {
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
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('Some Email'),
              accountName: Text('Some Name'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.twitch,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.linkedin,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text('Inbox'),
              trailing: Chip(
                label: Text(
                  '11',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text('Draft'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archive),
              title: Text('Archive'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text('Sent'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text('Trash'),
            ),
            Divider(),
            // Spacer(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.cog),
                  title: Text('Settings'),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Zaiste - Flutter in Practice app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              setState(() {
                future = Message.browse();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
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
      ),
      floatingActionButton: ComposeButton(messages),
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

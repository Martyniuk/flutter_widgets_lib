// Core
import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = '';
  String body = '';
  String subject = '';

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose new Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value) =>
                      !value.contains('@') ? 'must be a valid email' : null,
                  onSaved: (String value) => to = value,
                  decoration: InputDecoration(
                    labelText: 'To',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    int len = value.length;
                    if (len == 0) {
                      return "'Subject' can't be empty!";
                    } else if (len < 4) {
                      return "'Subject' should be longer than 4 characters...";
                    }

                    return null;
                  },
                  onSaved: (String value) => subject = value,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  onSaved: (String value) => body = value,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  maxLines: 5,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  child: Text('SEND'),
                  onPressed: () {
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();
                      Message message = Message(subject, body);

                      Navigator.pop(context, message);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

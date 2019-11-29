// Core
import 'package:flutter/material.dart';

import 'message_compose.dart';
import '../models/message.dart';

class ComposeButton extends StatelessWidget {
  final List<Message> messages;
  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageCompose(),
          ),
        );

        if (message != null) {
          messages.add(message);
          var snackbar = SnackBar(
            content: Text('Your message has been sent'),
            backgroundColor: Colors.green,
          );
          Scaffold.of(context).showSnackBar(snackbar);
        }
      },
    );
  }
}

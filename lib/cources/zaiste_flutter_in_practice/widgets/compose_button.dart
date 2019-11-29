import 'package:flutter/material.dart';

import 'message_compose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageCompose(),
          ),
        );

        var snackbar = SnackBar(
          content: Text('Your message has been sent with $intention'),
          backgroundColor: Colors.green,
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}

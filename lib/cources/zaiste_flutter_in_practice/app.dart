// Core
import 'package:flutter/material.dart';

// Models
// import './widgets/compose_button.dart';
import './widgets/message_list.dart';
import './widgets/app_drawer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer.getDrawer(),
      appBar: AppBar(
        title: Text('Zaiste - Flutter in Practice app'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.refresh),
        //     onPressed: () async {
        //       setState(() {
        //         future = Message.browse();
        //       });
        //     },
        //   ),
        // ],
      ),
      body: MessageList(),
      // floatingActionButton: ComposeButton(),
    );
  }
}

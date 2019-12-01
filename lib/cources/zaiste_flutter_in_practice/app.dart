// Core
import 'package:flutter/material.dart';

// Models
// import './widgets/compose_button.dart';
import './widgets/message_list.dart';
import './widgets/app_drawer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Zaiste - Flutter in Practice app'),
          actions: <Widget>[],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Important',
              ),
              Tab(
                text: 'Messaegs',
              ),
            ],
          ),
        ),
        body: MessageList(),
        // floatingActionButton: ComposeButton(),
      ),
      length: 2,
    );
  }
}

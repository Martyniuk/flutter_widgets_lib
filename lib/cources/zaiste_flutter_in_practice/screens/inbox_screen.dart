// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/app_drawer.dart';
import '../widgets/message_list.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          actions: <Widget>[],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Important'),
              Tab(
                text: 'Other',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: 'important'),
            MessageList(status: 'other'),
          ],
        ),
        drawer: AppDrawer(),
      ),
      length: 2,
    );
  }
}

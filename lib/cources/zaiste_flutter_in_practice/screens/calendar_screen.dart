// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/app_drawer.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Calendar'),
      ),
    );
  }
}

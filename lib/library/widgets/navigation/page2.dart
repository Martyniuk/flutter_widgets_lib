// Core
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, [
          {'name': 'Iwo'},
          true
        ]);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('This is Page 2'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, [
                {'name': 'Iwo'},
                true
              ]);
            },
          ),
        ),
        body: Center(
          child: Text(
            'Page 2',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, [
              {'name': 'Ito'},
              true
            ]);
          },
          child: Text('2'),
        ),
      ),
    );
  }
}

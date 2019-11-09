// Core
import 'package:flutter/material.dart';

// Instuments
import 'page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Page 1'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Page 1',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var navigationResult = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page2()));

          debugPrint('<---- $navigationResult');
        },
        child: Text('1'),
      ),
    );
  }
}

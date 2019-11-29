// Core
import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose new Message'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'To',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Subject',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Body',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'Compose new message',
      //         style: TextStyle(
      //           color: Colors.grey,
      //           fontSize: 26.0,
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           RaisedButton(
      //             child: Text('Love'),
      //             onPressed: () {
      //               Navigator.pop(context, 'Love');
      //             },
      //           ),
      //           RaisedButton(
      //             child: Text('Hate'),
      //             onPressed: () {
      //               Navigator.pop(context, 'Hate');
      //             },
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

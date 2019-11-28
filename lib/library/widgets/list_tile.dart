// Core
import 'package:flutter/material.dart';

class ListTileCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListTileState();
  }
}

// Handle changes to a text field --> Playaround
class _ListTileState extends State<ListTileCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 4.0,
          color: Colors.red,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('List Tile playground'),
          Divider(
            color: Colors.black,
            thickness: 3.0,
          ),
          Column(
            children: <Widget>[
              // ExpansionTile
              ListTile(
                title: Text('List Tile title'),
                isThreeLine: true,
                subtitle: Text(
                    'List Tile subtitle subtitle subtitle subtitle subtitle'),
                leading: CircleAvatar(
                  child: Text('VM'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

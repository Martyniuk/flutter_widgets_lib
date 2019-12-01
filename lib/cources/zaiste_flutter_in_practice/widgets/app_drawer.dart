// Core
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var avatar = 'https://avatars1.githubusercontent.com/u/12961943?s=460&v=4';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('Some Email'),
            accountName: Text('Some Name'),
            currentAccountPicture: CircleAvatar(
              // backgroundImage: NetworkImage(avatar),
              backgroundColor: Colors.blueAccent,
              child: Text(
                'VM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.twitch,
                  color: Color.fromRGBO(45, 45, 45, 1.0),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.linkedin,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text(
                '13',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Draft'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text('Archive'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Sent'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('Trash'),
          ),
          Divider(),
          // Spacer(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text('Settings'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

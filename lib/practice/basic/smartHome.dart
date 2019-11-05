// https://dribbble.com/shots/5848359-Smart-Home-App-Dark-Theme

// Core
import 'package:flutter/material.dart';

var lightGrey = Color(0xFF414350);
var lightBlue = Color(0xFF5157c2);

var bedRoomImage =
    'https://d4qwptktddc5f.cloudfront.net/mark-zeff-new-york-loft-daughter-bedroom-0418-SPRINGHOMES.jpg';
var fkaTwigsImage =
    'https://upload.wikimedia.org/wikipedia/en/thumb/7/77/FKA_twigs_-_LP1.png/220px-FKA_twigs_-_LP1.png';

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF32323e),
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromRGBO(81, 82, 91, 1.0),
                size: 28.0,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Kitchen',
              style: TextStyle(color: Colors.white, fontSize: 32.0),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF32323e),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      bedRoomImage,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1 / 0.7,
                  children: <Widget>[
                    GridItem(
                        Icons.lightbulb_outline, '72 %', 'Kitchen Lamp', true),
                    GridItem(Icons.graphic_eq, 'Eddy', 'Need to water', false),
                    GridItem(
                        Icons.line_weight, '1.2 kW', 'Current power', false),
                    GridItem(Icons.hot_tub, 'Close', 'Status ok', false),
                    GridItem(Icons.cloud_circle, 'Open', 'Status ok', false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final icon;
  final value;
  final title;
  final active;

  const GridItem(this.icon, this.value, this.title, this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: active ? lightBlue : lightGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 36.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15.0),
                  Text(
                    '$value',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 4.0,
              width: title.length * 11.5,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

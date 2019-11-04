// design --> https://dribbble.com/shots/5859364-Product-Release-Launch-Store-Concept/attachments

import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/rendering.dart';

var appBarColor = Color(0xFF17294b);

var bgColor = Color(0xFF0d193a);
var buttonColor = Color(0xFF1b335d);

var blueGradient1 = Color(0xff52b2f0);
var blueGradient2 = Color(0xff4968d3);

var pinkGradient1 = Color(0xfffc6d86);
var pinkGradient2 = Color(0xfffed0d1);

var profileImage =
    'http://profilepicturesdp.com/wp-content/uploads/2018/06/animated-profile-pictures-commercial.png';
var profileImage2 =
    'https://www.imaginetricks.com/wp-content/uploads/2017/08/beautiful-girl-profile.jpg';

var slack = 'https://cdn0.iconfinder.com/data/icons/tuts/256/slack_alt.png';
var sketch =
    'https://www.sketchapp.com/images/pages/press/sketch-press-kit/app-icons/sketch-mac-icon@2x.png';
var photoshop =
    'https://cdn.iconscout.com/icon/free/png-256/adobe-photoshop-4-569303.png';

class ProductReleaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Release App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Arc(
                height: 30.0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [blueGradient1, blueGradient2],
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Today.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5,
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(profileImage),
                        )
                      ],
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      'Trending',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.red),
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 160.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(19, 53, 97, 0.7),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image(
                                    width: 80.0,
                                    image: NetworkImage(slack),
                                  ),
                                  Text(
                                    'Slack',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Business',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    height: 25.0,
                                    width: 90.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(21, 51, 99, 1.0),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.arrow_drop_up,
                                          color:
                                              Color.fromRGBO(62, 215, 176, 1.0),
                                        ),
                                        Text(
                                          '1350',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

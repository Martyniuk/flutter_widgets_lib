// -> https://www.uplabs.com/posts/weekly-design-2-streaming-service
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StreamingApp extends StatefulWidget {
  @override
  _StreamingAppState createState() => _StreamingAppState();
}

class _StreamingAppState extends State<StreamingApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            SizedBox(height: 30.0),
            HomeScreenBottomPart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              FontAwesomeIcons.home,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            // title: SizedBox.shrink(),
            title: Text('asd'),
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('asd'),
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('asd'),
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  List<String> images = [
    'assets/images/streaming_app/runaways.jpg',
    'assets/images/streaming_app/avengers.jpg',
    'assets/images/streaming_app/blackpanther.jpg',
  ];

  List<String> titles = [
    'Runaways',
    'Avengers',
    'Blackpanther',
  ];

  List<Widget> movies() {
    List<Widget> movieList = List();

    for (int i = 0; i < 3; i++) {
      Widget movieItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
        child: Container(
          height: 220.0,
          width: 135.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.black12,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  images[i],
                  width: double.infinity,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                titles[i],
                style: TextStyle(
                  fontFamily: 'SF-Pro-Text-Bold',
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ),
      );

      movieList.add(movieItem);
    }

    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 95.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Watch now',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'SF-Pro-Text-Bold',
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('view more'),
                ),
              ],
            ),
          ),
          Container(
            height: 250.0,
            width: 450,
            child: ListView(
              padding: EdgeInsets.only(left: 90.0),
              scrollDirection: Axis.horizontal,
              children: movies(),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420.0,
      child: Stack(
        children: <Widget>[
          Container(
            height: 370.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(120.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120.0),
                  ),
                  child: Image.asset(
                    'assets/images/streaming_app/banner.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0x00000000),
                        Color(0xD9333333),
                      ],
                      stops: [
                        0.0,
                        0.9,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(0.0, 1.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 120.0, left: 95.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'WATCH BEFORE EVERYONE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'SF-Pro-Text-Bold',
                          ),
                        ),
                        Text(
                          'The Punisher: Season 2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontFamily: 'SF-Pro-Text-Bold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20.0,
            left: 100.0,
            top: 340.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Color(0xFFE52020),
                  ),
                ),
                SizedBox(width: 40.0),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  child: RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
                    onPressed: () {},
                    color: Colors.red,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'watch now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          FontAwesomeIcons.longArrowAltRight,
                          size: 20.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIcons {
  static const IconData back_icon = IconData(0xe950, fontFamily: 'CustomIcons');
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 100.0);

    var controllPoint = Offset(35.0, size.height);
    var endPoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

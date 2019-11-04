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
      bottomNavigationBar: BottomAppBar(
        color: appBarColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 12.0,
        child: Container(
          height: 50.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.home, color: blueGradient1, size: 32.0),
                Icon(Icons.shuffle, color: Colors.grey, size: 32.0),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.0),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(profileImage),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Trending',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TrendingSection(),
                    SizedBox(height: 16.0),
                    Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      height: 120.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FeaturedItem(
                            'Productivity',
                            '102',
                            pinkGradient1,
                            pinkGradient2,
                          ),
                          FeaturedItem(
                            'Other stuff',
                            '43',
                            blueGradient1,
                            blueGradient2,
                          ),
                          FeaturedItem(
                            'Efficiency',
                            '54',
                            pinkGradient1,
                            pinkGradient2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Recent Blogs',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Card(
                      color: Color.fromRGBO(12, 35, 73, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            RecentBlogsItem(),
                            RecentBlogsItem(),
                            RecentBlogsItem(),
                            RecentBlogsItem(),
                            RecentBlogsItem()
                          ],
                        ),
                      ),
                    )
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

class RecentBlogsItem extends StatelessWidget {
  const RecentBlogsItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(profileImage2),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Top 10 Productive Apps',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Alexandr Miroshnichenko',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16.0,
                ),
              )
            ],
          ),
          Text(
            '3 hr ago',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  final title;
  final quantity;
  final colorBegin;
  final colorEnd;

  const FeaturedItem(this.title, this.quantity, this.colorBegin, this.colorEnd);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [colorBegin, colorEnd],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 5.0,
              ),
              child: Text(
                '$quantity Products',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TrendingCard(slack, 'Slack', 'Business', '1350'),
          TrendingCard(sketch, 'Sketch', 'Design', '1190'),
          TrendingCard(photoshop, 'Photoshop', 'Design', '1050'),
        ],
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final productImage;
  final productName;
  final productMission;
  final productRate;

  const TrendingCard(this.productImage, this.productName, this.productMission,
      this.productRate);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(19, 53, 97, 0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              width: 80.0,
              image: NetworkImage(productImage),
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  productMission,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 25.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(21, 51, 99, 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(62, 215, 176, 1.0),
                  ),
                  Text(
                    productRate,
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
    );
  }
}

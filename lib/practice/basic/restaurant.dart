// --> https://dribbble.com/shots/5885025-Restaurant-Mobile-App

// Core
import 'package:flutter/material.dart';
import 'package:clippy_flutter/polygon.dart';
// import 'package:flutter/services.dart';

// Below is for layout "playwith" purpose
// IMAGES
var meatImage =
    'https://images.unsplash.com/photo-1532597311687-5c2dc87fff52?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var foodImage =
    'https://images.unsplash.com/photo-1520218508822-998633d997e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80';

var burgerImage =
    'https://images.unsplash.com/photo-1534790566855-4cb788d389ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var chickenImage =
    'https://images.unsplash.com/photo-1532550907401-a500c9a57435?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

// COLORS
var textYellow = Color(0xFFf6c24d);
var iconYellow = Color(0xFFf4bf47);

var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

// --------------------------------------------------------

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(Icons.grid_on, color: Colors.grey, size: 32.0),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Location',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22.0,
                      letterSpacing: .5,
                    ),
                  ),
                  Text(
                    'West bay, Qatar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 100.0,
          height: 100.0,
          child: Polygon(
            sides: 6,
            child: Container(
              color: iconYellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.book, size: 28.0, color: Colors.black),
                  SizedBox(height: 5.0),
                  Text('MENU', style: TextStyle(fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.home),
                      Text('Home',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.grey),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Container(width: 40.0),
                  Column(
                    children: <Widget>[
                      Icon(Icons.tag_faces, color: Colors.grey),
                      Text(
                        'Wishlist',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.card_giftcard, color: Colors.grey),
                      Text(
                        'Cart',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          DiscountSection(),
          SizedBox(height: 25.0),
          ServicesSection(),
          SizedBox(height: 30.0),
          Text(
            'Popular Dishes',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 32.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Container(
                height: 170.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 170.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(burgerImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 35.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: iconYellow,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 28.0,
                                  color: Colors.black,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Special Chiken Burger',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Chicken, Yogurt, Red chili,',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Ginger paste, Garlic paste, ...',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 170.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 170.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(foodImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 35.0,
                            width: 70.0,
                            decoration: BoxDecoration(
                              color: iconYellow,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 28.0,
                                  color: Colors.black,
                                ),
                                Text(
                                  '4.3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Hot awesome Meal',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Chicken, Yogurt, Red chili,',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Ginger paste, Garlic paste, ...',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.radio_button_checked,
                    size: 48.0, color: Colors.green[500]),
                Text(
                  'Sports Store',
                  style: TextStyle(
                    color: Colors.green[500],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .4,
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.grain, size: 48.0, color: Colors.red[400]),
                  Text(
                    'Book a Table',
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.headset,
                  color: Colors.blue[400],
                  size: 48.0,
                ),
                Text(
                  'Caterings',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountSection extends StatelessWidget {
  const DiscountSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 15.0),
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(meatImage),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0.1), Colors.black],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '25%  OFF',
                          style: TextStyle(
                            color: textYellow,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          'ON FIRST 3 ORDERS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: .5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            height: 200.0,
            width: 350.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                fit: BoxFit.values[2],
                image: NetworkImage(chickenImage),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '25%  OFF',
                    style: TextStyle(
                      color: textYellow,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    'ON FIRST 3 ORDERS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: .5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

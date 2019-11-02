// Core
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

var newZealandImage =
    'https://images.unsplash.com/photo-1492531622965-b556ff0402df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var parisImage =
    'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1307&q=80';
var auroraImage =
    'https://images.unsplash.com/photo-1531366936337-7c912a4589a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

var berlinImage =
    'https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var amsterdamImage =
    'https://images.unsplash.com/photo-1524047934617-cb782c24e5f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

var gradient1 = [Color(0xFFdc5f89), Color(0xFFeea694)];
var gradient2 = [Color(0xFF269b70), Color(0xFF7ce6a9)];
var gradient3 = [Color(0xFF526fe2), Color(0xFF8351e5)];

var places = [
  {
    'image': newZealandImage,
    'name': 'New Zealand',
    'currency': 'USD',
    'cost': '5.250',
    'stars': 4,
    'rate': '4.5',
    'reviewsNumber': 620,
    'duration': 5
  },
  {
    'image': parisImage,
    'name': 'Paris',
    'currency': 'HZ',
    'cost': '3.250',
    'stars': 3,
    'rate': '3.0',
    'reviewsNumber': 320,
    'duration': 3
  },
  {
    'image': auroraImage,
    'name': 'Aurora',
    'currency': 'HZ2',
    'cost': '6.430',
    'stars': 5,
    'rate': '5.0',
    'reviewsNumber': 820,
    'duration': 2
  },
  {
    'image': berlinImage,
    'name': 'Berlin',
    'currency': 'Euro',
    'cost': '4.430',
    'stars': 5,
    'rate': '4.9',
    'reviewsNumber': 720,
    'duration': 7
  },
  {
    'image': amsterdamImage,
    'name': 'Amsterdam',
    'currency': 'HZ4',
    'cost': '5.830',
    'stars': 5,
    'rate': '5.0',
    'reviewsNumber': 990,
    'duration': 42
  },
];

class DarkTravelApp extends StatefulWidget {
  @override
  _DarkTravelAppState createState() => _DarkTravelAppState();
}

class _DarkTravelAppState extends State<DarkTravelApp> {
  var currentPlace = places[1];

  Widget _renderStars() {
    int stars = currentPlace['stars'];

    return Row(
      children: <Widget>[
        Icon(
          Icons.star,
          color: stars >= 1 ? Colors.yellow : Colors.white,
          size: stars >= 1 ? 20.0 : 18.0,
        ),
        Icon(
          Icons.star,
          color: stars >= 2 ? Colors.yellow : Colors.white,
          size: stars >= 2 ? 20.0 : 18.0,
        ),
        Icon(
          Icons.star,
          color: stars >= 3 ? Colors.yellow : Colors.white,
          size: stars >= 3 ? 20.0 : 18.0,
        ),
        Icon(
          Icons.star,
          color: stars >= 4 ? Colors.yellow : Colors.white,
          size: stars >= 4 ? 20.0 : 18.0,
        ),
        Icon(
          Icons.star,
          color: stars >= 5 ? Colors.yellow : Colors.white,
          size: stars >= 5 ? 20.0 : 18.0,
        ),
      ],
    );
  }

  Widget _renderCountryInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                currentPlace['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text(
                    currentPlace['currency'],
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    currentPlace['cost'],
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _renderStars(),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text(
                    currentPlace['rate'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '(${currentPlace['reviewsNumber'].toString()}) reviews',
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1359),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Travel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    autocorrect: false,
                    style: TextStyle(
                      color: Colors.white54,
                      backgroundColor: Color(0xFF382f6e),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15.0),
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Colors.white54),
                      fillColor: Colors.white12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: 'Search Desctination',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 45.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CountryItem('Italy', gradient1),
                        CountryItem('Rome', gradient2),
                        CountryItem('French', gradient3),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Destination',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  CarouselSlider(
                    onPageChanged: (int index) {
                      setState(() {
                        currentPlace = places[index];
                      });
                    },
                    height: 160.0,
                    items: places.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150.0,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child:
                                    Image.network(i['image'], fit: BoxFit.fill),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.90,
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: _renderCountryInfo(),
                  ),
                  SizedBox(height: 25.0),
                  Text(
                    'Popular Tour',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  CarouselSlider(
                    height: 120.0,
                    items: places.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    i['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${i['name']} Tour',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: .7),
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${i['currency']}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            '|',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            '${i['duration']} Days',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                    enableInfiniteScroll: true,
                    viewportFraction: 0.6,
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

class CountryItem extends StatelessWidget {
  final String countryName;
  final gradient;

  const CountryItem(this.countryName, this.gradient);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 52.0,
          vertical: 10.0,
        ),
        child: Text(
          countryName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

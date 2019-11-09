// Core
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widgets
import '../widgets/destinations_carousel.dart';
import '../widgets/hotel_carousel.dart';

var profileImage =
    'https://www.imgmodels.com/sites/default/files/283adc16-7317-4189-bf7f-816367d68adf.jpg';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.car,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    bool chosenOne = _selectedIndex == index;

    return InkWell(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: chosenOne
                ? Theme.of(context).accentColor
                : Color.fromRGBO(231, 235, 238, 1.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: chosenOne
                ? Theme.of(context).primaryColor
                : Color.fromRGBO(181, 193, 196, 1.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcon(map.key))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30.0),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet, size: 30.0),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: _currentTab == 2 ? 1.0 : 0.0,
                    color: _currentTab == 2
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: NetworkImage(profileImage),
                ),
              ),
              title: SizedBox.shrink()),
        ],
      ),
    );
  }
}

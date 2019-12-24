// Core
import 'package:flutter/material.dart';

List<Map<String, Object>> options = [
  {
    'icon': Icons.games,
    'title': 'Option One',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.stop,
    'title': 'Option Two',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.assignment,
    'title': 'Option Three',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.airline_seat_individual_suite,
    'title': 'Option Four',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.question_answer,
    'title': 'Option Five',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.event_seat,
    'title': 'Option Six',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  },
  {
    'icon': Icons.network_wifi,
    'title': 'Option Seven',
    'subtitle': 'Lorem ipsum dolor sit amet, consect',
  }
];

class MenuOptions extends StatefulWidget {
  @override
  _MenuOptionsState createState() => _MenuOptionsState();
}

class _MenuOptionsState extends State<MenuOptions> {
  int selectedOption = 0;

  void _selectOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Menu Options'),
        leading: FlatButton(
          textColor: Colors.white,
          child: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text(
              'HELP',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == options.length + 1) {
            return SizedBox(height: 100.0);
          }
          var item = options[index];

          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: selectedOption == index
                  ? Border.all(color: Colors.black38)
                  : Border.all(color: Colors.black26),
              boxShadow: selectedOption == index
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ]
                  : null,
            ),
            child: ListTile(
              onTap: () {
                _selectOption(index);
              },
              leading: Icon(
                item['icon'],
                size: 42.0,
                color: selectedOption == index ? Colors.black : Colors.black54,
              ),
              title: Text(
                item['title'],
                style: TextStyle(
                  color:
                      selectedOption == index ? Colors.black : Colors.black54,
                ),
              ),
              subtitle: Text(
                item['subtitle'],
                style: TextStyle(
                  color:
                      selectedOption == index ? Colors.black : Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

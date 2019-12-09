// -> https://dribbble.com/shots/6432389-Notes-App
// Core
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormat = DateFormat('dd MMM');
  final DateFormat _timeFormat = DateFormat('h:mm');

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 240.0,
        width: 175.0,
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index
              ? Color(0xFF417BFB)
              : Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0,
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Color(0xFFAFB4C6),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/notes_app/user.png'),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Jenny Breaks',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 1,
              itemBuilder: (BuildContext ctx, int index) {
                if (index == 0) {
                  return SizedBox(width: 20.0);
                }

                return _buildCategoryCard(
                  index - 1,
                  categories.keys.toList()[index - 1],
                  categories.values.toList()[index - 1],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xFFAFB4C6),
              indicatorColor: Color(0xFF417BFB),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Important',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Performed',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[0].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _timeFormat.format(notes[0].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  notes[0].content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      _dateFormat.format(notes[0].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF417BFB),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[1].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      _timeFormat.format(notes[1].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  notes[1].content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      _dateFormat.format(notes[1].date),
                      style: TextStyle(
                        color: Color(0xFFAFB4C6),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF417BFB),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  String title;
  String content;
  DateTime date;

  Note({this.title, this.content, this.date});
}

final Map<String, int> categories = {
  'Notes': 112,
  'Work': 58,
  'Home': 23,
  'Complete': 31,
};

final List<Note> notes = [
  Note(
    title: 'Buy ticket',
    content: 'Buy airplane ticket through Kayak for \$318.38',
    date: DateTime(2019, 10, 10, 8, 30),
  ),
  Note(
    title: 'Walk with dog',
    content: 'Walk on the street with my favorite dog.',
    date: DateTime(2019, 10, 10, 8, 30),
  ),
];

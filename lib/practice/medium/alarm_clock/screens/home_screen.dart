// Core
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgetlibrary/practice/medium/alarm_clock/widgets/alarm_item.dart';

// CustomPainter
import '../widgets/shapes_painter.dart';

// should be moved to consts
const int TAB_LENGTH = 4;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  String _timeString;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: TAB_LENGTH,
      vsync: this,
      initialIndex: 0,
    );

    _timeString = _formatDateTime(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (Timer r) => _getTime());

    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);

    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TAB_LENGTH,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.access_time), text: 'Clock'),
              Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
              Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
              Tab(icon: Icon(Icons.timer), text: 'Stopwatch'),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                // Clock
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: ShapesPainter(),
                        child: Container(
                          height: 500.0,
                        ),
                      ),
                    ),
                    Text(
                      _timeString,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.0,
                        fontFamily: 'Nexa-Light',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // Alarm
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            alarmItem(_timeString, true),
                            alarmItem(_timeString, false),
                            alarmItem(_timeString, false),
                            alarmItem(_timeString, true),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Timer',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Stopwatch',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  Widget _bottomButtons() {
    return _tabController.index == 1
        ? FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/add-alarm'),
            child: Icon(Icons.add),
          )
        : null;
  }
}

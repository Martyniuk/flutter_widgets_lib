// Core
import 'package:flutter/material.dart';

import '../widgets/circle_day.dart';

class AddAlarm extends StatefulWidget {
  // AddAlarm({Key key}) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  TimeOfDay _selectedTime;
  ValueChanged<TimeOfDay> selectTime;

  @override
  void initState() {
    _selectedTime = TimeOfDay(
      hour: 12,
      minute: 30,
    );

    super.initState();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _selectedTime);

    setState(() {
      _selectedTime = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1b2c57),
      appBar: AppBar(
        backgroundColor: Color(0xff1b2c57),
        title: Column(
          children: <Widget>[
            Icon(
              Icons.alarm_add,
              color: Color(0xff65d1ba),
            ),
            Text(
              'Add alarm',
              style: TextStyle(
                color: Color(0xff65d1ba),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60.0),
            GestureDetector(
              onTap: () {
                _selectTime(context);
              },
              child: Text(
                _selectedTime.format(context),
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                circleDay('Mon', context, false),
                circleDay('Tue', context, true),
                circleDay('Wed', context, true),
                circleDay('Thu', context, false),
                circleDay('Fri', context, false),
                circleDay('Sat', context, true),
                circleDay('Sun', context, false),
              ],
            ),
            SizedBox(height: 60.0),
            SizedBox(
              height: 2.0,
              child: Container(color: Colors.white30),
            ),
            ListTile(
              leading: Icon(Icons.notifications_none, color: Colors.white),
              title: Text(
                'Alarm Notifications',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
              child: Container(color: Colors.white30),
            ),
            ListTile(
              leading: Icon(Icons.check_box, color: Colors.white),
              title: Text(
                'Vibrate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
              child: Container(color: Colors.white30),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Theme.of(context).accentColor,
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        backgroundColor: Colors.white,
        child: Icon(
          Icons.delete,
          size: 20.0,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

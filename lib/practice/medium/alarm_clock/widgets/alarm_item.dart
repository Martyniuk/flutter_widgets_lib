// Core
import 'package:flutter/material.dart';

Widget alarmItem(hour, enabled) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  hour,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nexa-Bold',
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sun',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa-Bold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Mon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa-Bold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Tue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa-Bold',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Wed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa-Bold',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Switch.adaptive(
              value: enabled,
              onChanged: (bool val) {
                print('val $val');
              },
              activeColor: Color(0xff65d1ba),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        SizedBox(
          height: 1.0,
          child: Container(
            color: Colors.white30,
          ),
        ),
      ],
    ),
  );
}

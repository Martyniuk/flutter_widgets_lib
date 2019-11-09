// Core
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Models
import '../models/destination_model.dart';
import '../models/activity_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  List<Widget> _buildRatingStars(int rating) {
    List<Widget> stars = [];

    for (int i = 0; i < rating; i++) {
      Widget icon = Icon(Icons.star, color: Colors.black, size: 15.0);
      stars.add(icon);
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.destination.imageUrl),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.search,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.sortAmountDown,
                            size: 25.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white38,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: .5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 25.0,
                bottom: 25.0,
                child: Icon(
                  Icons.location_on,
                  size: 30.0,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];

                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 25.0,
                          top: 20.0,
                          bottom: 20.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: 140.0,
                                            child: Text(
                                              activity.name,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: .5,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            '\$${activity.price}',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'per pax',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    activity.type,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  Row(
                                    children:
                                        _buildRatingStars(activity.rating),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 70.0,
                                        padding: EdgeInsets.all(5.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(activity.startTimes[0]),
                                      ),
                                      SizedBox(width: 10.0),
                                      Container(
                                        width: 70.0,
                                        padding: EdgeInsets.all(5.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(activity.startTimes[1]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25.0,
                      left: 10.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          width: 100.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                          image: AssetImage(activity.imageUrl),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

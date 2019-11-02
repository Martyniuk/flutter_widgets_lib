// Core
import 'package:flutter/material.dart';

var text =
    'Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo ';

var imagebg =
    'https://images.unsplash.com/photo-1476860184138-af609b4e8a3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var image1 =
    'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var image2 =
    'https://images.unsplash.com/photo-1498248193836-88f8c8d70a3f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1491&q=80';
var image3 =
    'https://images.unsplash.com/photo-1494459940152-1e911caa8cc5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
var image4 =
    'https://images.unsplash.com/photo-1474433188271-d3f339f41911?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

var pinkColor = Color(0xFFab00ed);

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: height / 3,
              child: Image.network(
                imagebg,
                fit: BoxFit.cover,
              ),
            ),
            DescriptionSection(),
            ImagesSection(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Flight starts from',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$ 120.00',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    color: pinkColor,
                    onPressed: () {},
                    child: Text(
                      'Book now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: .8,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
        top: 32.0,
        bottom: 16.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Cox's Bazar",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(width: 30.0),
              Container(
                decoration: BoxDecoration(
                  color: pinkColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sea Beach',
                    style: TextStyle(
                      color: pinkColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: pinkColor.withOpacity(0.7),
              ),
              SizedBox(width: 15.0),
              Text(
                'Bangladesh',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              letterSpacing: .5,
              height: 1.8,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Text(
                'Best shots of the week',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  letterSpacing: .4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImagesSection extends StatelessWidget {
  const ImagesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 188.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(image1),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(image2),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(image3),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(image4),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: pinkColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '+24',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

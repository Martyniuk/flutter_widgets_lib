// --> https://dribbble.com/shots/6808965-UI-design-Bicycle-App-UI

import 'package:flutter/material.dart';

// ----- Model

class Product {
  String name;
  String type;
  String imgUrl;
  String price;

  Product(this.name, this.type, this.imgUrl, this.price);
}

List<Product> products = [
  Product("BMW K30", "Bicyle", "assets/images/bicycle_app/bike.png", "999")
];

// ==========

class BicycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = products[0];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 500.0,
            child: LayoutBuilder(
              builder: (BuildContext cxt, BoxConstraints constraints) {
                double w = constraints.maxWidth;
                double h = constraints.maxHeight;

                return Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: w * .9,
                          height: h * .75,
                          color: Color(0xFFFFC5C5),
                        )),
                    Positioned(
                      top: 50,
                      left: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.type,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat-B",
                              fontWeight: FontWeight.w400,
                              letterSpacing: .5,
                            ),
                          ),
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Montserrat-B",
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: h * .32,
                      left: -50,
                      child: Image.asset(
                        product.imgUrl,
                        width: 370,
                        height: 350,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Amazing Speed.',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Montserrat-M",
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Increadible Power.',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "Montserrat-M",
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  'The Top Fuel 9.9 XX1 AXS is built for speed and capability on any terrain.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
                        child: Hero(
                          // for layout purpose - unigue tag will be 'tag'
                          tag: 'tag',
                          child: Container(
                            width: w * .9,
                            height: h * .75,
                            color: Color(0xFFFFC5C5),
                          ),
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
                      child: Hero(
                        tag: product.name,
                        child: Image.asset(
                          product.imgUrl,
                          width: 370,
                          height: 350,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 5.0),
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
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(product: product),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_forward,
                          size: 42.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: 'tag',
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFFC5C5),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 18, right: 25, top: 50, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.shopping_cart, size: 18),
                        ),
                      ],
                    ),
                  ),
                  Hero(
                    tag: product.name,
                    child: Image.asset(product.imgUrl, width: 280, height: 250),
                  ),
                  SizedBox(height: 50),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "Montserrat-B",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      "Top Fuel 9.9 XX1 AXS is top tier full auto"
                      "suspension carbon mountain bike.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "It's also spec's with hight-end RockShox"
                      "suspension and lots of carbon-including"
                      "the wheels, bars, and shift levels. You'll fly"
                      "throught singletrack and rip descents on"
                      "this bike.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Montserrat-M",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: FlatButton(
                          child: Text(
                            'ADD TO CART',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Montserrat-M",
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Core

import 'package:flutter/material.dart';

// -- UTIlS
double baseHeight = 640.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
// -- END Utils

// -- DATA

List<String> sizeNumlist = [
  "7",
  "8",
  "9",
  "10",
];
List<Color> colors = [
  Color(0xFFF9362E),
  Color(0xFF003CFF),
  Color(0xFFFFB73A),
  Color(0xFF3AFFFF),
  Color(0xFF1AD12C),
  Color(0xFFD66400),
];

String desc =
    "Get maximum support, comfort and a refreshed look with these adidas energy cloud shoes for men comes wit a classic style."
    "Boost your running comfort to the next level with this supportive shoe Synthetic upper with FITFRAME midfoot cage for a locked-down fit and feel"
    "Lace-up closure Cushioned footbed CLOUDFOAM midsole provides responsive padding Durable ADIWEAR™ rubber sole.";

// -- END DATA

class AdidasApp extends StatefulWidget {
  @override
  _AdidasAppState createState() => _AdidasAppState();
}

class _AdidasAppState extends State<AdidasApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF696D77), Color(0xFF292C36)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Colors.white, size: screenAwareSize(20.0, context)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Energy Cloud',
            style: TextStyle(
                fontSize: screenAwareSize(18.0, context),
                fontFamily: 'Montserrat-B'),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: screenAwareSize(20.0, context),
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            ProductScreenTopPart(),
            ProductScreenBottomPart(),
          ],
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  @override
  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(275.0, context),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/adidas_app/adidas.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, right: 50.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: screenAwareSize(50.0, context),
                        height: screenAwareSize(50.0, context),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/adidas_app/360.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: screenAwareSize(20.0, context),
                left: screenAwareSize(18.0, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: Color(0xFF949598),
                        fontSize: screenAwareSize(10.0, context),
                        fontFamily: 'Montserrat-M',
                        letterSpacing: .5,
                      ),
                    ),
                    SizedBox(height: screenAwareSize(5.0, context)),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: screenAwareSize(8.0, context),
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: screenAwareSize(6.0, context),
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: screenAwareSize(12.0, context),
                              fontFamily: 'Montserrat-M'),
                        ),
                        SizedBox(
                          width: screenAwareSize(6.0, context),
                        ),
                        Text(
                          '(378 People)',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat-M'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  String selectedSize;
  int _counter = 1;
  Color selectedColor;

  void _counterIncrease() {
    if (_counter < 20) {
      setState(() {
        _counter++;
      });
    }
  }

  void _counterDecrease() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void _selectColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18.0, context),
            ),
            child: Text(
              'Product description',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: 'Montserrat-M',
                letterSpacing: .5,
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(26.0, context),
              right: screenAwareSize(18.0, context),
            ),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: 'Montserrat-M',
                ),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: 'Montserrat-M',
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 400),
            ),
          ),
          GestureDetector(
            onTap: () {
              _expand();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18.0, context),
              ),
              child: Text(
                isExpanded ? 'less' : 'more...',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: screenAwareSize(12.0, context)),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18.0, context),
              right: screenAwareSize(80.0, context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: 'Montserrat-B',
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                  ),
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: 'Montserrat-B',
                    fontWeight: FontWeight.w500,
                    letterSpacing: .7,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenAwareSize(5.0, context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenAwareSize(22.0, context)),
            child: Row(
              children: <Widget>[
                Row(
                  children: sizeNumlist.map((String item) {
                    bool isSelected = item == selectedSize;

                    return GestureDetector(
                      onTap: () {
                        _selectSize(item);
                      },
                      child: _sizeItem(item, isSelected),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: screenAwareSize(30.0, context),
                ),
                Container(
                  width: screenAwareSize(100.0, context),
                  height: screenAwareSize(30.0, context),
                  decoration: BoxDecoration(
                    color: Color(0xFF525663),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            _counterDecrease();
                          },
                          child: Container(
                            // height: double.infinity,
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(18.0, context),
                                  fontFamily: 'Montserrat-M',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _divider(),
                      Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            // height: double.infinity,
                            child: Center(
                              child: Text(
                                _counter.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(18.0, context),
                                  fontFamily: 'Montserrat-M',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _divider(),
                      Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            _counterIncrease();
                          },
                          child: Container(
                            // height: double.infinity,
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(18.0, context),
                                  fontFamily: 'Montserrat-M',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenAwareSize(12.0, context)),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text(
              'Select Color:',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: 'Montserrat-M',
                letterSpacing: .5,
              ),
            ),
          ),
          SizedBox(height: screenAwareSize(5.0, context)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenAwareSize(22.0, context),
            ),
            child: Row(
              children: colors.map((Color color) {
                bool isSelected = selectedColor == color;

                return GestureDetector(
                  onTap: () {
                    _selectColor(color);
                  },
                  child: _colorItem(color, isSelected),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: screenAwareSize(5.0, context)),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20.0, context)),
            child: Text(
              'Price',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: 'Montserrat-M',
                letterSpacing: .5,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(120, context),
            child: Stack(
              // alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22.0, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenAwareSize(18.0, context)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(26.0, context),
                                fontFamily: 'Montserrat-M',
                              ),
                            ),
                            Text(
                              '80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(35.0, context),
                                fontFamily: 'Montserrat-M',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenAwareSize(10.0, context)),
                      MaterialButton(
                        color: Color(0xFFFB382F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        // clipBehavior: Clip.antiAlias,
                        onPressed: () {},
                        padding: EdgeInsets.symmetric(
                            horizontal: screenAwareSize(25.0, context),
                            vertical: screenAwareSize(14.0, context)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat-M',
                              fontSize: screenAwareSize(14.0, context),
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -40.0,
                  right: -35.0,
                  child: Image.asset(
                    'assets/images/adidas_app/cart.png',
                    width: screenAwareSize(190, context),
                    height: screenAwareSize(155, context),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorItem(Color color, bool isSelected) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
            color: isSelected ? Colors.black54 : Colors.black12,
          ),
        ],
      ),
      child: ClipPath(
        clipper: SelectColorClipper(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _sizeItem(String size, bool isSelected) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red[400] : Color(0xFF696D77),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
            color: isSelected ? Colors.black54 : Colors.black12,
          ),
        ],
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenAwareSize(14, context),
            fontFamily: 'Montserrat-R',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black54,
      ),
    );
  }
}

class SelectColorClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width / 2 - 5, size.height);
    path.lineTo(size.width, size.height / 2 - 10);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

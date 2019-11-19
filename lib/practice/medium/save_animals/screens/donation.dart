import 'package:flutter/material.dart';

import '../models/animal.dart';

class DonationScreen extends StatefulWidget {
  final Animal animal;
  DonationScreen({Key key, @required this.animal}) : super(key: key);

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _textController = TextEditingController();
  String _paymentPeriod = 'One - time';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textController.dispose();
    super.dispose();
  }

  void _setTextValue(String input) {
    _textController.text = input;
  }

  void _setPaymentPeriod(String input) {
    setState(() {
      _paymentPeriod = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate to protect ${widget.animal.animal}'),
        backgroundColor: Color.fromRGBO(45, 45, 45, 1.0),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.animal.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
            child: Text(
              'The Lion (Panthera leo) has been disappearing from the wild at a rapid rate. In the last 21 years, equivalent to just three lion generations, their population has plummeted by an estimated 43%. Today, lions are extinct in 26 African countries with less than an estimated 30,000 wild lions remaining.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black45, height: 1.2, letterSpacing: .4),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/save_animals/sky_1.jpg'),
              ),
            ),
            child: Center(
              child: Container(
                width: 300.0,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, .3),
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 70.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 5.0,
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  _setTextValue('\20');
                                });
                              },
                              child: Text('\$20'),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 70.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 5.0,
                              onPressed: () {
                                setState(() {
                                  _setTextValue('\50');
                                });
                              },
                              color: Colors.white,
                              child: Text('\$50'),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 70.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: 5.0,
                              onPressed: () {
                                setState(() {
                                  _setTextValue('\100');
                                });
                              },
                              color: Colors.white,
                              child: Text('\$100'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 250.0,
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.blueAccent),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            prefixIcon: Icon(Icons.attach_money),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.send,
                          controller: _textController,
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 70.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: _paymentPeriod == 'One - time' ? 5.0 : 1.0,
                              onPressed: () {
                                _setPaymentPeriod('One - time');
                              },

                              color: Colors.white,
                              child: Text('One - time'),
                            ),
                          ),
                          ButtonTheme(
                            minWidth: 70.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              elevation: _paymentPeriod == 'Monthly' ? 5.0 : 1.0,
                              onPressed: () {
                                _setPaymentPeriod('Monthly');
                              },
                              color: Colors.white,
                              child: Text('Monthly'),
                            ),
                          )
                        ],
                      ),
//                      ButtonBar(
//                        alignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          ButtonTheme(
//                            minWidth: 70.0,
//                            child: RaisedButton(
//                              shape: RoundedRectangleBorder(
//                                side: BorderSide(
//                                  color: Colors.white,
//                                  width: 2.0,
//                                ),
//                                borderRadius: BorderRadius.circular(5.0),
//                              ),
////                              elevation: _paymentPeriod == 'One - time' ? 2.0 : 5.0,
//                              onPressed: () {
//                                _setPaymentPeriod('One - time');
//                              },
//
//                              color: _paymentPeriod == 'One - time' ? Colors.white : Colors.transparent,
//                              child: Text('One - time'),
//                            ),
//                          ),
//                          ButtonTheme(
//                            minWidth: 70.0,
//                            child: RaisedButton(
//                              shape: RoundedRectangleBorder(
//                                side: BorderSide(
//                                  color: Colors.white,
//                                  width: 2.0,
//                                ),
//                                borderRadius: BorderRadius.circular(5.0),
//                              ),
////                              elevation: _paymentPeriod == 'Monthly' ? 2.0 : 5.0,
//                              onPressed: () {
//                                _setPaymentPeriod('Monthly');
//                              },
//                              color: _paymentPeriod == 'Monthly' ? Colors.white : Colors.transparent,
//                              child: Text('Monthly'),
//                            ),
//                          )
//                        ],
//                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

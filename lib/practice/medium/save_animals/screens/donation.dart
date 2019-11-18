import 'package:flutter/material.dart';

import '../models/animal.dart';

class DonationScreen extends StatelessWidget {
  final Animal animal;
  DonationScreen({Key key, @required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate to protect ${animal.animal}'),
        backgroundColor: Color.fromRGBO(45, 45, 45, 1.0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(animal.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Text(
              'The Lion (Panthera leo) has been disappearing from the wild at a rapid rate. In the last 21 years, equivalent to just three lion generations, their population has plummeted by an estimated 43%. Today, lions are extinct in 26 African countries with less than an estimated 30,000 wild lions remaining.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black45, height: 1.2, letterSpacing: .4),
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/save_animals/sky_1.jpg'),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 300.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, .3),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: <Widget>[Row()],
                    ),
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

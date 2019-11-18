import 'package:flutter/material.dart';

import 'donation.dart';
import '../models/animal.dart';

List<Animal> data = [
  Animal('WHALE', 'assets/images/save_animals/whale.jpg'),
  Animal('ELEPHANT', 'assets/images/save_animals/elephant.jpg'),
  Animal('LION', 'assets/images/save_animals/lion_2.jpg'),
  Animal('PINK PELICAN', 'assets/images/save_animals/pink_pelican.jpg'),
];

class ListNeeded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 45, 45, 1.0),
        title: Text('Save Animal'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            var item = data[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationScreen(animal: item),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(0.0, 3.0),
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          width: 350.0,
                          height: 230.0,
                          fit: BoxFit.cover,
                          image: AssetImage(item.image),
                        ),
                      ),
                      Positioned.fill(
                        bottom: -140.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${item.animal} PROTECTION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            Text(
                              'DONATE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/list_needed.dart';

class SaveAnimals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Color.fromRGBO(45, 45, 45, 1.0),
        title: Text(''),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.security),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/save_animals/earth_1.jpg'),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  height: 150.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0,
                        offset: Offset(0.0, 2.0),
                        color: Colors.grey,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/save_animals/lion_2.jpg',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Elephants, rhinos, lions, giraffe and other amazing wild animals in Southern Africa are struggling. The poaching crisis, diminishing reserve budgets and a lack of wild space are all having disastrous affects.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListNeeded(),
                      ),
                    );
                  },
                  child: Text('SEE A LIST OF WHAT\'S MOST NEEDED'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

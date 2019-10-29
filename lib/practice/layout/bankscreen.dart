import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter play with',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final df = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Statement',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    'Current Balance',
                    style: TextStyle(color: Colors.black54, fontSize: 16.0),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  '\$ 4374.23',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 80.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.deepOrange[300], Colors.pink[300]]),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Cards',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Last 6 month',
                    style: TextStyle(color: Colors.white54),
                  ),
                  trailing: Text(
                    '${String.fromCharCode(0x20AC)} 3284.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                width: double.infinity,
                height: 80.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green[100], Colors.blue[500]]),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Bank',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    'Last 6 month',
                    style: TextStyle(color: Colors.white54),
                  ),
                  trailing: Text(
                    '${String.fromCharCode(0x20AC)} 3284.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Text(
                      'Transactions',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0.0),
                    textColor: Colors.blueAccent[100],
                    splashColor: Colors.blueAccent[100],
                    shape: StadiumBorder(),
                    onPressed: () {},
                    child: Text('View All'),
                  ),
                ],
              ),
              Card(
                elevation: 3.0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Divider(),
                      ),
                      TransactionItem(
                        'Bank America',
                        df.format(DateTime.now()),
                        '${String.fromCharCode(0x20AC)} 4374.23',
                        'DBBL - Citi Bank',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String opperationName;
  final String date;
  final String amount;
  final String other;

  TransactionItem(this.opperationName, this.date, this.amount, this.other);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Text(opperationName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black54,
            )),
      ),
      subtitle: Text(
        date,
        style: TextStyle(color: Colors.grey, fontSize: 16.0),
      ),
      trailing: Column(
        children: <Widget>[
          Text(
            amount,
            style: TextStyle(
              color: Colors.blue[300],
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            other,
            style: TextStyle(
                color: Colors.grey, fontSize: 14.0, letterSpacing: 1.0),
          ),
        ],
      ),
    );
  }
}

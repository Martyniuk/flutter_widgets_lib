// Core
import 'package:flutter/material.dart';

// Model
import './transaction.dart';

class ExpensePlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'new Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'new Second Transaction',
      amount: 59.99,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Planner')),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5.0,
                child: Center(
                  child: Text(
                    'Chart!',
                  ),
                ),
              ),
            ),
            Text(
              'Chart! _ 2',
            ),
            Column(
              children: transactions.map((Transaction tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

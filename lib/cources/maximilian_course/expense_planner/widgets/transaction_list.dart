// Core
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 50),
                Image(
                  image:
                      AssetImage('assets/images/maximilian_course/waiting.png'),
                  height: constraints.maxHeight * 0.6,
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              Transaction transaction = transactions[index];

              return Card(
                elevation: 6.0,
                margin: EdgeInsets.all(12.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: FittedBox(
                          child: Text(
                              '\$${transaction.amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? FlatButton.icon(
                          label: Text('Delete'),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTx(transaction.id);
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.delete,
                              color: Theme.of(context).errorColor),
                          onPressed: () {
                            deleteTx(transaction.id);
                          },
                        ),
                ),
              );
            },
          );
  }
}

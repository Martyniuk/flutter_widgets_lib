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
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 50),
                Image(
                  image:
                      AssetImage('assets/images/maximilian_course/waiting.png'),
                  height: 150.0,
                )
              ],
            )
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).errorColor),
                      onPressed: () {
                        deleteTx(transaction.id);
                      },
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10.0,
                //           horizontal: 15.0,
                //         ),
                //         padding: EdgeInsets.all(10.0),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 1.0,
                //             color: Colors.purpleAccent,
                //           ),
                //           borderRadius: BorderRadius.circular(10.0),
                //         ),
                //         child: Text(
                //           '\$${transaction.amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               fontSize: 20.0,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.purple),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transaction.title,
                //             style: Theme.of(context).textTheme.title,
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transaction.date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}

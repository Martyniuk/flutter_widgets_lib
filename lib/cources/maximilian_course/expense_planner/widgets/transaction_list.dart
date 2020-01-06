// Core
import 'package:flutter/material.dart';

// Models
import '../models/transaction.dart';

// Widgets
import 'transaction_item.dart';

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
                const SizedBox(height: 50),
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
              // children vs builder approach
              return TransactionItem(
                key: ValueKey(transaction.id),
                transaction: transaction,
                deleteTx: deleteTx,
              );
            },
          );
  }
}

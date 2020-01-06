import 'dart:math';
// Core
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTx;

  TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor =
        availableColors[Random().nextInt(4)]; // 0,1,2,3 -- max is excluded
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                onPressed: () {
                  widget.deleteTx(widget.transaction.id);
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {
                  widget.deleteTx(widget.transaction.id);
                },
              ),
      ),
    );
  }
}

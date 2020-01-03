// Core
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Widgets
import 'adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 10.0,
          right: 10.0,
          // bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Platform.isIOS
                ? CupertinoTextField(
                    controller: _titleController,
                    placeholder: 'Title',
                    onSubmitted: (String _) => _submitData(),
                  )
                : TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    onSubmitted: (String _) => _submitData(),
                  ),
            Platform.isIOS ? SizedBox(height: 20.0) : Container(),
            Platform.isIOS
                ? CupertinoTextField(
                    controller: _titleController,
                    placeholder: 'Amount',
                    onSubmitted: (String _) => _submitData(),
                  )
                : TextField(
                    controller: _amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (String _) => _submitData(),
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
            SizedBox(height: 20.0),
            Container(
              height: 70.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen! yet.'
                        : DateFormat.yMd().format(_selectedDate)),
                  ),
                  AdaptiveFlatButton(
                    text: 'Chose date',
                    handler: _presentDatePicker,
                  ),
                ],
              ),
            ),
            Spacer(),
            Platform.isIOS
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: CupertinoButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        _presentDatePicker();
                      },
                      child: Text(
                        'Add Transcation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : RaisedButton(
                    onPressed: _submitData,
                    textColor: Theme.of(context).textTheme.button.color,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Add Transcation',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// Core
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Models
import '../models/transaction.dart';
// Widget
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      sum += item['amount'];

      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            double spending = totalSpending == 0.0
                ? 0.0
                : (data['amount'] as double) / totalSpending;

            return Expanded(
              // fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal: spending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

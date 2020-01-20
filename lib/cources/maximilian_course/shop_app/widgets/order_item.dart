// Core
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Providers
import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {},
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
          ),
        ],
      ),
    );
  }
}

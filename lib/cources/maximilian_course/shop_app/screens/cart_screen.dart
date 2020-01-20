// Core
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
// Widgets
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalQuantity}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      'Order NOW',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Orders providerOrders =
                          Provider.of<Orders>(context, listen: false);

                      providerOrders.addOrder(
                        cart.items.values.toList(),
                        cart.totalQuantity,
                      );

                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) {
                var item = cart.items.values.toList()[index];

                return CartItem(
                  item.id,
                  cart.items.keys.toList()[index],
                  item.price,
                  item.quantity,
                  item.title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

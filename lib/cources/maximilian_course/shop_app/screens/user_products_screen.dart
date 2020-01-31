// Core
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import '../providers/products.dart';
import '../providers/product.dart';
// Widget
import '../widgets/user_product_item.dart';
import '../widgets/drawer.dart';
// Screens
import '../screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const String routeName = '/user_products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    print('prodicts data length ${productsData.items.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, index) {
            Product product = productsData.items[index];

            return Column(
              children: <Widget>[
                UserProductItem(product.id, product.title, product.imageUrl),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}

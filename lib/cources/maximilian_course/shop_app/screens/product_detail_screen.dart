// Core
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Provider
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments
        as String; // pass ID thru Navigation arguments
    final product = Provider.of<Products>(context, listen: false)
        .fintById(productId); // get Products from Provider

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}

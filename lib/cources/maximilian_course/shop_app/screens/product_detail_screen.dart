// Core
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product_detail';
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context).settings.arguments
        as String; // pass ID thru Navigation arguments
    // .. get data by id;
    return Scaffold(
      appBar: AppBar(
        title: Text('t'),
      ),
    );
  }
}

// Core
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Providers
import '../providers/product.dart';
import '../providers/cart.dart';
// Screens
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(
      context,
      listen: false,
    ); // 1 - first approach
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Consumer<Product>(
              builder: (ctx, product, child) {
                return Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                );
              },
              child: Text('Text never changes'),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          backgroundColor: Colors.black54,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
        ),
      ),
    );
  }
}

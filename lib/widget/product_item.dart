import 'package:flutter/material.dart';
import 'package:online_shopper/models/product.dart';
import 'package:online_shopper/providers/cart.dart';
import 'package:online_shopper/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:online_shopper/screens/cart_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);


    return GridTile(
        footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(product.title, textAlign: TextAlign.center,),
        leading: Consumer<Product>(
          builder: (context, product, _) =>
          IconButton(icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border), onPressed: () {
            setState((){
              product.toggleFavoriteProduct();
            });
          },
            color: Colors.deepOrange,
          ),
        ),
        trailing: IconButton(icon: const Icon(Icons.shopping_cart,), onPressed: () {
          cart.addItems(product.id, product.title, product.price);
        },
          color: Colors.deepOrange,
        ),

      ),
        child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ProductDetailScreen.id, arguments: product.title);
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover,)),
    );
  }
}

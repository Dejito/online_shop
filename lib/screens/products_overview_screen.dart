import 'package:flutter/material.dart';
// import 'package:online_shopper/models/product.dart';
import 'package:online_shopper/widget/products_grid.dart';
import 'package:provider/provider.dart';
import '../widget/products_grid.dart';
import 'package:online_shopper/widget/badge.dart';
import 'package:online_shopper/providers/cart.dart';
import 'package:online_shopper/screens/cart_screen.dart';


enum FilterOptions {favorite, all}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  static const String id = 'productsOverviewScreen';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
     @override
  Widget build(BuildContext context) {
      final cartItems = Provider.of<Cart>(context);
       bool showFavs = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
        actions: <Widget> [
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(
                  value: cartItems.numberOfItems.toString(),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,),
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.id);
                    },
                  ), ),

          ),
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue){
                setState((){
                  if(selectedValue == FilterOptions.favorite) {
                    showFavs = true;
                  } else {
                    showFavs = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_){ return
                [
                  const PopupMenuItem(value: FilterOptions.favorite, child: Text('Favourites')),
                  const PopupMenuItem(value: FilterOptions.all, child: Text('All'),),
                ];
              } ),
          ],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: ProductsGrid(showFavs),
      ),
    );
  }
}


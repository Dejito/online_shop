import 'package:online_shopper/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_shopper/models/product.dart';
import '../models/product.dart';
import 'package:online_shopper/models/product.dart';


class ProductDetailScreen extends StatelessWidget {

  static String id = 'productDetailScreen';
  ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute?.of(context)?.settings.arguments as String;
      final loadedProduct = Provider.of<Product>(context);
        return Scaffold(
           appBar: AppBar(
          title:  Text(productId)
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<Products>(builder: (BuildContext context, product, Widget? child) {
                return Container(
                height: 300,
                width: double.infinity,
          child: Image.network(loadedProduct.imageUrl),
          );
          },
                ),
              ],
                ),
                ),
        );
  }
}
// <Product>(builder: (BuildContext context, product, child)
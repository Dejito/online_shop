import 'package:flutter/material.dart';
import 'package:online_shopper/widget/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';


class ProductsGrid extends StatelessWidget {

  final bool showFavs;

  ProductsGrid (this.showFavs);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<Products>(context);
    final products = showFavs ? productData.getFavoriteItems : productData.items ;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder: (context, index){
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
      itemCount: products.length,
    );
  }
}

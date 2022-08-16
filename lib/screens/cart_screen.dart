import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_shopper/providers/cart.dart';
import 'package:online_shopper/widget/cart_item.dart' as ci;
import 'package:online_shopper/providers/orders.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String id = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
        elevation: 0.5,
        ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                    const Text('Total', style: TextStyle(fontSize: 20),),
                  const Spacer(),
                  Chip(label: Text('\$${cart.totalAmount}'),
                  backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                      onPressed: (){
                        Provider.of<Orders>(context).addOrder(cart.items.values.toList(), cart.totalAmount);
                  }, child: const Text('ORDER NOW')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ci.CartItem(
                  productId: cart.items.keys.toList()[index],
                  id: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity,
                  price: cart.items.values.toList()[index].price,
                  title: cart.items.values.toList()[index].title
              );},
            itemCount: cart.numberOfItems,
            ),
          ),
        ],
        ),
    );
  }
}

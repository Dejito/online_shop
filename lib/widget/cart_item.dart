import 'package:flutter/material.dart';
import 'package:online_shopper/providers/cart.dart';
// import 'package:online_shopper/widget/cart_item.dart';
import 'package:provider/provider.dart';
// import 'package:online_shopper/providers/products_provider.dart';

class CartItem extends StatelessWidget {

  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

    CartItem({required this.id, required this.quantity, required this.price, required this.title, required this.productId, });

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: ValueKey(id),
      background: Container(color: Theme.of(context).errorColor,
        margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4
        ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(Icons.delete,
      color: Colors.white,
        size: 40,
      ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(child: Padding(padding: const EdgeInsets.all(5),
              child: FittedBox(child:Text('\$$price'),
                  ),
            ),
              ),
            title: Text(title),
            subtitle: Text('Total: \$${(price*quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

// Image.network(Provider.of<Products>(context).items.toList().single.imageUrl)
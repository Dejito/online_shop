import 'package:flutter/material.dart';
import 'package:online_shopper/providers/orders.dart';
import 'package:online_shopper/screens/products_overview_screen.dart';
import 'package:online_shopper/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:online_shopper/screens/product_detail_screen.dart';
import 'package:online_shopper/providers/cart.dart';
import 'package:online_shopper/screens/cart_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> Products()),
      ChangeNotifierProvider(create: (context) => Cart()),
      ChangeNotifierProvider.value(value: Orders()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        initialRoute: ProductsOverviewScreen.id,
        routes: {
          ProductsOverviewScreen.id: (context) =>  ProductsOverviewScreen(),
          ProductDetailScreen.id: (context) =>  ProductDetailScreen(),
          CartScreen.id: (context) => CartScreen(),

        },
      ),
    );
  }
}



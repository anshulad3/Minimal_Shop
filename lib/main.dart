import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // To Listen the Changes of the Product
      ChangeNotifierProvider(create: (context) => Shop()),
      // To Listen changes in Theme
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

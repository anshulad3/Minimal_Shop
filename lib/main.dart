import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'models/shop.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'themes/theme_provider.dart';

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

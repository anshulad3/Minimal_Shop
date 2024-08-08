import 'package:flutter/material.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/themes/theme.dart';
import 'package:minimal_shop/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Shop()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: MyApp(),
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

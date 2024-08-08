import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';

class Shop extends ChangeNotifier {
  //prduct for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "Regular Fit Led Zapplin Hoodie",
      price: 2299.00,
      description: 'Long-sleeved hoodie in midweight sweatshirt fabric.',
      imagePath: 'lib/images/hoodie2.png',
    ),

    //product 2
    Product(
      name: 'Loose Jeans',
      price: 2299.00,
      description: 'All you need to conquer the full denim look.',
      imagePath: 'lib/images/jeans.png',
    ),

    //product 3
    Product(
      name: 'Regular Fit Printed resort shirt',
      price: 1299.00,
      description: 'Regular fit for comfortable wear and a classic silhouette.',
      imagePath: 'lib/images/shirt.png',
    ),

    //product 4
    Product(
      name: 'Rectangular sunglasses',
      price: 799.00,
      description:
          "Rectangular sunglasses with plastic frames, lenses and sidepieces. Tinted, UV-protective lenses.",
      imagePath: 'lib/images/glasses.png',
    ),
  ];
  //user cart

  List<Product> _cart = [];

  //get product

  List<Product> get shop => _shop;

  // get user cart

  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeProduct(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}

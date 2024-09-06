import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';

class Shop extends ChangeNotifier {
  //prduct for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "Regular Fit Led Zappelin Hoodie",
      price: 2299.00,
      description:
          "Long-sleeved hoodie in midweight sweatshirt fabric with a soft brushed inside. Kangaroo pocket, double-layered drawstring hood with a wrapover front, and ribbing at the cuffs and hem. Regular fit for comfortable wear and a classic silhouette.",
      imagePath: 'lib/images/hoodie2.png',
      category: "Hoodie",
    ),

    //product 2
    Product(
      name: 'Loose Jeans',
      price: 2299.00,
      description:
          "5-pocket jeans in rigid cotton denim with a rounded leg and a loose fit from the seat to the hem with a dropped crotch and extra room around the whole leg. Regular waist and a zip fly. All you need to conquer the full denim look.",
      imagePath: 'lib/images/jeans.png',
      category: "Jean",
    ),

    //product 3
    Product(
      name: 'Regular Fit Printed resort shirt',
      price: 1299.00,
      description:
          "Shirt in a printed cotton weave with a resort collar, French front and a yoke at the back. Short sleeves and a straight-cut hem. Regular fit for comfortable wear and a classic silhouette.",
      imagePath: 'lib/images/shirt.png',
      category: "Shirt",
    ),

    //product 4
    Product(
      name: 'Rectangular sunglasses',
      price: 799.00,
      description:
          "Rectangular sunglasses with plastic frames, lenses and sidepieces. Tinted, UV-protective lenses.",
      imagePath: 'lib/images/glasses.png',
      category: "Spec",
    ),
  ];
  //user cart

  List<CartItem> _cart = [];

  //get product

  List<Product> get shop => _shop;

  // get user cart

  List<CartItem> get cart => _cart;

  //add item to cart
  void addToCart(Product item, int quantity) {
    int len = _cart.length;
    bool flag = false;
    for (int i = 0; i < len; i++) {
      if (_cart[i].product.name == item.name) {
        flag = true;
        _cart[i].quantity += quantity;
        break;
      }
    }
    if (!flag) {
      _cart.add(CartItem(product: item, quantity: quantity));
    }
    notifyListeners();
  }

  //remove item from cart
  void removeProduct(CartItem item) {
    int len = _cart.length;
    for (int i = 0; i < len; i++) {
      if (_cart[i].product.name == item.product.name) {
        _cart[i].quantity--;
      }
    }
    notifyListeners();
  }

  void deleteProduct(CartItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  int get totalItemInCart {
    return _cart.fold(0, (sum, item) => sum + item.quantity);
  }

  int get totalPriceofCart {
    return _cart.fold(
        0, (sum, item) => sum + item.quantity * (item.product.price).toInt());
  }
}

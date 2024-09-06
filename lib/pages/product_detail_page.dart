import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../components/my_button.dart';
import '../models/product.dart';
import '../models/shop.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  // ADD to CART FUNCTION
  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.product, quantityCount);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(),
            textAlign: TextAlign.start,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Item Count of Cart
    final int cartItemCount = Provider.of<Shop>(context).totalItemInCart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: cartItemCount > 0
                    ? Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$cartItemCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // listview of Products details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.product.imagePath,
                    height: 400,
                  ),

                  const SizedBox(height: 5),

                  // product name
                  Text(
                    widget.product.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // description
                  Text(
                    "Description",
                    style: GoogleFonts.dmSerifDisplay(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.product.description,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                // price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${widget.product.price}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        // quantity count
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        // plus button
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // add to cart button
                MyButton(
                  onTap: addToCart,
                  text: "Add to Cart",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_shop/components/cart_tiles.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Pay Button Dialog Box
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
            "User wants to Pay!! Connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    // get total amount of products in cart
    final int cartPrice = Provider.of<Shop>(context).totalPriceofCart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Your Cart',
          style: GoogleFonts.dmSerifDisplay(
            fontWeight: FontWeight.w100,
          ),
        ),
      ),

      // Main Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("Your cart is empty")) // If Cart is Empty
                // When Cart have product
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual item in cart
                      final item = cart[index];

                      // return as a cart tile UI
                      return CartTiles(
                        product: item,
                      );
                    },
                  ),
          ),

          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Amount display
                Text(
                  "Total Amount",
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "₹ ${cartPrice.toString()}",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              text: "Pay Now",
            ),
          ),
        ],
      ),
    );
  }
}

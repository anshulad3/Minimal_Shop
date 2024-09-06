import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/shop.dart';
import '../pages/product_detail_page.dart';

class CartTiles extends StatefulWidget {
  final CartItem product;
  const CartTiles({
    super.key,
    required this.product,
  });

  @override
  State<CartTiles> createState() => _CartTilesState();
}

class _CartTilesState extends State<CartTiles> {
  // Decrease Quantity from Cart
  void removeFromCart() {
    if (widget.product.quantity > 1) {
      final shop = context.read<Shop>();
      shop.removeProduct(widget.product);
    } else {
      deleteFromCart();
    }
  }

  // Delete Directly from Cart
  void deleteFromCart() {
    final shop = context.read<Shop>();

    shop.deleteProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Sidable panel for deletion
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          // Decrement
          SlidableAction(
            onPressed: ((context) {
              removeFromCart();
            }),
            icon: Icons.remove,
            label: "Remove",
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),

          // Delete
          SlidableAction(
            onPressed: ((context) {
              deleteFromCart();
            }),
            icon: Icons.delete,
            label: "Delete",
            backgroundColor: Theme.of(context).colorScheme.surface,
          )
        ],
      ),

      // Cart body in Container
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with Redirection to product page
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailPage(product: widget.product.product),
                  ),
                );
              },
              child: SizedBox(
                height: 120,
                child: Image.asset(
                  widget.product.product.imagePath,
                ),
              ),
            ),

            const SizedBox(
              width: 20,
            ),

            // Other aspects
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Product name
                Text(
                  widget.product.product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),

                // Quantity
                Text(
                  "Quantity : ${widget.product.quantity}",
                  style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Row(
                  children: [
                    // Product Price * quantity
                    Text(
                      "Price: ₹ ${widget.product.product.price} * ${widget.product.quantity} =",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      " ₹ ${widget.product.product.price * widget.product.quantity}",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

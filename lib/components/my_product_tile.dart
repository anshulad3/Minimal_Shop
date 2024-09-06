import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product.dart';
import '../pages/product_detail_page.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // Product Page Tile
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            AspectRatio(
              aspectRatio: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(0),
                child: Image.asset(product.imagePath),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //product name
            Text(
              product.name,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            // Product Price
            Text(
              '₹ ${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

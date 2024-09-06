import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../components/my_drawer.dart';
import '../components/my_product_tile.dart';
import '../models/product.dart';
import '../models/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  TextEditingController searchController = TextEditingController();
  List<Product> filterredProducts = [];

  // For Filtering using Search Bar
  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final shop = context.read<Shop>().shop;
    setState(() {
      filterredProducts = shop.where((product) {
        final query = searchController.text.toLowerCase();
        return product.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  // Filter Using the Buttons
  void _filterByCategory(String category) {
    final shop = context.read<Shop>().shop;
    setState(() {
      filterredProducts = shop.where((product) {
        print('Filtering for category: $category');
        print('Product category: ${product.category}');
        return product.category == category;
      }).toList();
      print('Filter products count: ${filterredProducts.length}');
    });
  }

  // Clearing all Filter
  void _clearfilters() {
    setState(() {
      searchController.clear();
      filterredProducts = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final shop = context.watch<Shop>().shop;

    // cart item count
    final int cartItemCount = Provider.of<Shop>(context).totalItemInCart;

    // filter process
    final productToShow =
        filterredProducts.isEmpty && searchController.text.isEmpty
            ? shop
            : filterredProducts;

    // Body
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(
            "Trend Gallery",
            style: GoogleFonts.dmSerifDisplay(
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        actions: [
          // Cart button
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
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
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

      // Drawer
      drawer: const MyDrawer(),

      // Main Body
      body: Column(
        children: [
          const SizedBox(height: 5),

          // Search Bar
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Product",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Buttons for Filter
          Container(
            height: 55,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: _clearfilters,
                    child: Text(
                      "All",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 2,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _filterByCategory("Jean");
                    },
                    child: Text(
                      "Jean's",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 2,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _filterByCategory("Hoodie");
                    },
                    child: Text(
                      "Hoodie's",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 2,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _filterByCategory("Shirt");
                    },
                    child: Text(
                      "Shirt's",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 2,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _filterByCategory("Spec");
                    },
                    child: Text(
                      "Spec's",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation: 2,
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 11),

          // Product List
          SizedBox(
            height: 600,
            child: GridView.builder(
              itemCount: productToShow.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                mainAxisExtent: 320,
              ),
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                //get each individual product from shop
                final product = productToShow[index];
                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

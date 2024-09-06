import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';
import 'my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header : logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              // shop tile

              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop_page');
                },
              ),
              //cart tile

              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              //Theme Changer

              MyListTile(
                text: "Theme",
                icon: Icons.color_lens,
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ],
          ),
          //exit

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}

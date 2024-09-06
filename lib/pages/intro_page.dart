import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),
            //title
            Text(
              "UrbanAttire",
              style: GoogleFonts.dmSerifDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text(
              "Premium Quality Cloths at your Finger Tips",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w600,
              ),
            ),

            //button
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                text: "Get Started",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

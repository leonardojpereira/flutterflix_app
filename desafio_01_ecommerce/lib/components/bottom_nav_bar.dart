import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Color.fromARGB(255, 122, 122, 122),
          activeColor: Color.fromARGB(255, 255, 255, 255),
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(icon: Icons.home, text: 'Shop'),
            GButton(icon: Icons.shopping_cart_sharp, text: 'Cart')
          ]),
    );
  }
}

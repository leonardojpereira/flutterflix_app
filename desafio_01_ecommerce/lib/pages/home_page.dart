// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_05_ecommerce/components/bottom_nav_bar.dart";
import "package:flutter_05_ecommerce/pages/cart_page.dart";
import "package:flutter_05_ecommerce/pages/intro_page.dart";
import "package:flutter_05_ecommerce/pages/shop_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
     ShopPage(),
     CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
            children: [
               DrawerHeader(child: Image.asset('lib/images/nike_logo.png', color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => IntroPage())
                ),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white,),
                  title: Text('Home', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('About', style: TextStyle(color: Colors.white),),
              ),
            ),
            ],
           ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

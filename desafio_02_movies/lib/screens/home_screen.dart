import 'package:desafio_02_movies/components/drawer.dart';
import 'package:desafio_02_movies/components/home_body.dart';
import 'package:desafio_02_movies/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          height: 49,
          filterQuality: FilterQuality.high,
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen())),
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
                size: 30,
              ),),
        ],
      ),
      drawer: const DrawerWidget(),
      body: const HomeBody(),
    );
  }
}

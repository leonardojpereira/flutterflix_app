import 'package:desafio_02_movies/modules/movies/pages/favorite_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoriteScreen(),
            ),
          ),
          icon: const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 30,
          ),
        ),
      ],
    );
  }
}

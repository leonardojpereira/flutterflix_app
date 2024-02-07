import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Corrigindo a lógica para alternar o estado de isFavorite
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red : Colors.grey[400],
        size: 34,
      ),
    );
  }
}

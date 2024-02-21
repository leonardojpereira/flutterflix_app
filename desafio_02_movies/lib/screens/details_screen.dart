import 'dart:convert';

import 'package:desafio_02_movies/components/details_body.dart';
import 'package:desafio_02_movies/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailsScreen extends StatefulWidget {
  final Movie movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  Future<void> checkFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.containsKey(widget.movie.id.toString());
    });
  }

Future<void> toggleFavoriteStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> favoriteIds = prefs.getStringList('favoriteMovies') ?? [];
  if (isFavorite) {
    // Remove o filme dos favoritos
    prefs.remove(widget.movie.id.toString());
    favoriteIds.remove(widget.movie.id.toString());
  } else {
    // Adiciona o filme aos favoritos se ainda não estiver na lista
    if (!favoriteIds.contains(widget.movie.id.toString())) {
      favoriteIds.add(widget.movie.id.toString());
      prefs.setString(widget.movie.id.toString(), jsonEncode(widget.movie.toJson()));
    }
  }
  prefs.setStringList('favoriteMovies', favoriteIds);
  setState(() {
    isFavorite = !isFavorite;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        movie: widget.movie,
        isFavorite: isFavorite,
        toggleFavoriteStatus: toggleFavoriteStatus,
      ),
    );
  }
}
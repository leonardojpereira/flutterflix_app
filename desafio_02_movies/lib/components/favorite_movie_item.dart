import 'dart:convert';
import 'package:desafio_02_movies/colors.dart';
import 'package:desafio_02_movies/constants.dart';
import 'package:desafio_02_movies/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMovieItem extends StatefulWidget {
  const FavoriteMovieItem({
    super.key,
  });

  @override
  State<FavoriteMovieItem> createState() => _FavoriteMovieItemState();
}

class _FavoriteMovieItemState extends State<FavoriteMovieItem> {
  List<Movie> favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    getFavoriteMovies();
  }

  Future<void> getFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favoriteMovies');
    if (favoriteIds != null) {
      List<Movie> movies = [];
      for (String id in favoriteIds) {
        String? movieJson = prefs.getString(id);
        if (movieJson != null) {
          Map<String, dynamic> movieMap = jsonDecode(movieJson);
          Movie movie = Movie.fromJson(movieMap);
          if (!movies.any((element) => element.id == movie.id)) {
            movies.add(movie);
          }
        }
      }
      setState(() {
        favoriteMovies = movies;
      });
    }
  }

  Future<void> removeFavoriteMovie(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIds = prefs.getStringList('favoriteMovies');
    if (favoriteIds != null) {
      favoriteIds.remove(id);
      await prefs.setStringList('favoriteMovies', favoriteIds);
      await prefs.remove(id);
      getFavoriteMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
      child: favoriteMovies.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your favorite list is empty.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colours.secondaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8),
                          child: Text(
                            'See movies',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        )),
                    onTap: () => Navigator.pop(context),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                Movie movie = favoriteMovies[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          child: Image.network(
                            '${Constants.imagePath}${movie.posterPath}',
                            width: 100,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                          Text(
                            movie.releaseDate,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: movie.voteAvarage / 2,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 24,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 72.0, bottom: 22),
                                child: IconButton(
                                  onPressed: () {
                                    removeFavoriteMovie(movie.id.toString());
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
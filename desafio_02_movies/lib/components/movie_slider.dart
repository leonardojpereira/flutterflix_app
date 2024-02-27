import 'package:desafio_02_movies/core/singletons/utils/constants.dart';
import 'package:desafio_02_movies/modules/movies/models/movie.dart';
import 'package:desafio_02_movies/modules/movies/pages/details_screen.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.movie,
  });

  final List<Movie> movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movie.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie[index]),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 150,
                  height: 200,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${movie[index].posterPath}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

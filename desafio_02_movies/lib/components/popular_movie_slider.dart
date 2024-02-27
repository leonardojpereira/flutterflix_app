import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_02_movies/core/singletons/utils/constants.dart';
import 'package:desafio_02_movies/modules/movies/models/models.dart';
import 'package:desafio_02_movies/modules/movies/pages/details_screen.dart';
import 'package:flutter/material.dart';

class PopularMovieSlider extends StatelessWidget {
  const PopularMovieSlider({
    super.key,
    required this.movie,
  });

  final List<Movie> movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: movie.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie: movie[itemIndex]),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 300,
                height: 200,
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${movie[itemIndex].posterPath}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
